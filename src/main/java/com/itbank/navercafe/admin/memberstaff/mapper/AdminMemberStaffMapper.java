package com.itbank.navercafe.admin.memberstaff.mapper;

public interface AdminMemberStaffMapper {
	public int deportMembers(String userId) throws Exception;
	public int unbanMembers(String string) throws Exception;;
	public int banMembers(String string) throws Exception;;
}
