package com.itbank.navercafe.admin.memberstaff.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.mybatis.board.AdminBoardMapper;

@Service
public class AdminMemberStaffServiceImpl implements AdminMemberStaffService{
	@Autowired AdminBoardMapper mapper;
	
	//받아온 id들 정리해서 arraylist 로 리턴
	public ArrayList<String> nameSort(String ids) {
		ArrayList<String> idList = new ArrayList<>();
		
		if(ids.contains("/")) {
			String[] arr = ids.split("/");
			for(int i = 0; i < arr.length; i++) {
				idList.add(arr[i]);
			}
		} else {
			idList.add(ids);
		}
		return idList;
	}
	
	public String getMessage(String msg, String url) {
		String message = "";
		message += "<script>alert('"+msg+"');";
		message += "location.href='"+url+"';</script>";
		return message;
	}
	
	@Override
	// id와 변경될 등급 하나 더 넘어와야됨
	public String modifyMembers(String modifyMembers) {
		ArrayList<String> idList = nameSort(modifyMembers);
		
		
		String msg,url;
		return getMessage(msg,url);
	}

	@Override
	// id 값으로 회원 강제 탈퇴
	public String deportMembers(String deportMembers) {
		ArrayList<String> idList = nameSort(deportMembers);
		
		String msg, url;
		int result = 0;
		
		for(String userId : idList) {
			result += mapper.deportMembers(userId);
		}
		
		if(result == idList.size()) {
			msg = "강제탈퇴가 완료되었습니다";
			url = "manageAllMembers";
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageAllMembers";
		}
		
		return getMessage(msg,url);
	}

	@Override
	public String emailMembers(String emailMembers) {
		ArrayList<String> idList = nameSort(emailMembers);
		
		String msg,url;
		return getMessage(msg,url);
	}

	@Override
	// id값으로 가입불가 해제
	public String unbanMembers(String unbanMembers) {
		ArrayList<String> idList = nameSort(unbanMembers);
		
		String msg,url;
		return getMessage(msg,url);
	}

	@Override
	// id값으로 가입불가 지정 + 사유값 들어와야함
	public String banMembers(String banMembers) {
		ArrayList<String> idList = nameSort(banMembers);
		
		String msg, url;
		return getMessage(msg,url);
		
	}

}
