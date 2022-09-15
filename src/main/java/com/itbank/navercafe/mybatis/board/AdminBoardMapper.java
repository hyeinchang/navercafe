package com.itbank.navercafe.mybatis.board;

public interface AdminBoardMapper {
	public int modifyMembers();
	
	public int deportMembers(String userId);
	
	public int unbanMembers(String userId);
	
	public int banMembers(String userId);
	
	public int acceptMembers(String userId);
	
	public int rejectMembers(String userId);

	public int deleteRequest(String userId);
}
