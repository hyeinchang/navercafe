package com.itbank.navercafe.user.cafemember.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.TestFileService;
import com.itbank.navercafe.comon.file.dto.FileDTO;
//import com.itbank.navercafe.comon.file.FileService;
import com.itbank.navercafe.mybatis.cafemember.CafeMemberMapper;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;



@Service
public class CafeMemberServiceImpl implements CafeMemberService{
	@Autowired CafeMemberMapper cafeMap;
	@Autowired TestFileService fs;
	

	
	@Override
	public ArrayList<CafeMemberDTO> getCafeMemberList() {
		return cafeMap.getCafeMemberList();
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
	public CafeMemberDTO getCafeUserInfo(String userId) {
		return cafeMap.getCafeUserInfo(userId);
	}
	@Override
	public CafeMemberDTO getSessionUserInfo(String sessionId) {
		return cafeMap.getSessionUserInfo(sessionId);
	}

	@Override
	public void getUserViewList(String userId,Model model) {
		model.addAttribute("getUserViewList",cafeMap.getUserViewList(userId));
	}

	@Override
	public int getSequence() {
		return cafeMap.getSequence();
	}

	@Override
	public void insert(CafeMemberDTO dto) {
		cafeMap.insert(dto);
	}


	
	
	public void writeSave(MultipartHttpServletRequest mul,HttpServletRequest request) {
		TestFileDTO tfd=new TestFileDTO();
		
		CafeMemberDTO dto= new CafeMemberDTO();
		dto.setCafeId(mul.getParameter("cafeId"));
		dto.setUserId(mul.getParameter("userId"));
		dto.setCafeUserNickname(mul.getParameter("cafeUserNickname"));
		//System.out.println("저장될 카페아이디:"+dto.getCafeId());
		//System.out.println("저장될 유저아이디:"+dto.getUserId());
		//System.out.println("저장될 닉네임:"+dto.getCafeUserNickname());
		//System.out.println("저장될 파일 :"+mul.getFile("cafeUserImage"));
		MultipartFile file=mul.getFile("cafeUserImage");
		//System.out.println("누구?:"+file);
		if(file.getSize()!=0) {
			int seq=cafeMap.getSequence();
			System.out.println("가져온 seq:"+seq);
			dto.setCafeUserImage(seq);//seq 가져와서 넣어주고
			
			tfd.setFileNum(seq);//번호 부여
			//tfd.setProfileNum(profileNum);//같은 번호 부여
			tfd.setFileOrgName(fs.saveFile(file));//파일명
			//System.out.println("저장될 tfd의 파일의 번호 : "+tfd.getFileNum());
			//System.out.println("저장될 tfd의 파일 : "+tfd.getFileOrgName());
			cafeMap.saveFileDTO(tfd);
		}
		cafeMap.saveData(dto);
	}
	
	



	@Override
	public ArrayList<TestFileDTO> getFileNameList() {
		return cafeMap.getFileNameList();
	}	
	
	

	
	
}
