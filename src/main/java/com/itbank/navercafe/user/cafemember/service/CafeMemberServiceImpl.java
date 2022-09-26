package com.itbank.navercafe.user.cafemember.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.mybatis.cafemember.CafeMemberMapper;
import com.itbank.navercafe.user.cafejoin.dto.CafeJoinDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;



@Service
public class CafeMemberServiceImpl implements CafeMemberService{
	@Autowired CafeMemberMapper mapper;
	
	
	@Override
	public int signup(CafeMemberDTO dto) {
		
		try {
			return mapper.signup(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public Integer cafeMembers(String cafeId, String userId) {
		try {
			return  mapper.cafeMembers(cafeId,userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public CafeMemberDTO getCafeMember(String cafeId, String userId) {
		CafeMemberDTO dto = mapper.getCafeMember(cafeId, userId);
		return dto;
	}
	
	@Override
	public int cafeMemberUpdate(CafeMemberDTO dto) {
		try {
			return mapper.cafeMemberUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	@Override
	public String idOverlap(String cafeUserNickname, String cafeId, String oldNick) {
		String result = null;
		int idCheck = mapper.idOverlap(cafeUserNickname,cafeId);
		if(oldNick.equals(cafeUserNickname)) {
			idCheck=0;
		}
		
		if(idCheck!=1) {
			result = "OK"; // 중복X
		}else {
			result = "NO";
		}
		return result;
	}
	
	
}
