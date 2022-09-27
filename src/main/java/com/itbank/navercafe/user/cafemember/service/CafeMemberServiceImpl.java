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
import com.itbank.navercafe.user.cafejoin.dto.CafeJoinDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;



@Service
public class CafeMemberServiceImpl implements CafeMemberService{

	@Autowired TestFileService fs;
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
	public CafeMemberDTO getCafeUserInfo(String userId) {
		return mapper.getCafeUserInfo(userId);
	}
	@Override
	public CafeMemberDTO getSessionUserInfo(String sessionId) {
		return mapper.getSessionUserInfo(sessionId);
	}
	
	
	//게시글 더 보러가기
	@Override
	public void getUserViewList(String userId,Model model) {
		model.addAttribute("getUserViewList",mapper.getUserViewList(userId));
	}
	
	
	//수정 할때 변경해서 임시로 사용
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
		MultipartFile file=mul.getFile("cafeUserImageNum");
		//System.out.println("누구?:"+file);
		if(file.getSize()!=0) {
			//시퀀스값 빼오는애
			int seq=mapper.getSequence();
			System.out.println("가져온 seq:"+seq);
			dto.setCafeUserImageNum(seq);//seq 가져와서 넣어주고
			
			tfd.setFileNum(seq);//번호 부여
			//tfd.setProfileNum(profileNum);//같은 번호 부여
			tfd.setFileOrgName(fs.saveFile(file));//파일명
			//System.out.println("저장될 tfd의 파일의 번호 : "+tfd.getFileNum());
			//System.out.println("저장될 tfd의 파일 : "+tfd.getFileOrgName());
			mapper.saveFileDTO(tfd);
		}
		mapper.saveData(dto);
	}


	
}
