package com.itbank.navercafe.user.board.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itbank.navercafe.user.board.dto.BoardDTO;
import com.itbank.navercafe.user.board.dto.LikesDTO;
import com.itbank.navercafe.user.menu.dto.MenuDTO;



public interface BoardMapper {
	//전체목록인데 수영이형이랑 상의.
	public ArrayList<BoardDTO> getBoardList(MenuDTO menuDTO);
	//보드 넘에 따른 게시물
	public BoardDTO getUserBoard(int boardNum);

	//말머리에 따른 게시물들이 몇개인지
	public int selectBoardCount(int boardMenuNum);
	//조회수 
	public void hitUp(int boardNum);
	
	// 좋아요 테이블에 보드 넘버 ,유저아이디 넘겨줘서 있는지 없는지 확인
	public LikesDTO getLikesList(@Param("boardNum")int boardNum,@Param("userId")String userId);
	
	//    좋아요 +1 likes 테이블에 정보추가
	public void likeUp(int boardNum);
	public void insertLike(@Param("boardNum")int boardNum,@Param("userId")String userId);
	
	//  좋아요 -1 likes 테이블에 정보제거
	public void likeDown(int boardNum);
	public void deleteLike(@Param("boardNum")int boardNum,@Param("userId")String userId);
	
	//인기글
	public List<HashMap<String, Object>> topList();
	
	//보드 타입 가져오기
	public MenuDTO getBoardMenuType(int boardMenuNum);
	

	//보드 타입에 따른 리스트
	public List<HashMap<String, Object>>getBoardMenuTypeList
	(@Param("boardMenuNum")int boardMenuNum,@Param("cafeId")String cafeId,
			@Param("start") int start,@Param("end")int end);
	
	public int insertBoard(BoardDTO boardDTO) throws Exception;
	
}
