package com.itbank.navercafe.mybatis.cafemember;

import org.apache.ibatis.annotations.Param;

import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;



public interface CafeMemberMapper {
	
	public int signup(CafeMemberDTO dto);
	
	public Integer cafeMembers(@Param("cafeId")String cafeId, @Param("userId")String userId);

	public CafeMemberDTO getCafeMember(@Param("cafeId")String cafeId, @Param("userId")String userId);

	public int cafeMemberUpdate(CafeMemberDTO dto);

	public Integer idOverlap(@Param("cafeUserNickname")String cafeUserNickname, @Param("cafeId")String cafeId);

}
