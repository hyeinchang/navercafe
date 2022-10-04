package com.itbank.navercafe.user.reply.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;



public interface ReplyService {
	public Integer getReplyCount(int boardNum);
	public List<HashMap<String, Object>> getReplyList(int boardNum,String cafeId);
	public void saveReply(MultipartHttpServletRequest mul,int step);
}
