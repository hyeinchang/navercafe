package com.itbank.navercafe.mybatis.board;

public interface AdminBoardMapper {
	public int modifyMembers();
	
	public int deportMembers(String userId);
	
	public int unbanMembers();
	
	public int unbanMembers2();
	
	public int acceptMembers(String userId);
	
	public int rejectMembers();

	public int deleteRequest(String userId);
}
