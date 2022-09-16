package com.itbank.navercafe.admin.deco.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("/admin/deco")
public class AdminDecoController {
	
	@GetMapping("frontdoor")
	public String frontdoor() {
		return "admin/deco/frontdoor";
	}
	
	// 스킨 설정 페이지로 이동
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
		
		if(cafeDTO.getCafeSkin() == null) {
			cafeDTO.setCafeSkin("default");
		}
			
		model.addAttribute("skinList", skinList);
		model.addAttribute("cafeDTO", cafeDTO);
		
		return "admin/deco/skin";
	}
	
	// 스킨 저장
	@PostMapping(value="skinSave", produces="application/json; charset=utf8")
	@ResponseBody
	public HashMap<Object, Object> skinSave(@RequestBody CafeDTO cafeDTO) {
		HashMap<Object, Object> map = new HashMap<>();
		int result = 0;
		
		System.out.println("cafeId : " + cafeDTO.getCafeId());
		System.out.println("skin : " + cafeDTO.getCafeSkin());
	
		result = 1;
		
		map.put("result", result);

		return map;
	}
	
	
	@GetMapping("title")
	public String title(HttpServletRequest request, CafeDTO cafeDTO, Model model) {
		String contextPath = request.getContextPath();
		
		cafeDTO.setCafeTitle(contextPath + "/resources/upload/1794220617_XSpkAiBo_pexels-eberhard-grossgasteiger-1287142.jpg");
		
		model.addAttribute("cafeDTO", cafeDTO);
		
		return "admin/deco/title";
	}
	
	

}
