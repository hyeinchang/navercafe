package com.itbank.navercafe.admin.memberstaff.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.itbank.navercafe.admin.memberstaff.dto.AllMembersDTO;
import com.itbank.navercafe.admin.memberstaff.dto.DeportedMembersDTO;

public interface AdminMemberStaffMapper {
	
	
	public ArrayList<AllMembersDTO> getAllMembersList(String cafeId);
	public ArrayList<String> getCafeGradeNames(String cafeId);
	public int modifyMembersGrade(Map<String, String> map);
	public int deportMembers(Map<String, String> map);
	public int banMembers(Map<String, String> map);
	public ArrayList<String> getEmailList(Map<String, String> map);
	public int insertDeportedList(Map<String, String> map);
	public ArrayList<DeportedMembersDTO> getDeportedMembersList(String cafeId);
	public String getManagerId(String cafeId);
	public int getBanFlag(Map<String, String> map);
	public ArrayList<String> getquestions(Map<String, String> dataMap);
	public ArrayList<String> getAnswers(Map<String, String> cafeId);
}
