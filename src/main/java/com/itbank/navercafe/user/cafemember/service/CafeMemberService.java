package com.itbank.navercafe.user.cafemember.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.itbank.navercafe.comon.file.dto.FileDTO;

import com.itbank.navercafe.user.cafejoin.dto.CafeJoinDTO;

import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;

public interface CafeMemberService {

	public int signup(CafeMemberDTO dto);

	public Integer cafeMembers(String cafeId, String userId);

	public CafeMemberDTO getCafeMember(String cafeId, String userId);

	public int cafeMemberUpdate(CafeMemberDTO dto);

	public String idOverlap(String cafeUserNickname, String cafeId, String oldNick);
	
	//수정작업에 참고할?
	public void writeSave(MultipartHttpServletRequest mul,HttpServletRequest request);
	//닉네임때문에 따로 구해오는애들
	public CafeMemberDTO getCafeUserInfo(String userId);
	//댓글 작성하려고 구해온애
	public CafeMemberDTO getSessionUserInfo(String sessionId);
	//게시글 더 보러가기
	public void getUserViewList(String userId,Model model);


}
