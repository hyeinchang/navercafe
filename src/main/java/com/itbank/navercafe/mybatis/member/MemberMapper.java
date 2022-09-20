package com.itbank.navercafe.mybatis.member;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.itbank.navercafe.user.member.dto.MemberDTO;




public interface MemberMapper {
	public ArrayList<MemberDTO> getMemberList();
}
