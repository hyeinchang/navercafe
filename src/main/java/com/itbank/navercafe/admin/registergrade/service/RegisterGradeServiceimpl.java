package com.itbank.navercafe.admin.registergrade.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
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

	@Override
	public String modifyRegisterInfo(List<MembersGradeDTO> update) {
		//삭제 여부에 따라 cafeUserGrade 를 제외한 모든 값초기화
		for(int i = 0; i<update.size(); i++) {
			if(update.get(i).getCutRemoved().equals("true")) {
				update.get(i).setCutBoard(0);
				update.get(i).setCutDesc("");
				update.get(i).setCutName("");
				update.get(i).setCutReply(0);
				update.get(i).setCutType(1)	;
				update.get(i).setCutVisit(0);
			}
		}
		
		int result = 0;
		for(int i = 0; i<update.size(); i++) {
			//count += mapper.modifyRegisterInfo(result.get(i));
			result++;
		}
		if (result == update.size()) {
			return "성공인듯";
		} else {
			return "업데이트 문제생김;;";
		}
		
	}

}
