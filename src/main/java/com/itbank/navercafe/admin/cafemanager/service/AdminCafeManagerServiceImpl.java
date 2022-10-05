package com.itbank.navercafe.admin.cafemanager.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.admin.cafemanager.mapper.AdminCafeManagerMapper;
import com.itbank.navercafe.admin.memberstaff.mapper.AdminMemberStaffMapper;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Service
public class AdminCafeManagerServiceImpl implements AdminCafeManagerService{
	@Autowired
	AdminMemberStaffMapper amsMapper;
	@Autowired 
	AdminCafeManagerMapper cafeManagerMapper;
	
	public String getMessage(String msg, String url) {
		String message = "";
		message += "<script>alert('"+msg+"');";
		message += "location.href='"+url+"';</script>";
		return message;
	}
	

	@Override
	public int updateBasicInfo(CafeDTO cafeDTO) throws Exception {
		return cafeManagerMapper.updateBasicInfo(cafeDTO);
	}

	@Override
	public String changeManager(String cafeId, String searchResult) {
		String oldManager = amsMapper.getManagerId(cafeId);
		Map<String, String> map = new HashMap<>();
		map.put("cafeId", cafeId);
		map.put("newManager", searchResult.trim());
		map.put("oldManager", oldManager);
		int result = 0;
		result += cafeManagerMapper.changeManager(map);
		result += cafeManagerMapper.changeOldManagerGrade(map);
		result += cafeManagerMapper.changeNewManagerGrade(map);
		
		String msg, url;
		if(result == 3) {
			msg = "성공적으로 반영되었습니다";
			url = "layoffManager?cafeId="+cafeId;
		} else {
			msg = "오류가 발생했습니다!";
			url = "layoffManager?cafeId="+cafeId;
		}
	
		return getMessage(msg,url);
	}

	@Override
	public String searchId(String id, String cafeId) {
		Map<String, String> map = new HashMap<>();
		map.put("cafeId", cafeId);
		map.put("userId", id);
		int result = cafeManagerMapper.searchId(map);
		
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
		int result = cafeManagerMapper.searchNickname(map);
		
		if(result == 1) {
			return nickname+1;
		} else {
			return nickname+0;
		}
	}

}
