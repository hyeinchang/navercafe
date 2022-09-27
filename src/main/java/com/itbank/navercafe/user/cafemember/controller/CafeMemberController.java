package com.itbank.navercafe.user.cafemember.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.FileUtils;
import com.itbank.navercafe.comon.file.TestFileService;
import com.itbank.navercafe.comon.file.dto.FileDTO;
import com.itbank.navercafe.comon.file.dto.FileResult;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;
import com.itbank.navercafe.user.cafemember.service.CafeMemberService;




@Controller
@RequestMapping("/user/board")
public class CafeMemberController {
	@Autowired CafeMemberService cafeSer;
	@Autowired
	private FileUtils fileUtils;
	
	@GetMapping("/goCafeMemberList")
	public String goCafeMemberList(Model model) {
		model.addAttribute("cafeMemberList",cafeSer.getCafeMemberList());
		return "user/board/cafeMemberList";
	}
	@GetMapping("/goRegCafeMember")
	public String goRegCafeMember() {
		return "user/board/regCafeMember";
	}
	
	@PostMapping("logChk")
	public String logChk(String userId,HttpSession session) {
		int result=cafeSer.logChk(userId);
		if(result==1) {
			session.setAttribute("sessionId", userId);
		}
		return "redirect:goCafeMemberList";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "cafeMember/cafeMemberList";
	}
	
	@GetMapping("/userViewList")
	public String userViewList(String userId,Model model) {
		cafeSer.getUserViewList(userId,model);
		return "user/board/userViewList";
	}
	
	@RequestMapping(value="regSave", produces="application/json; charset=utf8")
	@ResponseBody
	public HashMap<Object, Object> saveTitle(MultipartHttpServletRequest multiRequest) {
		HashMap<Object, Object> map = new HashMap<>();
		MultipartFile multipartFile = multiRequest.getFile("cafeUserImage");
		int result = 0;
		try {
			//생성할 디렉토리
			String directory = "member";
			String userId =  multiRequest.getParameter("userId");
			
			System.out.println("userId : " + userId);
			System.out.println("cafeUserImage : " + multipartFile.getOriginalFilename());
			
			if(userId != null && userId.length() > 0) {
				directory += "/" + userId;
			}
			
			//seq 땡겨오고 -- 프로필 num seq 값을 넣어줘야 할듯?
			int seq=cafeSer.getSequence();
			System.out.println("넣어줄 seq 값 : "+seq);
			multiRequest.getParameter("넘어온 : cafeId"+"cafeId");
			multiRequest.getParameter("넘어온 : userId"+"userId");
			multiRequest.getParameter("넘어온 : cafeUserNickname"+"cafeUserNickname");
			
			CafeMemberDTO cmdto=new CafeMemberDTO();
			cmdto.setCafeId(multiRequest.getParameter("cafeId"));
			cmdto.setUserId(multiRequest.getParameter("userId"));
			cmdto.setCafeUserNickname(multiRequest.getParameter("cafeUserNickname"));
			cmdto.setCafeUserImage(seq);
			cafeSer.insert(cmdto);
			
			FileDTO fileDTO = null;
			FileResult fileResult = fileUtils.uploadFile(multipartFile, directory);
			fileDTO = fileResult.getFileDTO();
			fileDTO.setProfileNum(seq);
			//cafeSer.insertFile(fileDTO);//얘는 파일서비스에 누나가 만들어주실거임
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		result = 1;
		
		map.put("result", result);
		
		return map;
	}
	
	
	
	@PostMapping("saveData")
	public String saveData(MultipartHttpServletRequest mul,
							HttpServletRequest request){
		cafeSer.writeSave(mul,request);
		return "redirect:goCafeMemberList";
	}
	

	 @GetMapping("test_download") 
	 public void download(int fileImageNum,HttpServletResponse res) throws Exception { 
		 //System.out.println("받아온 파일"+file);
		 String file="";
		 ArrayList<TestFileDTO>list=cafeSer.getFileNameList();
		 for(int i=0;i<list.size();i++) {
			 if(list.get(i).getFileNum()==fileImageNum) {
				 file=list.get(i).getFileOrgName();
				 //System.out.println("imageNum에 해당하는 파일명"+file);
			 } 
		 }
		 
		 res.addHeader("Content-disposition","attachment; fileName="+file); File f=new
		 File(TestFileService.IMAGE_REPO+"/"+file); FileInputStream in = new
		 FileInputStream(f); FileCopyUtils.copy(in, res.getOutputStream());
		 in.close(); 
	 }
	

	
	
	

}
