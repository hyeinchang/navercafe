package com.itbank.navercafe.admin.deco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminDecoController {
	
	@GetMapping("frontdoor")
	public String frontdoor() {
		return "admin/deco/frontdoor";
	}
	
	
	@GetMapping("skin")
	public String skin() {
		return "admin/deco/skin";
	}
	
	
	@GetMapping("title")
	public String title() {
		return "admin/deco/title";
	}
	
	

}
