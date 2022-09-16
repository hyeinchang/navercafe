	package com.itbank.navercafe.admin.registergrade.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.cafemember.dto.AdminCafeMemberDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
import com.itbank.navercafe.admin.registergrade.service.RegisterGradeService;

@Controller
@RequestMapping("admin")
public class AdminRegisterGradeController {
	@Autowired RegisterGradeService rgs;
	
	@GetMapping("manageMembersGrade")
	public String manageMembersGrade() {
		return "admin/registerGrade/manageMembersGrade";
	}
	
	@GetMapping("manageRegisterBan")
	public String manageRegisterBan(Model model) {
		
		ArrayList<AdminCafeMemberDTO> list = new ArrayList<>();
		for(int i = 0; i < 40; i++) {
			AdminCafeMemberDTO pcm = new AdminCafeMemberDTO();
			pcm.setUserName("응애"+i);
			pcm.setUserId("ddd"+i);
			pcm.setUserEmail("email"+i);
			pcm.setUserLevel(i);
			pcm.setUserPoint(i);
			list.add(pcm);
			
		}
		model.addAttribute("list", list);
		return "admin/registerGrade/manageRegisterBan";
	}
	
	@GetMapping("manageRegisterInfo")
	public String manageRegisterInfo(Model model, String cafeId) {
		RegisterInfoDTO dto = new RegisterInfoDTO();
		dto.setExplanation("카페설명입니다");
		dto.setJoin_question(true);
		dto.setQ1Content("1번질문 내용");
		dto.setQ2Content("2222222");
		
		model.addAttribute("regiInfo", dto);
		
		// rgs.getCafeInfo(cafeId, model); 가입신청 넣을때 뿌려주는 인포 그대로 가져오면됨
		
		return "admin/registerGrade/manageRegisterInfo";
	}
	
	@GetMapping("manageRegisterRequest")
	public String manageRegisterRequest() {
		return "admin/registerGrade/manageRegisterRequest";
	}
	
	@PostMapping("unbanMembers2")
	public String unbanMembers2(String unbanMembers) {
		rgs.unbanMembers2(unbanMembers);
		return "redirect:manageRegisterBan";
	}
	
	@PostMapping("acceptMembers")
	public void acceptMembers(String acceptMembers, HttpServletResponse resp) throws Exception {
		String msg = rgs.acceptMembers(acceptMembers);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);

	}
	
	@PostMapping("rejectMembers")
	public void rejectMembers(String rejectMembers, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String msg = rgs.rejectMembers(rejectMembers, req); 
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("modifyRegisterInfo")
	public void modifyRegisterInfo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//String msg = rgs.modifyRegisterInfo();
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		//out.print(msg);
	}
	
	
	
}
