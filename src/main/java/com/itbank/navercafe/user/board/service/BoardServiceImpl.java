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



@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper bm;
	@Autowired FileMapper fm;
	
	
	//전체목록인데 수영이형이랑 상의.
	@Override
	public ArrayList<BoardExtendDTO> getBoardList(MenuDTO menuDTO) {
	
		return bm.getBoardList(menuDTO);
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
			model.addAttribute("like","T");
		}else {
			model.addAttribute("like","F");
		}
	}

	@Override
	public void topList(Model model) {
		model.addAttribute("topList",bm.topList());
		//System.out.println(bm.topList());
	}

	@Override
	public void getFileList(Model model) {
		ArrayList<FileDTO> list=fm.getFileList();
		for(int i=0 ; i<list.size();i++) {
//			System.out.println("파일 고유 번호 :"+list.get(i).getFileNum());
//			System.out.println("사진 정보 :"+list.get(i).getFileOrgName());
//			System.out.println("replyNum :"+list.get(i).getReplyNum());
//			System.out.println("userImageNum :"+list.get(i).getCafeUserImageNum());
		}
		model.addAttribute("fileList",fm.getFileList());
	}

	
	@Override
	public BoardDTO getUserBoard(int boardNum, MenuDTO menuDTO,Model model,int pageNum) {
		String cafeId = menuDTO.getCafeId();
		int boardMenuNum = menuDTO.getBoardMenuNum();
		
		//System.out.println("페이지넘버 : " + pageNum);
		if(pageNum == 0) {
			pageNum++;
		}
		// 이전글 다음글 
		ArrayList<BoardExtendDTO> listChk= bm.getBoardList(menuDTO);
		int j = 0;
		for(j=0; j<listChk.size();j++) {
			//System.out.println("j 마지막 값 구하기");
		}
		if(boardNum==listChk.get(j-1).getBoardNum()) {
			model.addAttribute("Next",false);
		}else if(boardNum==listChk.get(0).getBoardNum()){
			model.addAttribute("Preview",false);
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


}

	
	


