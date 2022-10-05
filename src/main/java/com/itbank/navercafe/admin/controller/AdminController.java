package com.itbank.navercafe.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.member.dto.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@GetMapping("")
	public String index(CafeDTO cafeDTO, Model model) {
		//System.out.println("cafeId : " + cafeDTO.getCafeId());
		model.addAttribute("cafeDTO", cafeDTO);
		return "admin/index";
	}
	
	@GetMapping("/createCafeForm")
	public String createCafeForm(MemberDTO memberDTO, Model model) {
		model.addAttribute("memberDTO", memberDTO);
		return "admin/createCafeForm";
	}
}
