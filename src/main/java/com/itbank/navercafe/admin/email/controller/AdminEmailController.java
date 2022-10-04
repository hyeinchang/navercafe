package com.itbank.navercafe.admin.email.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.email.dto.AdminEmailDTO;
import com.itbank.navercafe.admin.email.service.AdminEmailService;

@Controller
@RequestMapping("/admin/email")
public class AdminEmailController {
	@Autowired AdminEmailService ams;
	
	
	@GetMapping("/emailForm")
	public String email(AdminEmailDTO emailDTO, Model model, String cafeId) {
		emailDTO.setCafeName(ams.getCafeName(cafeId));
		
		model.addAttribute("emailDTO", emailDTO);
		model.addAttribute("cafeId", cafeId);
		
		return "admin/email/email";
	}
	
	
	@PostMapping("/sendAllMail")
	public void sendAllMail(HttpServletRequest req, HttpServletResponse resp, AdminEmailDTO emailDTO) throws Exception {
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		//out.print(ams.sendAllMail(emailDTO.getSubject(), emailDTO.getContent(), emailDTO.getCafeId())); 
		out.print(ams.sendAllMail(emailDTO));

	}
	
	
}
