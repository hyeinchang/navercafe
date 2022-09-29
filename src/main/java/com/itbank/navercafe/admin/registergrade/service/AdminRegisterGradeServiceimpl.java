package com.itbank.navercafe.admin.registergrade.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itbank.navercafe.admin.registergrade.dto.GradeUpAppliesDTO;
import com.itbank.navercafe.admin.registergrade.dto.JoinQuestionDTO;
import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
import com.itbank.navercafe.admin.registergrade.mapper.AdminRegisterGradeMapper;

@Service
public class AdminRegisterGradeServiceimpl implements AdminRegisterGradeService {
	@Autowired AdminRegisterGradeMapper mapper;
	
	//받아온 id 들 정리해서 arraylist 생성 및 map 생성 후 cafeid, userid 키값에 맞춰 mapList 리턴
	public ArrayList< Map<String, String> > nameSort(String ids, String cafeId) {
	
		//idList 에 id들 정렬
		ArrayList<String> idList = new ArrayList<>();
		if(ids.contains("/")) {
			String[] idArr = ids.split("/");
			for(int i = 0; i < idArr.length; i++) {
				idList.add(idArr[i]);
			}
		} else {
			idList.add(ids);
		}
		
		// mapList 생성 및 정렬 리턴
		Map<String, String> map = new HashMap<>();
		ArrayList< Map<String, String> > mapList = new ArrayList<>(); 
		for(int i = 0; i < idList.size(); i++) {
			map.put("userId", idList.get(i));
			map.put("cafeId", cafeId);
			mapList.add(map);
		}
		
		return mapList;
	}

	
	public ArrayList< Map<String, String> > nameBoardSort(String bundle, String cafeId) {
		
		//idList 에 id들 정렬
		ArrayList<String> idList = new ArrayList<>();
		ArrayList<String> boardNumList = new ArrayList<>();
		
		if(bundle.contains("/")) {
			String[] bundleArr = bundle.split("/");
			
			for(int j = 0; j < bundleArr.length; j++) {
				String[] idArr = bundleArr[j].split("\\+");
				for( int i = 0; i < idArr.length; i++) {
					if(i % 2 == 0) {
						idList.add(idArr[i]);
					} else {
						boardNumList.add(idArr[i]);
					}
				}
			}
		} else {
			String[] idArr = bundle.split("\\+");
			for( int i = 0; i < idArr.length; i++) {
				if(i % 2 == 0) {
					idList.add(idArr[i]);
				} else {
					boardNumList.add(idArr[i]);
				}
			}
			
		}
		
		// mapList 생성 및 정렬 리턴
		ArrayList< Map<String, String> > mapList = new ArrayList<>(); 
		for(int i = 0; i < idList.size(); i++) {
			Map<String, String> map = new HashMap<>();
			map.put("userId", idList.get(i));
			map.put("boardNum", boardNumList.get(i));
			map.put("cafeId", cafeId);
			mapList.add(map);
		}
		return mapList;
	}
	
	public String getMessage(String msg, String url) {
		String message = "";
		message += "<script>alert('"+msg+"');";
		message += "location.href='"+url+"';</script>";
		return message;
	}
	
	
	
	
	
	@Override
	public void unbanMembers2(String unbanMembers, String cafeId) {
		ArrayList<Map<String, String>> mapList = nameSort(unbanMembers, cafeId);
	}

