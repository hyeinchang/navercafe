package com.itbank.navercafe.user.board.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.itbank.navercafe.user.board.dto.BoardDTO;


public interface BoardService {
	//게시글 리스트
	public ArrayList<BoardDTO> getBoardList();
	//public BoardDTO getUserBoard(int boardNum);
	
	//게시글 가져오기
	public BoardDTO getUserBoard(int boardNum, Model model,int pageNum);
	
	//조회수
	public void hit(int boardNum,int num);
	
	//좋아요 체크
	public void likeChk(int boardNum,String userId,Model model);
	
	public void likeViewChk(int boardNum,String userId,Model model);
	
	//인기글 리스트
	public void topList(Model model);

}
