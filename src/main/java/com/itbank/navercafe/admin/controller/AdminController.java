package com.itbank.navercafe.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@GetMapping("")
	public String index(CafeDTO cafeDTO) {
		System.out.println("cafeId : " + cafeDTO.getCafeId());
		return "admin/index";
	}
}
