package com.itbank.navercafe.admin.registergrade.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.mybatis.board.AdminBoardMapper;

@Service
public class RegisterGradeServiceimpl implements RegisterGradeService {
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
	public void unbanMembers2(String unbanMembers) {
		ArrayList<String> idList = nameSort(unbanMembers);
		System.out.println("unbanMembers idList size = " + idList.size());
		System.out.println("unbanMembers 1st id = " + idList.get(0));
	}

	@Override
	// 자동회원가입x 일때 회원가입 시켜주기
	public String acceptMembers(String acceptMembers) {
		ArrayList<String> idList = nameSort(acceptMembers);
		
		int result = 0;
		// request table 에서 삭제
		for(int i = 0; i < idList.size(); i++) {
			result += mapper.deleteRequest(idList.get(i));
		}
		
		// 카페 회원가입 수정필요
		for(int i = 0; i< idList.size(); i++) {
			result += mapper.acceptMembers(idList.get(i));
		}
		
		String url, msg;
		if(result == idList.size()*2) {
			msg = "가입이 승인 되었습니다";
			url = "manageRegisterRequest";
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageRegisterRequest";
		}
		
		return getMessage(msg,url);
	}

	@Override
	// 자동회원가입x 일때 회원가입 거절
	public String rejectMembers(String rejectMembers, HttpServletRequest req) {
		String url, msg;
		msg = rejectMembers+" 의 가입이 거절 되었습니다";
		url = "manageRegisterRequest";
		
		System.out.println("가입거절성공");
		return getMessage(msg,url);
		/*
		int result = 0;
		
		for(int i = 0; i < idList.size(); i++) {
			result += mapper.deleteRequest(idList.get(i));
		}
		
		String url, msg;
		if(result == idList.size()) {
			msg = "가입이 거절 되었습니다";
			url = "manageRegisterRequest";
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageRegisterRequest";
		}
		
		*/
		
	}
	
	

}
