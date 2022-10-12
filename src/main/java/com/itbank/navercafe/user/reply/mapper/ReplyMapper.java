package com.itbank.navercafe.user.reply.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;


public interface ReplyMapper {
	//댓글 수 세오기
	public Integer getReplyCount(int boardNum);
	//댓글 리스트 가져오기
	public List<HashMap<String, Object>> getReplyList(@Param("boardNum")int boardNum,
			@Param("cafeId")String cafeId);
	//댓글
	public int saveReply(ReplyDTO dto);
	//답글
	public void saveGroupNumReply(ReplyDTO dto);
	//replyNum 시퀀스값 
	public int getReplyNum();
	
	// 검색된 답글 리스트를 가져옴
	public List<ReplyDTO> getSearchReplyList(MenuDTO menuDTO) throws Exception;
	
	public int insertReply(ReplyDTO replyDTO) throws Exception;
	
	public int getMaxStep(ReplyDTO replyDTO) throws Exception;
	
	public int updateReplyStep(ReplyDTO replyDTO) throws Exception;
}

