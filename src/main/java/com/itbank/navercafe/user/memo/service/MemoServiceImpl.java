package com.itbank.navercafe.user.memo.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.mybatis.cafemember.CafeMemberMapper;
import com.itbank.navercafe.mybatis.memo.MemoMapper;


@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoMapper memoMap;
	@Autowired CafeMemberMapper memoCafeMap;

	@Override
	public List<HashMap<String, Object>> getMemoList() {
		List<HashMap<String, Object>>map=memoMap.getMemoList();
		return map;
	}

	@Override
	public List<HashMap<String, Object>> getReplyList() {
		return memoMap.getReplyList();
	}
	
	

}
