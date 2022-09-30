package com.itbank.navercafe.admin.memberstaff.service;

import java.util.ArrayList;

import com.itbank.navercafe.admin.memberstaff.dto.AllMembersDTO;

public interface AdminMemberStaffService {

	public String modifyMembers(String modifyMembers);

	public String deportMembers(String deportMembers);

	public String emailMembers(String emailMembers);

	public String unbanMembers(String unbanMembers);

	public String banMembers(String banMembers);

	public ArrayList<AllMembersDTO> getAllMembersList(String cafeId);

	public ArrayList<String> getCafeGradeNames(String cafeId);
	

}
