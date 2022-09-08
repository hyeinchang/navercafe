package com.itbank.navercafe.admin.email.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminEmailController {
	
	@GetMapping("email")
	public String email() {
		return "admin/email/email";
	}
}
