package com.itbank.navercafe.admin.memberstaff.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	
	
	
	
	
	
	/*
	 * 		ArrayList<Map<String, String>> mapList = nameSort(unbanMembers, cafeId);
		
		int result = 0;
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
				result += mapper.unbanMembers(mapList.get(i));
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
	 * 
	 * 
	 */
	
	
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
	// id 값으로 회원 강제 탈퇴
	public String deportMembers(String deportMembers, String cafeId, String reason) {
		ArrayList< Map<String, String> > mapList = nameSort(deportMembers, cafeId);
		int result = 0;
		System.out.println(reason);
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
				mapList.get(i).put("reason", reason);
				result += mapper.insertDeportedList(mapList.get(i));
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
				url = "manageAllMembers?cafeId="+cafeId;
			} else {
				msg = "오류가 발생했습니다";
				url = "manageAllMembers?cafeId=1"+cafeId;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return getMessage(msg, url);
	}

	@Override
	// id값으로 블랙리스트 등록 + cafeid + 사유
	public String banMembers(String banMembers, String cafeId) {
		ArrayList< Map<String, String> > mapList = nameSort(banMembers, cafeId);
		int result = 0;
		
		try {
			for(int i = 0; i < mapList.size(); i++) {
				result += mapper.banMembers(mapList.get(i));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == mapList.size()) {
			msg = "성공적으로 반영 되었습니다";
			url = "manageAllMembers?cafeId="+cafeId;
		} else {
			msg = "오류가 발생했습니다!";
			url = "manageAllMembers?cafeId="+cafeId;
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
		return mapper.getDeportedMembersList(cafeId);
	}

}
