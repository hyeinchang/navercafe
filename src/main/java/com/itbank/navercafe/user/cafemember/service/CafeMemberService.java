package com.itbank.navercafe.user.cafemember.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.user.cafejoin.dto.CafeJoinDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;

public interface CafeMemberService {

	public int signup(CafeMemberDTO dto);

	public Integer cafeMembers(String cafeId, String userId);

	public CafeMemberDTO getCafeMember(String cafeId, String userId);

	public int cafeMemberUpdate(CafeMemberDTO dto);

	public String idOverlap(String cafeUserNickname, String cafeId, String oldNick);

	
	
}
