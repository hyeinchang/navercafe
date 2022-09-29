package com.itbank.navercafe.user.cafemember.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.mapper.CafeMemberMapper;



@Service
public class CafeMemberServiceImpl implements CafeMemberService{

	@Autowired CafeMemberMapper mapper;


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
	
	@Override
	public String idOverlap(String cafeUserNickname, String cafeId) {
		String result = null;
		int idCheck = mapper.idOverlap(cafeUserNickname,cafeId);
		
		if(idCheck!=1) {
			result = "OK"; // 중복X
		}else {
			result = "NO";
		}
		return result;
	}
	
	@Override
	public CafeMemberDTO getCafeUserInfo(String cafeId,String userId) {
		return mapper.getCafeUserInfo(cafeId,userId);
	}
	@Override
	public CafeMemberDTO getSessionUserInfo(String cafeId,String sessionId) {
		return mapper.getSessionUserInfo(cafeId,sessionId);
	}
	
	
	//게시글 더 보러가기
	@Override
	public void getUserViewList(String cafeId,String userId,Model model) {
		model.addAttribute("getUserViewList",mapper.getUserViewList(cafeId,userId));
	}
	
	



	
}
