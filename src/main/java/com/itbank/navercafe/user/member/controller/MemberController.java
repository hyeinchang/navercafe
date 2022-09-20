package com.itbank.navercafe.user.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.user.member.service.MemberService;



@Controller
@RequestMapping("/user/board")
public class MemberController {
	@Autowired MemberService ser;
	@GetMapping("/goMemberList")
	public String goMemberList(Model model) {
		model.addAttribute("memberList",ser.getMemberList());
		return "user/board/memberList";
	}

}
