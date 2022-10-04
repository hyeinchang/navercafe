package com.itbank.navercafe.admin.cafemanager.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.admin.cafemanager.mapper.AdminCafeManagerMapper;

@Service
public class AdminCafeManagerServiceImpl implements AdminCafeManagerService{
	@Autowired
	AdminCafeManagerMapper mapper;

	@Override
	public String changeManager(String cafeId, String searchResult) {
		Map<String, String> map = new HashMap<>();
		map.put("cafeId", cafeId);
		map.put("newManager", searchResult);
		int result = mapper.changeManager(map);
		return "";
	}

	@Override
	public String searchId(String id, String cafeId) {
		Map<String, String> map = new HashMap<>();
		map.put("cafeId", cafeId);
		map.put("userId", id);
		int result = mapper.searchId(map);
		
		if(result == 1) {
			return id+1;
		} else {
			return id+0;
		}
	}

	@Override
	public String searchNickname(String nickname, String cafeId) {
		Map<String, String> map = new HashMap<>();
		map.put("cafeId", cafeId);
		map.put("nickname", nickname);
		int result = mapper.searchNickname(map);
		
		if(result == 1) {
			return nickname+1;
		} else {
			return nickname+0;
		}
	}
}
