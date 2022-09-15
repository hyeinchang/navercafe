package com.itbank.navercafe.admin.deco.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("admin")
public class AdminDecoController {
	
	@GetMapping("frontdoor")
	public String frontdoor() {
		return "admin/deco/frontdoor";
	}
	
	
	@GetMapping("skin")
	public String skin(CafeDTO cafeDTO, Model model) {
		ArrayList<String> skinList = new ArrayList<>();
		
		skinList.add("default");
		skinList.add("asphalt");
		skinList.add("blue");
		skinList.add("brown");
		skinList.add("mustard");
		skinList.add("pomegranate");
		skinList.add("turquoise");
		skinList.add("yellow");
		
		model.addAttribute("skinList", skinList);
		model.addAttribute("cafeDTO", cafeDTO);
		
		return "admin/deco/skin";
	}
	
	
	@GetMapping("title")
	public String title() {
		return "admin/deco/title";
	}
	
	

}
