package com.itbank.navercafe.admin.registergrade.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.cafemember.dto.AdminCafeMemberDTO;

@Controller
@RequestMapping("admin")
public class AdminRegisterGradeController {
	
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
	public String manageRegisterInfo() {
		return "admin/registerGrade/manageRegisterInfo";
	}
	
	@GetMapping("manageRegisterRequest")
	public String manageRegisterRequest() {
		return "admin/registerGrade/manageRegisterRequest";
	}

	
}
