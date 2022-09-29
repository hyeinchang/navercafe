package com.itbank.navercafe.user.cafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.service.CafeService;
import com.itbank.navercafe.user.member.dto.MemberDTO;
import com.itbank.navercafe.user.menu.service.MenuService;

@Controller
@RequestMapping("/user")
public class CafeController {
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/main")
	public String main(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes, 
			CafeDTO cafeDTO, HttpSession session) {
		
		if(cafeDTO == null || cafeDTO.getCafeId() == null) {
			redirectAttributes.addFlashAttribute("message", "존재하지 않는 카페입니다.");
			return "redirect:/";
		}
		
		try {
			String loginId = (String) session.getAttribute("loginId");
			cafeDTO.setLoginId(loginId);
			cafeDTO = cafeService.selectCafe(cafeDTO);	
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("cafeDTO", cafeDTO);
		
		return "user/main";
	}
	
	@PostMapping("login")
	public String login(MemberDTO memberDTO,
			HttpServletRequest request,HttpSession session) {
		String url = "/";
		String referer = request.getHeader("referer");
		
		if(memberDTO != null && memberDTO.getId().equals("chi9148") && memberDTO.getPassword().equals("1234")) {
			session.setAttribute("loginId",  memberDTO.getId());
			session.setAttribute("loginName",  "장혜인");
		}
		
		if(referer != null) {
			url = referer;
		}

		return "redirect:" + url;
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request,HttpSession session) {
		String url = "/";
		String referer = request.getHeader("referer");
		
		session.invalidate();
		
		if(referer != null) {
			url = referer;
		}

		return "redirect:" + url;
	}
	
	@GetMapping("/changeColor")
	public String changeColor(HttpServletRequest request, HttpSession session, String color) {
		session.setAttribute("color", color);
		return "test/main";
	}
}
