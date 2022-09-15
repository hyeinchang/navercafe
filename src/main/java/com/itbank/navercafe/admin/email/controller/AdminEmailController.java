package com.itbank.navercafe.admin.email.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.email.service.AdminEmailService;

@Controller
@RequestMapping("admin")
public class AdminEmailController {
	@Autowired AdminEmailService ams;
	
	@GetMapping("email")
	public String email() {
		return "admin/email/email";
	}
	
	
	@PostMapping("sendAllMail")
	public void sendAllMail(HttpServletRequest req, HttpServletResponse resp,
					String subject, String content, String cafeId) throws Exception {
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(ams.sendAllMail(subject, content, cafeId)); 
	}	
	
	
}
