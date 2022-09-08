package com.itbank.navercafe.admin.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminMenuController {
	
	@GetMapping("menu")
	public String menu() {
		return "admin/menu/menu";
	}
	
}
