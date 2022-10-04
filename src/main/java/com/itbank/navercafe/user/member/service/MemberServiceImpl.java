package com.itbank.navercafe.user.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.user.member.dto.MemberDTO;
import com.itbank.navercafe.user.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberMapper mm;
	
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();

	
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
	public boolean loginChk(MemberDTO dto) {
		boolean result = false;
		
		try {
			MemberDTO user = mm.getUser(dto.getId());
			
			if(user != null) {
				result = en.matches(dto.getPassword(), user.getPassword());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}
	
}
