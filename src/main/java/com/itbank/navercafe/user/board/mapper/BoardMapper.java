package com.itbank.navercafe.user.board.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


import com.itbank.navercafe.user.board.dto.BoardDTO;
import com.itbank.navercafe.user.board.dto.LikesDTO;



public interface BoardMapper {
	//전체목록인데 수영이형이랑 상의.
	public ArrayList<BoardDTO> getBoardList();
	//보드 넘에 따른 게시물
	public BoardDTO getUserBoard(int boardNum);
	//페이징 사용 안하면.
	//public List<HashMap<String,Object>> getPrefixList(String boardPrefix);
	//페이징 사용시 말머리에 관한 리스트
	public List<HashMap<String,Object>> getPrefixList(@Param("boardPrefix") String boardPrefix,
					@Param("start") int start,@Param("end")int end);
	//말머리에 따른 게시물들이 몇개인지
	public int selectBoardCount(String getBoardPrefix);
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
	
}
