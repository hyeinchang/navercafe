package com.itbank.navercafe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.navercafe.user.cafe.controller.CafeController;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.member.dto.MemberDTO;
import com.itbank.navercafe.user.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController { //메인 로그인관련
	
	@Autowired MemberService ms; 
	@Autowired CafeController cc;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		String url = "home";
		url = "index";
		
		String contextPath = request.getContextPath();
		
		ArrayList<CafeDTO> cafeList = new ArrayList<>();
		ArrayList<CafeDTO> rankingList = new ArrayList<>();
		
		for(int i=0; i<10; i++) {
			CafeDTO cafe = new CafeDTO();
			int order = i+1;
			String skin = "";
			cafe.setCafeId("cafeId" + order);
			cafe.setCafeName("테스트 카페" + order);
			cafe.setCafeIntroduce("테스트 카페"+ order +"(cafeId: cafeId"+ order +")에 대한 소개입니다.");
		
			
			switch(order) {
			case 1 : skin = "asphalt";
			
				break;
			case 2 : skin = "blue";
			
				break;
			case 3 : skin = "brown";
				break;
			case 4 : skin = "mustard";
				break;
			case 5 : skin = "pomegranate";
				break;
			case 6 : skin = "turquoise";
				break;
			case 7 : skin = "yellow";
				break;
			}
			
			cafeList.add(cafe);
			
			if(order <= 3) {
				rankingList.add(cafe);
			}
		}
		
		model.addAttribute("cafeList" , cafeList);
		model.addAttribute("rankingList" , rankingList);
		
		return url;
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "member/signup";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto) {
		int result = ms.signup(dto);
		if(result==1) {
			return "redirect:/";
		}
		return "redirect:signup";
	}
	
	@GetMapping("/userInfo")
	public String userUpdate(String id, Model model) {
		MemberDTO dto = ms.getU(id);
		
		model.addAttribute("id", dto.getId());
		model.addAttribute("name", dto.getName());
		model.addAttribute("phone", dto.getPhone());
		model.addAttribute("addr1", dto.getAddr1());
		model.addAttribute("addr2", dto.getAddr2());
		model.addAttribute("addr3", dto.getAddr3());
		model.addAttribute("email", dto.getMail());
		return "member/userInfo";
	}
	
	@PostMapping("/userUpdate")
	public String userUpdate(MemberDTO dto) {
		String url = "http://localhost:8085/navercafe/";
		if(dto.getPassword()!="") {
			int result = ms.update(dto);
			if(result==1) {
				return "redirect:"+url;
			}return "redirect:"+url;
		}
		return "redirect:"+url;
	}
	
	@GetMapping("delete")
	public String delete(String id, HttpServletRequest request, HttpSession session) {
		String url = "http://localhost:8085/navercafe/";
		cc.logout(request, session);
		
		int result = ms.delete(id);
		if(result==1) {
			return "redirect:"+url;
		}
		return "redirect:"+url;
	}
}
