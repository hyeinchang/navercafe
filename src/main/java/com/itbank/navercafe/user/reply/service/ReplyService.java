package com.itbank.navercafe.user.reply.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;



public interface ReplyService {
	public Integer getReplyCount(int boardNum);
	public List<HashMap<String, Object>> getReplyList(int boardNum,String cafeId);
	public void saveReply(MultipartHttpServletRequest mul,int step);
	public int getReplyNum() throws Exception;
	public int insertReply(ReplyDTO replyDTO) throws Exception;
	public List<ReplyDTO> getSearchReplyList(MenuDTO menuDTO) throws Exception;
}
