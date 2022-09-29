package com.itbank.navercafe.user.cafe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafejoin.dto.CafeJoinDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.service.CafeMemberService;
import com.itbank.navercafe.user.category.dto.MenuDTO;
import com.itbank.navercafe.user.member.dto.MemberDTO;
import com.itbank.navercafe.user.member.service.MemberService;


@Controller
@RequestMapping("/user")
public class CafeController {
	
	@Autowired MemberService ms;
	@Autowired CafeMemberService cms;
	
	@GetMapping("/main")
	public String index(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes, 
			@RequestParam(value="cafeId", required=false) String cafeId, HttpSession session) {
		if(cafeId == null || cafeId.length() == 0) {
			redirectAttributes.addFlashAttribute("message", "존재하지 않는 카페입니다.");
			return "redirect:/";
		}
		
		ArrayList<MenuDTO> categoryList = new ArrayList<>();
		String[] layoutArr = {"card", "album", "board"};
		int categoryCount = 1;
		
		for(String l : layoutArr) {
			MenuDTO category = new MenuDTO();
			String link = request.getContextPath() + "/menu/iboard?layout=";
			
			if(l.equals("card")) {
				category.setCategoryName("카드형 통합게시판");
			} else if(l.equals("album")) {
				category.setCategoryName("앨범형 통합게시판");
			} else if(l.equals("board")) {
				category.setCategoryName("게시판형 통합게시판");
			}
			
			category.setCategoryNo(++categoryCount);
			category.setCategoryType("통합게시판");
			category.setCategoryLink(link+l);
			
			categoryList.add(category);
		}
		
		CafeDTO cafeDTO = new CafeDTO();
		int order = Integer.parseInt(cafeId.replaceAll("\\D", ""));
		String skin = "default";
		cafeDTO.setCafeManagerNickName("테스트 카페" + order + "의 매니저 아이디");
		
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
			cafeDTO.setCafeLayout(1);
			break;
		case 6 : skin = "turquoise";
			break;
		case 7 : skin = "yellow";
			break;
		}
		
		cafeDTO.setCafeId(cafeId);
		cafeDTO.setCafeSkin(skin);
		cafeDTO.setCafeName("테스트 카페" + order);
		cafeDTO.setCafeIntroduce("테스트 카페"+ order +"(cafeId: cafeId"+ order +")에 대한 소개입니다.");
	
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cafeDTO", cafeDTO);
		//
		//
		String userId = (String) session.getAttribute("loginId");
		Integer result = cms.cafeMembers(cafeId,userId);
		model.addAttribute("cafemem",result);
		if(session.getAttribute("loginId")!=null) {
			profileUpdate(cafeId, model, session);
		}
		
		return "user/main";
	}
	
	
	
	@PostMapping("login")
	public String login(MemberDTO memberDTO,
			HttpServletRequest request,HttpSession session) {
		String url = "/";
		String referer = request.getHeader("referer");
		int result = ms.loginChk(request);
		MemberDTO name = ms.getU(memberDTO.getId());
		if(result==0) {
			session.setAttribute("loginId",  memberDTO.getId());
			session.setAttribute("loginName",  name.getName());
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
	
	@GetMapping("cafeSignup")  //카페 회원가입 페이지 이동
	public String cafeSignup(Model model, String cafeId) {
		model.addAttribute("cafeId",cafeId);
		return "user/cafeSignup";
	}
	
	@PostMapping("cafeRegApp") //카페 회원가입
	public String cafeReg(CafeMemberDTO dto, String cafeId, Model model) {
		int result = cms.signup(dto);
		if(result==1) {
			//model.addAttribute("",1);
			return "redirect:/user/main?cafeId="+cafeId;
		}
		return "redirect:/user/main?cafeId="+cafeId;
	}
	
	@GetMapping("profileUpdate") // 회원정보수정창 이동 + 개인정보
	public String profileUpdate(String cafeId, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("loginId");
		CafeMemberDTO dto = cms.getCafeMember(cafeId,userId);
		
		model.addAttribute("cafeMember",dto);
		model.addAttribute("cafeId",cafeId);
		return "user/profileUpdate";
	}
	
	@PostMapping("profilesubmit") // 회원정보수정
	public String profilesubmit(CafeMemberDTO dto) {
		int result = cms.cafeMemberUpdate(dto);
		if(result == 1) {
			
			return "redirect:/user/main?cafeId="+dto.getCafeId();
		}
		
		return "redirect:/user/main?cafeId="+dto.getCafeId();
	}
	
	//@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	@PostMapping(value = "/nickCheck") // 카페회원정보수정 닉네임 체크
	public @ResponseBody String nickCheck(@RequestParam("oldNick") String oldNick,@RequestParam("id") String cafeUserNickname, @RequestParam("cafeId")String cafeId) {
		String result = cms.idOverlap(cafeUserNickname,cafeId, oldNick);
		
		return result;
	}
	@PostMapping(value = "/nickCheck2") // 카페 회원가입 닉네임 체크
	public @ResponseBody String nickCheck2(@RequestParam("id") String cafeUserNickname, @RequestParam("cafeId")String cafeId) {
		String result = cms.idOverlap(cafeUserNickname,cafeId);
		
		return result;
	}
	
	//수정에 참고할?
	@PostMapping("saveData")
	public String saveData(MultipartHttpServletRequest mul,
							HttpServletRequest request){
		cms.writeSave(mul,request);
		return "redirect:goCafeMemberList";
	}
	//게시글 더 보러가기
	@GetMapping("userViewList")
	public String userViewList(String userId,Model model) {
		cms.getUserViewList(userId,model);
		return "board/userViewList";
	}
	
}
