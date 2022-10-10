package com.itbank.navercafe.user.board.service;

import java.util.List;

import org.springframework.ui.Model;

import com.itbank.navercafe.user.board.dto.BoardDTO;
import com.itbank.navercafe.user.board.dto.BoardExtendDTO;
import com.itbank.navercafe.user.menu.dto.MenuDTO;


public interface BoardService {

	//게시글 가져오기
	public BoardDTO getUserBoard(int boardNum,int boardMenuNum, Model model,int pageNum, String cafeId,int next,int preview);

	public List<BoardExtendDTO> getBoardList(MenuDTO menuDTO);
	
	// 페이징 & 검색 처리된 게시글
	public List<BoardExtendDTO> getBoardList_paging(MenuDTO menuDTO) throws Exception;
	public int getBoardTotalCount(MenuDTO menuDTO) throws Exception;
	
	//조회수
	public void hit(int boardNum,int num);
	
	//좋아요 체크
	public void likeChk(int boardNum,String userId,Model model);
	
	//게시물에서 좋아요 체크
	public void likeViewChk(int boardNum,String userId,Model model);
	
	//인기글 리스트
	public void topList(Model model,String cafeId);
	
	//파일테이블리스트
	public void getFileList(Model model);
	
	public int insertBoard(BoardDTO boardDTO) throws Exception;
	
	public int checkGradeBoard(BoardExtendDTO boardExtDTO) throws Exception;
	
	public void deleteBoard(int boardNum);
	
	public void deleteReply(int replyNum);
}
