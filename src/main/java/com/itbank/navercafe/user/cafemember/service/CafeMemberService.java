package com.itbank.navercafe.user.cafemember.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.dto.FileDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;




public interface CafeMemberService {
	public ArrayList<CafeMemberDTO> getCafeMemberList();
	
	public void writeSave(MultipartHttpServletRequest mul,HttpServletRequest request);
	
	public CafeMemberDTO getCafeUserInfo(String userId);
	public int logChk(String userId);

	public CafeMemberDTO getSessionUserInfo(String sessionId);
	
	public void getUserViewList(String userId,Model model);
	
	public int getSequence();
	public void insert(CafeMemberDTO dto);
	public void insertFile(FileDTO dto);
	
	public ArrayList<TestFileDTO> getFileNameList();
	
}
