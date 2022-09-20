package com.itbank.navercafe.user.cafemember.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//import com.itbank.navercafe.comon.file.FileService;
import com.itbank.navercafe.mybatis.cafemember.CafeMemberMapper;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;



@Service
public class CafeMemberServiceImpl implements CafeMemberService{
	@Autowired CafeMemberMapper cafeMap;
	//@Autowired FileService fs;
	
	
	@Override
	public ArrayList<CafeMemberDTO> getCafeMemberList() {
		return cafeMap.getCafeMemberList();
	}
	
	public void writeSave(MultipartHttpServletRequest mul,HttpServletRequest request) {
		CafeMemberDTO dto= new CafeMemberDTO();
		dto.setCafeId(mul.getParameter("cafeId"));
		dto.setUserId(mul.getParameter("userId"));
		dto.setCafeUserNickname(mul.getParameter("cafeUserNickname"));
		MultipartFile file=mul.getFile("cafeUserImage");
		if(file.getSize()!=0) {
			//dto.setCafeUserImage(fs.saveFile(file));
		}else {
			dto.setCafeUserImage("nan");
		}
		cafeMap.saveData(dto);
	}

	@Override
	public CafeMemberDTO getCafeUserInfo(String userId) {
		return cafeMap.getCafeUserInfo(userId);
	}

	@Override
	public int logChk(String userId) {
		ArrayList<CafeMemberDTO> list=cafeMap.getCafeMemberList();
		for(int i=0;i<list.size();i++) {
			if(userId.equals(list.get(i).getUserId())) {
				return 1;
			}
		}
		return 0;
	}

	@Override
	public CafeMemberDTO getSessionUserInfo(String sessionId) {
		return cafeMap.getSessionUserInfo(sessionId);
	}

	@Override
	public void getUserViewList(String userId,Model model) {
		model.addAttribute("getUserViewList",cafeMap.getUserViewList(userId));

		
	}

	
	
}
