package com.itbank.navercafe.user.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.mybatis.member.MemberMapper;
import com.itbank.navercafe.user.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberMapper mm;
	
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();

	
	@Override
	public ArrayList<MemberDTO> getMemberList() {	
		return mm.getMemberList();
	}
	
	@Override
	public int signup(MemberDTO dto) { //회원가입
		String seq = en.encode(dto.getPassword());
		dto.setPassword(seq);
		try {
			return mm.signup(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int delete(String id) { // 회원탈퇴(비밀번호 입력시 탈퇴 추가)
		int result=0;
		try {
			result = mm.delete(id);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public MemberDTO getU(String id) {
		MemberDTO dto = mm.getUser(id);
		
		return dto;
	}
	
	@Override
	public int update(MemberDTO dto) { //회원정보수정
		String seq = en.encode(dto.getPassword());
		dto.setPassword(seq);
		try {
			return mm.update(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public int loginChk(HttpServletRequest request) {
		MemberDTO dto = mm.getUser(request.getParameter("id"));
		if(dto != null) {
			if(en.matches(request.getParameter("password"), dto.getPassword()) || dto.getPassword().equals(request.getParameter("password"))) {
				return 0;
			}
		}
		return 1;
	}
	
}
