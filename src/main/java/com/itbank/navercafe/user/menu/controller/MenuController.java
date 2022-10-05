package com.itbank.navercafe.user.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class MenuController {
	@GetMapping("iboard")
	public String iboard(String layout) {
//		System.out.println("layout : " + layout);
		return "redirect:/";
	}
}
