package com.itbank.navercafe.mybatis.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.itbank.navercafe.user.board.dto.BoardDTO;
import com.itbank.navercafe.user.board.dto.LikesDTO;


@Repository
public interface BoardMapper {
	public ArrayList<BoardDTO> getBoardList();
	public BoardDTO getUserBoard(int boardNum);
	//public List<HashMap<String,Object>> getPrefixList(String boardPrefix);
	
	public List<HashMap<String,Object>> getPrefixList(@Param("boardPrefix") String boardPrefix,
					@Param("start") int start,@Param("end")int end);
	public int selectBoardCount(String getBoardPrefix);
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
