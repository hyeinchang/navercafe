package com.itbank.navercafe.admin.memberstaff.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.itbank.navercafe.admin.memberstaff.dto.AllMembersDTO;
import com.itbank.navercafe.admin.memberstaff.dto.DeportedMembersDTO;

public interface AdminMemberStaffService {

	public String modifyMembers(String modifyMembers, String cafeId, String gradeLevel);

	public String deportMembers(String deportMembers, String cafeId, String reason);

	public String emailMembers(String emailMembers, String cafeId, String eSubject, String eBody);

	public String unbanMembers(String unbanMembers, String cafeId);

	public String banMembers(String banMembers, String cafeId, String reason);

	public ArrayList<AllMembersDTO> getAllMembersList(String cafeId);

	public ArrayList<String> getCafeGradeNames(String cafeId);

	public ArrayList<DeportedMembersDTO> getDeportedMembersList(String cafeId);

	public List<Map<String, Object>> getQA(String userId, String cafeId);
	

}
