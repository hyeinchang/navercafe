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
	public String modifyMembersGrade(List<MembersGradeDTO> update) {
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
			//count += mapper.modifyMembersGrade(result.get(i));
			//count += mapper.
			result++;
		}
		if (result == update.size()) {
			return "성공인듯";
		} else {
			return "업데이트 문제생김;;";
		}
		
	}
	
	@Override
	public String modifyRegisterInfo(RegisterInfoDTO dto) {
		settingJoinAge(dto);
		modifyQuestions(dto);
		
		
		
		// int result = mapper.modifyRegisterInfo(dto);
		/*
		String url, msg;
		if(result == 1) {
			msg = "성공적으로 반영되었습니다";
			url = "manageRegisterRequest";
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageRegisterInfo";
		}
		
		return getMessage(msg,url);
		*/
		return null;
	}
	
	
	public void settingJoinAge(RegisterInfoDTO dto) {
		String yearCombine = "";
		
		if( dto.getSelectYear1() > dto.getSelectYear2()) {
			int temp = dto.getSelectYear1();
			dto.setSelectYear1(dto.getSelectYear2());
			dto.setSelectYear2(temp);
		}
		yearCombine += dto.getSelectYear1();
		yearCombine += "~";
		yearCombine += +dto.getSelectYear2();
		
		dto.setCafeJoinAge(yearCombine);
	}
	
	
	public void modifyQuestions(RegisterInfoDTO dto) {
		/*
		int questionQty = 0;
		if(dto.getQ3Content() != null ) {
			questionQty = 3;
		} else if(dto.getQ2Content() != null) {
			questionQty = 2;
		} else if(dto.getQ1Content() != null) {
			questionQty = 1;
		} else if(dto.getQ1Content() == null) {
			questionQty = 0;
		}
		
		ArrayList<String> qlist = new ArrayList<>();
		for(int i = 1; i <= questionQty; i++) {
			switch(i) {
			case 1 : qlist.add(dto.getQ1Content());
				break;
			case 2 : qlist.add(dto.getQ2Content());
				break;
			case 3 : qlist.add(dto.getQ3Content());
				break;
			}
		}
		
		int countQuestion = mapper.countQuestion(cafeId);
		//count = select count(*) from project_join_question where cafe_id = #{cafeId} 
		
		switch(countQuestion) {
			case 0 : // 등록된 질문 x, insert 3번
				for( int i = 0; i < qlist.size() ; i++ ) {
					JoinQuestionDTO dto = new JoinQuestionDTO;
					dto.setCafeId(dto.getCafeId());
					dto.setcafeQuestionContent(qlist.get(i));
					dto.setcafeQuestionNum(i+1);
					
					mapper.insertQuestion(dto);
				}
				break;
				
			case 1 : // 1번 질문이 존재(업데이트), 23번 추가
				for( int i = 0; i < qlist.size() ; i++ ) {
					if(i == 0) {
						JoinQuestionDTO dto = new JoinQuestionDTO;
						dto.setCafeId(dto.getCafeId());
						dto.setcafeQuestionContent(qlist.get(i));
						dto.setcafeQuestionNum(i+1);
						mapper.updateQuestion(dto);
					} else {
						JoinQuestionDTO dto = new JoinQuestionDTO;
						dto.setCafeId(dto.getCafeId());
						dto.setcafeQuestionContent(qlist.get(i));
						dto.setcafeQuestionNum(i+1);
						mapper.insertQuestion(dto);
					}
				}
				break;
				
			case 2 : // 1,2번 질문 업데이트, 3번 추가
				for( int i = 0; i < qlist.size() ; i++ ) {
					if(i <= 1) {
						JoinQuestionDTO dto = new JoinQuestionDTO;
						dto.setCafeId(dto.getCafeId());
						dto.setcafeQuestionContent(qlist.get(i));
						dto.setcafeQuestionNum(i+1);
						mapper.updateQuestion(dto);
					} else {
						JoinQuestionDTO dto = new JoinQuestionDTO;
						dto.setCafeId(dto.getCafeId());
						dto.setcafeQuestionContent(qlist.get(i));
						dto.setcafeQuestionNum(i+1);
						mapper.insertQuestion(dto);
					}
				}
				break;
				
			case 3 : // 1,2,3번 질문 업데이트
				for( int i = 0; i < qlist.size() ; i++ ) {
					JoinQuestionDTO dto = new JoinQuestionDTO;
					dto.setCafeId(cafeId);
					dto.setcafeQuestionContent(qlist.get(i));
					dto.setcafeQuestionNum(i+1);
					mapper.updateQuestion(dto);
				}
				break;
		}
	 */
	}

}
