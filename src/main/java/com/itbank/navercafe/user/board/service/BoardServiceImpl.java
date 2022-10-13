package com.itbank.navercafe.user.board.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.mapper.FileMapper;
import com.itbank.navercafe.user.board.dto.BoardDTO;
import com.itbank.navercafe.user.board.dto.BoardExtendDTO;
import com.itbank.navercafe.user.board.mapper.BoardMapper;
import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;
import com.itbank.navercafe.user.reply.mapper.ReplyMapper;
import com.itbank.navercafe.user.reply.service.ReplyService;



@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper bm;
	@Autowired FileMapper fm;
	@Autowired
	private ReplyService replyService;
	
	
	//전체목록인데 수영이형이랑 상의.
	@Override
	public List<BoardExtendDTO> getBoardList(MenuDTO menuDTO) {
		List<BoardExtendDTO> boardList = null;
		
		try {
			boardList = bm.getBoardList(menuDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}


	@Override
	public void hit(int boardNum,int num) {
		if(num == 0) {
			bm.hitUp(boardNum);
		}
	}

	
	//					좋아요
	
	@Override
	public void likeChk(int boardNum, String userId,Model model) {
		//System.out.println("서비스 : "+boardNum+" - "+userId);
		//우선 좋아요 리스트 받아오기
		if(bm.getLikesList(boardNum,userId)==null) {
			bm.likeUp(boardNum);
			//System.out.println("좋아요 테이블에 추가 :"+ boardNum);
			//System.out.println("좋아요 테이블에 추가 :"+ userId);
			bm.insertLike(boardNum, userId);
			model.addAttribute("like","T");
		}else {
			bm.likeDown(boardNum);
			bm.deleteLike(boardNum, userId);
			model.addAttribute("like","F");
		}
	}
	//유저에 따른 좋아요 여부
	@Override
	public void likeViewChk(int boardNum, String userId,Model model) {
		if(bm.getLikesList(boardNum,userId)==null) {
			//System.out.println("좋아요 테이블 조회 결과 T :"+bm.getLikesList(boardNum,userId));
			model.addAttribute("like","T");
		}else {
			//System.out.println("좋아요 테이블 조회 결과 F :"+bm.getLikesList(boardNum,userId));
			model.addAttribute("like","F");
		}
	}

	@Override
	public void topList(Model model, String cafeId) {
		model.addAttribute("topList",bm.topList(cafeId));
		//System.out.println(bm.topList());
	}

	
	@Override
	public BoardDTO getUserBoard(int boardNum,int boardMenuNum,Model model,int pageNum,String cafeId,int next,int preview) {


		//System.out.println("페이지넘버 : " + pageNum);
		if(pageNum == 0) {
			pageNum++;
		}
		
		BoardDTO dto = bm.getUserBoard(boardNum);
		SimpleDateFormat date = new SimpleDateFormat("YYYY.MM.dd");
		//말머리 이용해서 날짜 형식 포멧 후 리스트 출력
		
		//보드 넘버에 따른 보드 정보 가져오기
		MenuDTO menudto = bm.getBoardMenuType(boardMenuNum);
		model.addAttribute("boardMenuType",bm.getBoardMenuType(boardMenuNum));
		
		
		int pageLetter = 5;
		
		//BoardMenuNum 을 가지고 있는 보드 갯수 세오기
		int allCount = bm.selectBoardCount(dto.getBoardMenuNum());
		//System.out.println("머리말별 게시글수 : "+allCount);
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter !=0) {
			repeat +=1;
		}
		int end = pageNum * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat",repeat);
		
		//System.out.println("start 값 : "+start );
		//System.out.println("end 값 : "+end );
		
		//보드타입에따른 리스트 가져오기
		List<HashMap<String,Object>> list = 
				bm.getBoardMenuTypeList(menudto.getBoardMenuNum(),menudto.getCafeId(),start,end);
		for(int i=0;i<list.size();i++) {
			String d= date.format(list.get(i).get("BOARD_SAVEDATE"));
			list.get(i).put("BOARD_SAVEDATE", d);
			//System.out.println(i+"번째"+list.get(i).get("BOARD_SAVEDATE"));
			//System.out.println(i+"번째"+list.get(i).get("BOARD_TITLE"));
		}
		model.addAttribute("boardMenuTypeList",list);
		//System.out.println("prefixList란 이름으로 넘겨주는 값들 : "+list);
		
		
		ArrayList<BoardDTO> boardNumList = bm.getBoardNumList(boardMenuNum);
		int j=0;
		for(j = 0;j<boardNumList.size();j++) {
			//System.out.println(j+"번째 게시물 번호 : "+boardNumList.get(j).getBoardNum());
		}
		if(boardNum==boardNumList.get(j-1).getBoardNum()) {
			//System.out.println("다음은없어");
			model.addAttribute("Next",false);
		}
		if(boardNum==boardNumList.get(0).getBoardNum()) {
			//System.out.println("이전글은없어");
			model.addAttribute("Preview",false);
		}
		
		//System.out.println("들어온 boardNum : "+boardNum);

		if(next==1) {
			System.out.println("다음 클릭");
			for(int i= 0 ; i<boardNumList.size();i++) {
				if(boardNum==boardNumList.get(i).getBoardNum()) {
					dto.setBoardNum(boardNumList.get(i+1).getBoardNum());
					//System.out.println("다음 눌러서 바뀐보드넘:"+dto.getBoardNum());
				}
			}
			
		}
		
		if(preview==1) {
			System.out.println("이전 클릭");
			for(int i=0 ; i<boardNumList.size();i++) {
				if(boardNum==boardNumList.get(i).getBoardNum()) {
					dto.setBoardNum(boardNumList.get(i-1).getBoardNum());
					//System.out.println("이전 눌러서 바꿔줄 보드넘:"+dto.getBoardNum());

				}
			}
		}
		//System.out.println("그래서 최종 보드넘:"+dto.getBoardNum());
		return dto;
	}

	@Override
	public int insertBoard(BoardDTO boardDTO) throws Exception {
		return bm.insertBoard(boardDTO);
	}

	@Override
	public int checkGradeBoard(BoardExtendDTO boardExtDTO) throws Exception {
		return bm.checkGradeBoard(boardExtDTO);
	}


	@Override
	public void deleteBoard(int boardNum) {
		bm.deleteBoard(boardNum);
	}


	@Override
	public void deleteReply(int replyNum) {
		bm.deleteReply(replyNum);
	}


	@Override
	public List<BoardExtendDTO> getBoardList_paging(MenuDTO menuDTO) throws Exception {
		List<BoardExtendDTO> boardList = null;
		
		try {
			List<ReplyDTO> replyList = replyService.getSearchReplyList(menuDTO);
			boardList = bm.getBoardList_paging(menuDTO);
			
			// 리플 목록 설정
			for(BoardExtendDTO extendDTO : boardList) {
				List<ReplyDTO> boardReplyList = new ArrayList<>();
				int replyCount = 0;
				
				for(ReplyDTO replyDTO : replyList) {
					if(extendDTO.getBoardNum() == replyDTO.getBoardNum()) {
						boardReplyList.add(replyDTO);
						replyCount++;
					}
				}
				
				extendDTO.setReplyCount(replyCount);
				extendDTO.setReplyList(boardReplyList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}


	@Override
	public int getBoardTotalCount(MenuDTO menuDTO) throws Exception {
		int totalCount = 0;
		
		try {
			totalCount = bm.getBoardTotalCount(menuDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}


	@Override
	public BoardExtendDTO getExtendBoard(int boardNum) throws Exception {
		BoardExtendDTO extendDTO = null;
		
		try {
			extendDTO = bm.getExtendBoard(boardNum);
			List<ReplyDTO> replyList = replyService.getBoardReplyList(boardNum);
			
			// 리플 목록 설정
			if(replyList != null) {
				extendDTO.setReplyCount(replyList.size());
				extendDTO.setReplyList(replyList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return extendDTO;
	}


	@Override
	public int updateBoard(BoardDTO boardDTO) throws Exception {
		int result = 0;
		try {
			result = bm.updateBoard(boardDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public int deleteBoard_returnResult(int boardNum) throws Exception {
		int result = 0;
		try {
			// 리플 목록 삭제
			replyService.deleteReplyList(boardNum);
			result = bm.deleteBoard_returnResult(boardNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}

	
	


