package com.itbank.navercafe.user.board.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itbank.navercafe.user.board.dto.BoardDTO;
import com.itbank.navercafe.user.board.mapper.BoardMapper;



@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper bm;
	
	
	//전체목록인데 수영이형이랑 상의.
	@Override
	public ArrayList<BoardDTO> getBoardList() {
		return bm.getBoardList();
	}
	
//	@Override
//	public BoardDTO getUserBoard(int boardNum,Model model) {
//		// 이전글 다음글 
//		ArrayList<BoardDTO> listChk= bm.getBoardList();
//		int j = 0;
//		for(j=0; j<listChk.size();j++) {
//			System.out.println("j 마지막 값 구하기");
//		}
//		if(boardNum==listChk.get(j-1).getBoardNum()) {
//			model.addAttribute("Next",false);
//		}else if(boardNum==listChk.get(0).getBoardNum()){
//			model.addAttribute("Preview",false);
//		}
//		
//		BoardDTO dto = bm.getUserBoard(boardNum);
//		SimpleDateFormat date = new SimpleDateFormat("YYYY.MM.dd");
//		//말머리 이용해서 날짜 형식 포멧 후 리스트 출력
//		List<HashMap<String,Object>> list =bm.getPrefixList(dto.getBoardPrefix());
//		for(int i=0;i<list.size();i++) {
//			String d= date.format(list.get(i).get("BOARD_SAVEDATE"));
//			list.get(i).put("BOARD_SAVEDATE", d);
//			System.out.println(i+"번째"+list.get(i).get("BOARD_SAVEDATE"));
//			System.out.println(i+"번째"+list.get(i).get("BOARD_TITLE"));
//		}
//		model.addAttribute("prefixList",list);
//		return dto;
//	}
	

	
	@Override
	public BoardDTO getUserBoard(int boardNum,Model model,int pageNum) {
		
		//System.out.println("페이지넘버 : " + pageNum);
		if(pageNum == 0) {
			pageNum++;
		}
		// 이전글 다음글 
		ArrayList<BoardDTO> listChk= bm.getBoardList();
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
		
		int pageLetter = 5;
		int allCount = bm.selectBoardCount(dto.getBoardPrefix());
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
		List<HashMap<String,Object>> list = bm.getPrefixList(dto.getBoardPrefix(),start,end);
		for(int i=0;i<list.size();i++) {
			String d= date.format(list.get(i).get("BOARD_SAVEDATE"));
			list.get(i).put("BOARD_SAVEDATE", d);
			//System.out.println(i+"번째"+list.get(i).get("BOARD_SAVEDATE"));
			//System.out.println(i+"번째"+list.get(i).get("BOARD_TITLE"));
		}
		model.addAttribute("prefixList",list);
		//System.out.println("prefixList란 이름으로 넘겨주는 값들 : "+list);
		
		//유저에 따른 좋아요 여부
		return dto;
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
}

	
	


