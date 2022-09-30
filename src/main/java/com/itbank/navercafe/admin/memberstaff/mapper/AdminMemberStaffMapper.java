package com.itbank.navercafe.admin.memberstaff.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.itbank.navercafe.admin.memberstaff.dto.AllMembersDTO;

public interface AdminMemberStaffMapper {
	public int deportMembers(String userId) throws Exception;
	public int unbanMembers(String string) throws Exception;;
	public int banMembers(String string) throws Exception;
	public ArrayList<AllMembersDTO> getAllMembersList(String cafeId);
	public ArrayList<String> getCafeGradeNames(String cafeId);
}
