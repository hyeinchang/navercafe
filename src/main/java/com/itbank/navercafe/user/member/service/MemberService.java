package com.itbank.navercafe.user.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.itbank.navercafe.user.member.dto.MemberDTO;



public interface MemberService {
	public ArrayList<MemberDTO> getMemberList();

	public int signup(MemberDTO dto);

	public int delete(String id);

	public int update(MemberDTO dto);

	public MemberDTO getU(String id);

	public int loginChk(HttpServletRequest request);

}
