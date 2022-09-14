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
		return "";
		//return getMessage(msg,url);
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
		return "";
//		return getMessage(msg,url);
	}

	@Override
	// id값으로 블랙리스트에서 아이디 삭제 + 카페아이디 필요
	public String unbanMembers(String unbanMembers) {
		ArrayList<String> idList = nameSort(unbanMembers);
		
		int result = 0;
		String msg,url;
		
		for(int i = 0; i < idList.size(); i++) {
			result += mapper.unbanMembers(idList.get(i)); // (idList.get(i),cafeId)
		}
		
		if(result == idList.size()) {
			msg = "재가입 가능한 멤버로 변경하였습니다.";
			url = "manageDeportedMembers";
		} else {
			msg = "오류가 발생했습니다";
			url = "manageDeportedMembers";
		}
		
		return getMessage(msg, url);
	}

	@Override
	// id값으로 블랙리스트 등록 + cafeid + 사유
	public String banMembers(String banMembers) {
		ArrayList<String> idList = nameSort(banMembers);
		
		int result = 0;
		String msg, url;
		
		for(int i = 0; i< idList.size(); i++) {
			result += mapper.banMembers(idList.get(i)); // (idList.get(i), cafeId, reason)
		}
		
		if(result == idList.size()) {
			msg = "성공적으로 반영 되었습니다..";
			url = "manageDeportedMembers";
		} else {
			msg = "오류가 발생했습니다";
			url = "manageDeportedMembers";
		}
		
		return getMessage(msg,url);
	}

}
