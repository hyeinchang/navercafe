package com.itbank.navercafe.admin.memberstaff.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.admin.email.service.AdminEmailService;
import com.itbank.navercafe.admin.memberstaff.dto.AllMembersDTO;
import com.itbank.navercafe.admin.memberstaff.dto.DeportedMembersDTO;
import com.itbank.navercafe.admin.memberstaff.mapper.AdminMemberStaffMapper;
import com.itbank.navercafe.admin.registergrade.mapper.AdminRegisterGradeMapper;

@Service
public class AdminMemberStaffServiceImpl implements AdminMemberStaffService{
	@Autowired AdminMemberStaffMapper mapper;
	@Autowired AdminRegisterGradeMapper argMapper;
	@Autowired AdminEmailService emailserv;
	
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
		ArrayList< Map<String, String> > mapList = new ArrayList<>(); 
		for(int i = 0; i < idList.size(); i++) {
			Map<String, String> map = new HashMap<>();
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
			map.put("cafeRequestNum", boardNumList.get(i));
			map.put("cafeUserGrade", boardNumList.get(i));
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
	public String modifyMembers(String modifyMembers, String cafeId, String gradeLevel) {
		ArrayList<Map<String, String>> mapList = nameSort(modifyMembers, cafeId);
		
		int result = 0;
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
				mapList.get(i).put("cafeUserGrade", gradeLevel);
				result += mapper.modifyMembersGrade(mapList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url, msg;
		if(result == mapList.size()) {
			msg = "성공적으로 반영되었습니다";
			url = "manageRegisterBan?cafeId="+cafeId;
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageRegisterBan?cafeId="+cafeId;
		}
		return getMessage(msg,url);
	}

	@Override
	public String deportMembers(String deportMembers, String cafeId, String reason) {
		ArrayList< Map<String, String> > mapList = nameSort(deportMembers, cafeId);
		int result = 0;
		String managerId = mapper.getManagerId(cafeId);
		System.out.println(managerId);
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
				mapList.get(i).put("reason", reason);
				mapList.get(i).put("managerId", managerId);
				
				//강제탈퇴 테이블 project_cafe_deported 에 값 추가
				result += mapper.insertDeportedList(mapList.get(i));
				//카페회원 테이블에서 회원 정보 삭제 (탈퇴)
				result += mapper.deportMembers(mapList.get(i));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == mapList.size()*2) {
			msg = "강제탈퇴가 완료되었습니다";
			url = "manageAllMembers?cafeId="+cafeId;
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageAllMembers?cafeId="+cafeId;
		}
	
		return getMessage(msg,url);
	}

	@Override
	public String emailMembers(String emailMembers, String cafeId, String subject, String body) {
		ArrayList< Map<String, String> > mapList = nameSort(emailMembers, cafeId);
		ArrayList<String> emailList = new ArrayList<>();
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
				emailList = mapper.getEmailList(mapList.get(i));
				
				if(emailList.get(i).contains("@")) {
					emailserv.sendMail(emailList.get(i), subject, body);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		msg = "메일을 성공적으로 보냈습니다.";
		url = "manageAllMembers?cafeId="+cafeId;
		return getMessage(msg,url);
	}

	@Override
	// id값으로 블랙리스트에서 아이디 삭제 + 카페아이디 필요
	public String unbanMembers(String unbanMembers, String cafeId) {
		ArrayList< Map<String, String> > idList = nameSort(unbanMembers, cafeId);
		String msg = ""; 
		String url = "";
		int result = 0;
		
		try {
			for(int i = 0; i < idList.size(); i++) {
				result += argMapper.unbanMembers(idList.get(i)); // (idList.get(i),cafeId)
			}
			
			if(result == idList.size()) {
				msg = "재가입 가능한 멤버로 변경하였습니다.";
				url = "manageDeportedMembers?cafeId="+cafeId;
			} else {
				msg = "오류가 발생했습니다";
				url = "manageDeportedMembers?cafeId="+cafeId;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return getMessage(msg, url);
	}

	@Override
	public String banMembers(String banMembers, String cafeId, String reason) {
		ArrayList< Map<String, String> > mapList = nameSort(banMembers, cafeId);
		String managerId = mapper.getManagerId(cafeId);
		int result = 0;
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
				System.out.println("포문진입");
				mapList.get(i).put("reason", reason);
				mapList.get(i).put("managerId", managerId);
				result += mapper.banMembers(mapList.get(i));
					
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == mapList.size()) {
			msg = "성공적으로 반영 되었습니다";
			url = "manageDeportedMembers?cafeId="+cafeId;
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageDeportedMembers?cafeId="+cafeId;
		}
	
		return getMessage(msg,url);
	}

	@Override
	public ArrayList<AllMembersDTO> getAllMembersList(String cafeId) {
		return mapper.getAllMembersList(cafeId);
	}

	@Override
	public ArrayList<String> getCafeGradeNames(String cafeId) {
		return mapper.getCafeGradeNames(cafeId); 
	}

	@Override
	public ArrayList<DeportedMembersDTO> getDeportedMembersList(String cafeId) {
		ArrayList<DeportedMembersDTO> list = mapper.getDeportedMembersList(cafeId);
		// 밴 여부 확인
		for(int i = 0; i < list.size(); i++) {
			Map<String, String> map = new HashMap<>();
			map.put("userId", list.get(i).getUserId());
			map.put("cafeId", cafeId);
			int result = mapper.getBanFlag(map);
			if(result == 0) {
				list.get(i).setBanFlag("-");
			} else {
				list.get(i).setBanFlag("가입불가");
			}
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> getQA(String userId, String cafeId) {
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("userId", userId);
		dataMap.put("cafeId", cafeId);
		ArrayList<String> questions = mapper.getquestions(dataMap);
		ArrayList<String> answers = mapper.getAnswers(dataMap);
		
		List<Map<String, Object>> mapList = new ArrayList<>();
		for(int i = 0; i<questions.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("Q"+(i+1), questions.get(i));
			map.put("A"+(i+1), answers.get(i));
			mapList.add(map);
		}
		
		return mapList;
	}

}
