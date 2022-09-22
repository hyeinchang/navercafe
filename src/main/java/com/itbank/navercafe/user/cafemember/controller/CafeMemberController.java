package com.itbank.navercafe.user.cafemember.controller;

import java.io.File;
import java.io.FileInputStream;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.user.cafemember.service.CafeMemberService;




@Controller
@RequestMapping("/user/board")
public class CafeMemberController {
	@Autowired CafeMemberService cafeSer;
	
	@GetMapping("/goCafeMemberList")
	public String goCafeMemberList(Model model) {
		model.addAttribute("cafeMemberList",cafeSer.getCafeMemberList());
		return "user/board/cafeMemberList";
	}
	@GetMapping("/goRegCafeMember")
	public String goRegCafeMember() {
		return "user/board/regCafeMember";
	}
	
	@PostMapping("saveData")
	public String saveData(MultipartHttpServletRequest mul,
							HttpServletRequest request){
		System.out.println(mul.getParameter("cafeUserImage"));
		cafeSer.writeSave(mul,request);
		return "redirect:goCafeMemberList";
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


	
	
	

}
