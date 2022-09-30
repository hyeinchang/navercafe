package com.itbank.navercafe.admin.memberstaff.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.cafemember.dto.AdminCafeMemberDTO;
import com.itbank.navercafe.admin.memberstaff.dto.AllMembersDTO;
import com.itbank.navercafe.admin.memberstaff.dto.DeportedMembersDTO;
import com.itbank.navercafe.admin.memberstaff.service.AdminMemberStaffService;

@Controller
@RequestMapping("admin")
public class AdminMemberStaffController {
	@Autowired AdminMemberStaffService amss;

	@GetMapping("manageAllMembers")
	public String manageAllMembers(Model model, String cafeId) {
		ArrayList<AllMembersDTO> amList = amss.getAllMembersList(cafeId);
		ArrayList<String> gradeNameList = amss.getCafeGradeNames(cafeId);
		
		model.addAttribute("list", amList);
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("gradeList", gradeNameList);
		
		return "admin/memberStaff/manageAllMembers";
	}
	
	@GetMapping("manageDeportedMembers")
	public String manageDeportedMembers(Model model, String cafeId) {
		ArrayList<DeportedMembersDTO> list = amss.getDeportedMembersList(cafeId);
		
		model.addAttribute("list", list);
		model.addAttribute("cafeId", cafeId);
		
		return "admin/memberStaff/manageDeportedMembers";
	}
	
	@GetMapping("manageStaffs")
	public String manageStaffs() {
		return "admin/memberStaff/manageStaffs";
	}
	
	
	@PostMapping("modifyMembers")
	public void modifyMembers(String modifyMembers, String cafeId, String gradeLevel, HttpServletResponse resp) throws IOException {
		String msg = amss.modifyMembers(modifyMembers, cafeId, gradeLevel);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("deportMembers")
	public void deportMembers(String deportMembers, String cafeId, String reason, HttpServletResponse resp ) throws IOException {
		String msg = amss.deportMembers(deportMembers, cafeId, reason);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("emailMembers")
	public void emailMembers(String emailMembers, String cafeId, HttpServletResponse resp) throws Exception {
		String msg = amss.emailMembers(emailMembers, cafeId);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("unbanMembers")
	public void unbanMembers(String unbanMembers, String cafeId, HttpServletResponse resp) throws Exception {
		String msg = amss.unbanMembers(unbanMembers, cafeId);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("banMembers")
	public void banMembers(String banMembers, String cafeId, HttpServletResponse resp) throws Exception { 
		String msg = amss.banMembers(banMembers, cafeId);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	

	
	
}
