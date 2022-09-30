package com.itbank.navercafe.user.board.service;


import java.util.ArrayList;

import org.springframework.ui.Model;

import com.itbank.navercafe.user.board.dto.BoardDTO;


public interface BoardService {
	//전체목록인데 수영이형이랑 상의.
	public ArrayList<BoardDTO> getBoardList(String cafeId);
	
	//게시글 가져오기
	public BoardDTO getUserBoard(int boardNum,int boardMenuNum, Model model,int pageNum, String cafeId);
	
	//조회수
	public void hit(int boardNum,int num);
	
	//좋아요 체크
	public void likeChk(int boardNum,String userId,Model model);
	
	//게시물에서 좋아요 체크
	public void likeViewChk(int boardNum,String userId,Model model);
	
	//인기글 리스트
	public void topList(Model model);
	
	//파일테이블리스트
	public void getFileList(Model model);
	

}
