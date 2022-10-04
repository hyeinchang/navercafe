package com.itbank.navercafe.user.member.mapper;

import com.itbank.navercafe.user.member.dto.MemberDTO;


public interface MemberMapper {

	public int signup(MemberDTO dto);

	public int update(MemberDTO dto);

	public MemberDTO getUser(String id);

	public int delete(String id);
	
	public int loginChk(MemberDTO memberDTO);

	public int idOverlap(String id);
}