	@Override
	// 자동회원가입x 일때 회원가입 시켜주기
	public String acceptMembers(String cafeId, String acceptMembers) {
		ArrayList<Map<String, String>> mapList = nameSort(acceptMembers, cafeId);
		String url = "";
		String msg = "";
		int result = 0;
		
		try {
			// 가입 신청관리 테이블에서 신청(들) 삭제 
			for(int i = 0; i < mapList.size(); i++) {
				result += mapper.deleteRequest(mapList.get(i));
			}
			
			// 카페 회원가입 매퍼 활용 가입시켜줘야됨
			for(int i = 0; i< mapList.size(); i++) {
				result += mapper.acceptMembers(mapList.get(i));
			}
			
			
			if(result == mapList.size()*2) {
				msg = "가입이 승인 되었습니다";
				url = "manageRegisterRequest";
			} else {
				msg = "오류가 발생했습니다!";
				url = "manageRegisterRequest";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return getMessage(msg,url);
	}

	@Override
	// 자동회원가입x 일때 회원가입 거절
	public String rejectMembers(String cafeId, String rejectMembers) {
		ArrayList<Map<String, String>> mapList = nameSort(rejectMembers, cafeId);
		
		int result = 0;
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
					result += mapper.deleteRequest(mapList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url, msg;
		if(result == mapList.size()) {
			msg = "가입이 거절 되었습니다";
			url = "manageRegisterRequest";
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageRegisterRequest";
		}
		return getMessage(msg,url);
		
	}

	@Override
	public String modifyMembersGrade(List<MembersGradeDTO> update) {
		//삭제 여부에 따라 cafeUserGrade 를 제외한 모든 값초기화
		for(int i = 0; i<update.size(); i++) {
			if(update.get(i).getCutRemoved().equals("true")) {
				update.get(i).setCutBoard(0);
				update.get(i).setCutDesc(" ");
				update.get(i).setCutName(" ");
				update.get(i).setCutReply(0);
				update.get(i).setCutType(1)	;
				update.get(i).setCutVisit(0);
			}
			
			System.out.println(update.get(i).getCafeId());
			System.out.println(update.get(i).getCafeUserGrade());
			System.out.println(update.get(i).getCutBoard());
			System.out.println(update.get(i).getCutDesc());
			System.out.println(update.get(i).getCutName());
			System.out.println(update.get(i).getCutReply());
			System.out.println(update.get(i).getCutType());
			System.out.println(update.get(i).getCutVisit());
			System.out.println(update.get(i).getCutRemoved());
		}
		
		int result = 0;
		for(int i = 0; i<update.size(); i++) {
			result += mapper.modifyMembersGrade(update.get(i));
			System.out.println("result : " + result);
		}
		
		String url, msg;
		if (result == update.size()) {
			msg = "성공적으로 반영되었습니다";
			url = "manageMembersGrade?cafeId="+update.get(0).getCafeId();
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageMembersGrade?cafeId="+update.get(0).getCafeId();
		}
		
		return getMessage(msg, url);
		
	}
	
	@Override
	public String modifyRegisterInfo(RegisterInfoDTO dto) {
		settingJoinAge(dto);
		modifyQuestions(dto);
		
		int result = mapper.modifyRegisterInfo(dto);
		
		String url, msg;
		if(result == 1) {
			msg = "성공적으로 반영되었습니다";
			url = "manageRegisterRequest";
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageRegisterInfo";
		}
		
		return getMessage(msg,url);
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
		
		int countQuestion = mapper.countQuestion(dto);
		//count = select count(*) from project_join_question where cafe_id = #{cafeId} 
		
		switch(countQuestion) {
			case 0 : // 등록된 질문 x, insert 3번
				for( int i = 0; i < qlist.size() ; i++ ) {
					JoinQuestionDTO jdto = new JoinQuestionDTO();
					jdto.setCafeId(dto.getCafeId());
					jdto.setCafeQuestionContent(qlist.get(i));
					jdto.setCafeQuestionNum(i+1);
					
					mapper.insertQuestion(jdto);
				}
				break;
				
			case 1 : // 1번 질문이 존재(업데이트), 23번 추가
				for( int i = 0; i < qlist.size() ; i++ ) {
					if(i == 0) {
						JoinQuestionDTO jdto = new JoinQuestionDTO();
						jdto.setCafeId(dto.getCafeId());
						jdto.setCafeQuestionContent(qlist.get(i));
						jdto.setCafeQuestionNum(i+1);
						mapper.updateQuestion(jdto);
					} else {
						JoinQuestionDTO jdto = new JoinQuestionDTO();
						jdto.setCafeId(dto.getCafeId());
						jdto.setCafeQuestionContent(qlist.get(i));
						jdto.setCafeQuestionNum(i+1);
						mapper.insertQuestion(jdto);
					}
				}
				break;
				
			case 2 : // 1,2번 질문 업데이트, 3번 추가
				for( int i = 0; i < qlist.size() ; i++ ) {
					if(i <= 1) {
						JoinQuestionDTO jdto = new JoinQuestionDTO();
						jdto.setCafeId(dto.getCafeId());
						jdto.setCafeQuestionContent(qlist.get(i));
						jdto.setCafeQuestionNum(i+1);
						mapper.updateQuestion(jdto);
					} else {
						JoinQuestionDTO jdto = new JoinQuestionDTO();
						jdto.setCafeId(dto.getCafeId());
						jdto.setCafeQuestionContent(qlist.get(i));
						jdto.setCafeQuestionNum(i+1);
						mapper.insertQuestion(jdto);
					}
				}
				break;
				
			case 3 : // 1,2,3번 질문 업데이트
				for( int i = 0; i < qlist.size() ; i++ ) {
					JoinQuestionDTO jdto = new JoinQuestionDTO();
					jdto.setCafeId(dto.getCafeId());
					jdto.setCafeQuestionContent(qlist.get(i));
					jdto.setCafeQuestionNum(i+1);
					mapper.updateQuestion(jdto);
				}
				break;
		}
	}
	
	//등업 승인
	@Override
	public String gradeUpMembers(String cafeId, String gradeUpMembers) {
		ArrayList<Map<String, String>> mapList = nameBoardSort(gradeUpMembers, cafeId);
		int result = 0;
		for(int i = 0; i<mapList.size(); i++) {
			result += mapper.gradeUpMembers(mapList.get(i));
			result += mapper.gradeRejectMembers(mapList.get(i));
		}
		
		String url, msg;
		if(result == mapList.size()*2) {
			msg = "성공적으로 반영되었습니다";
			url = "manageGradeUpApplies?cafeId="+cafeId;
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageGradeUpApplies?cafeId="+cafeId;
		}
		
		return getMessage(msg,url);
	}

	//등업 거절
	@Override
	public String gradeRejectMembers(String cafeId, String gradeRejectMembers) {
		ArrayList<Map<String, String>> mapList = nameBoardSort(gradeRejectMembers, cafeId);
		int result = 0;
		for(int i = 0; i<mapList.size(); i++) {
			result += mapper.gradeRejectMembers(mapList.get(i));
		}		
		
		String url, msg;
		if(result == mapList.size()) {
			msg = "성공적으로 반영되었습니다";
			url = "manageGradeUpApplies?cafeId="+cafeId;
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageGradeUpApplies?cafeId="+cafeId;
		}
		
		return getMessage(msg,url);
	}

	@Override
	public ArrayList<MembersGradeDTO> getMembersGradeList(String cafeId) {
		ArrayList<MembersGradeDTO> list = mapper.getMembersGradeList(cafeId);
		return list;
	}

	@Override
	public ArrayList<GradeUpAppliesDTO> getGradeUpAppliesList(String cafeId) {
		ArrayList<GradeUpAppliesDTO> list = mapper.getGradeUpAppliesList(cafeId);
		return list;
	}

}
