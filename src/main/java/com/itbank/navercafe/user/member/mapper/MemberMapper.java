package com.itbank.navercafe.user.member.mapper;

import java.util.ArrayList;


import com.itbank.navercafe.user.member.dto.MemberDTO;


public interface MemberMapper {

	public int signup(MemberDTO dto);

	public int update(MemberDTO dto);

	public MemberDTO getUser(String id);

	public int delete(String id);

}
