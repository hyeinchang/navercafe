package com.itbank.navercafe.user.memo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface MemoService {
	public List<HashMap<String, Object>> getMemoList();
	public List<HashMap<String, Object>> getReplyList();
	public void saveMemoReply(MultipartHttpServletRequest mul, int step);
	public void memoSave(HttpServletRequest res);
}
