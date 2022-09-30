package com.itbank.navercafe.user.cafemember.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;

public interface CafeMemberService {

	public int signup(CafeMemberDTO dto);

	public Integer cafeMembers(String cafeId, String userId);

	public CafeMemberDTO getCafeMember(String cafeId, String userId);

	public int cafeMemberUpdate(CafeMemberDTO dto);
	
	public int cafeMemberUpdate(MultipartHttpServletRequest mul);

	public String idOverlap(String cafeUserNickname, String cafeId, String oldNick);
	
	public String idOverlap(String cafeUserNickname, String cafeId);
	
	//닉네임때문에 따로 구해오는애들
	public CafeMemberDTO getCafeUserInfo(String cafeId,String userId);
	//댓글 작성하려고 구해온애
	public CafeMemberDTO getSessionUserInfo(String cafeId,String userId);
	//게시글 더 보러가기
	public void getUserViewList(String cafeId,String userId,Model model);
}
