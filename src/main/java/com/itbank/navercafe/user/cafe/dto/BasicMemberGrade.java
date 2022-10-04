package com.itbank.navercafe.user.cafe.dto;

import java.util.ArrayList;
import java.util.List;

public class BasicMemberGrade {
	public List<CafeMemberGradeDTO> basicMemberGradeList = new ArrayList<>();
	
	public BasicMemberGrade() {
		for(int i=0;i<=5;i++) {
			CafeMemberGradeDTO gradeDTO = new CafeMemberGradeDTO();
			int cafeUserGrade = i;
			int cutType = 1;
			String cutName = "";
			String cutDesc = "";
			
			switch(i) {
			case 0 :
				cutName = "새싹멤버";
				cutDesc = "가입 후 막 활동을 시작하는 멤버";
				break;
			case 1 :
				cutName = "일반멤버";
				cutDesc = "카페 일반 멤버";
				break;
			case 2 :
				cutName = "성실멤버";
				cutDesc = "카페활동을 성실히 하는 멤버";
				break;
			case 3 :
				cutName = "열심멤버";
				cutDesc = "카페 열심 멤버";
				break;
			case 4 :
				cutName = "우수멤버";
				cutDesc = "카페 우수 멤버";
				break;
			case 5 :
				cutName = "감사멤버";
				cutDesc = "최고 고마운 VIP 멤버";
				break;	
			}
			
			gradeDTO.setCafeUserGrade(cafeUserGrade);
			gradeDTO.setCutType(cutType);
			gradeDTO.setCutName(cutName);
			gradeDTO.setCutDesc(cutDesc);
			
			basicMemberGradeList.add(gradeDTO);
		}
	}
}
