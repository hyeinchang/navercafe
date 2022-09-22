package com.itbank.navercafe.user.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.mybatis.member.MemberMapper;
import com.itbank.navercafe.user.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberMapper mm;
	
	@Override
	public ArrayList<MemberDTO> getMemberList() {	
		return mm.getMemberList();
	}

}
