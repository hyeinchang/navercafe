package com.itbank.navercafe.user.cafe.controller;

import java.util.ArrayList;

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
import com.itbank.navercafe.user.category.dto.MenuDTO;
import com.itbank.navercafe.user.member.dto.MemberDTO;

@Controller
@RequestMapping("/user")
public class CafeController {
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private FileService fileService;
	
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
		cafeDTO.setUserId("테스트 카페" + order + "의 매니저 아이디");
		
		switch(order) {
		case 1 : skin = "asphalt";
			cafeDTO.setCafeFront(" <h2>Random Text Title</h2>\r\n" + 
				"        <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat quis nibh vehicula, condimentum placerat lectus iaculis. Nam ultricies nisi vel ligula pulvinar, quis dapibus velit iaculis. In hac habitasse platea dictumst. In vitae\r\n" + 
				"          nunc tincidunt, euismod nibh sit amet, convallis arcu. Vestibulum feugiat auctor auctor. Phasellus lacinia auctor metus, in posuere justo egestas eget. Vivamus ornare tincidunt sagittis. Nunc pretium magna eu est condimentum malesuada. Nunc\r\n" + 
				"          arcu nulla, fringilla in sodales sed, laoreet eget mi. Fusce ac suscipit turpis, sed porttitor mauris. </p>\r\n" + 
				"        <img class=\"img-resposnive\" src=\"" + request.getContextPath() + "/resources/MaxiBiz/img/demo_01.jpg\" alt=\"\">\r\n" + 
				"\r\n" + 
				"        <p> Integer convallis justo augue, et condimentum tortor scelerisque ut. Ut mattis ullamcorper lacinia. Donec dignissim eu dui non ultrices. Fusce ullamcorper suscipit ante, eget ultrices ipsum faucibus sagittis. Nunc eu elit orci. Etiam id orci vitae\r\n" + 
				"          mauris bibendum molestie sit amet sed neque. Cras malesuada vulputate orci sed molestie. Phasellus accumsan nunc sit amet egestas suscipit. Duis non ipsum ac risus consequat dapibus placerat sed dui. Sed vitae risus scelerisque purus euismod\r\n" + 
				"          ornare. Phasellus ultricies ante vitae molestie adipiscing. </p>\r\n" + 
				"        <div class=\"clearfix\"></div>\r\n" + 
				"        <blockquote>\r\n" + 
				"          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n" + 
				"          <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n" + 
				"        </blockquote>\r\n" + 
				"        <div class=\"clearfix\"></div>\r\n" + 
				"        <p>Sed rutrum ac leo vel aliquet. Fusce vehicula orci vitae dui posuere, ac luctus tortor aliquam. Morbi ac cursus est. Nam arcu risus, tristique fringilla auctor luctus, congue id felis. Donec at semper turpis. Vivamus id tellus quis massa gravida\r\n" + 
				"          viverra a vitae urna. Integer facilisis aliquet velit a egestas. Pellentesque orci dui, rutrum ac nulla eget, laoreet sollicitudin nunc. Aliquam vel mollis turpis. Cras vitae sodales felis. Aliquam semper tincidunt nunc. Nullam tempor ipsum\r\n" + 
				"          purus, at commodo orci volutpat ac. Vivamus scelerisque nunc felis, nec euismod arcu gravida sed. Etiam tempus, purus posuere molestie blandit, tortor felis iaculis nisl, ac rhoncus nisi ipsum a enim. </p>\r\n" + 
				"        <blockquote class=\"pull-right\">\r\n" + 
				"          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n" + 
				"          <small>Someone famous in <cite title=\"Source Title\">Source Title</cite></small>\r\n" + 
				"        </blockquote>\r\n" + 
				"        <div class=\"clearfix\"></div>\r\n" + 
				"        <p>Integer convallis facilisis est, non vehicula ligula tincidunt ac. Curabitur dignissim quam mollis purus rhoncus imperdiet. Aliquam erat volutpat. Duis tempor vestibulum erat, in condimentum eros dignissim at. Maecenas elementum tortor nulla,\r\n" + 
				"          a suscipit mi tincidunt id. Morbi id felis luctus, aliquet neque cursus, aliquam leo. Pellentesque vel justo tincidunt, pulvinar justo id, vulputate tortor. </p>");
				
				if(session.getAttribute("loginId") != null && session.getAttribute("loginId").equals("chi9148")) {
					cafeDTO.setCafeMember(true);
				}
			break;
		case 2 : skin = "blue";
			cafeDTO.setCafeFront("<img src=\"" + request.getContextPath() + "/resources/upload/free-icon-joy-7021182.png\" id=\"userImg4894358\" style=\"width: 512px; height: 512px;\" alt=\"대문이미지\" onload=\"resizeImage(4894358)\" name=\"cafeuserimg\" onclick=\"popview(this)\"><div><br></div><div>카페 대문</div>");
		
			cafeDTO.setUserId("정보처리산업기사");
			
			if(session.getAttribute("loginId") != null && session.getAttribute("loginId").equals("chi9148")) {
				cafeDTO.setCafeMember(true);
				cafeDTO.setCafeManager(true);
				cafeDTO.setUserId("chi9148");
			}
			break;
		case 3 : skin = "brown";
			cafeDTO.setCafeFront("<h2>Index</h2>\r\n" + 
					"            <div>\r\n" + 
					"                index 페이지입니다.\r\n" + 
					"            </div>\r\n" + 
					"            <iframe width=\"720\" height=\"405\" src=\"https://www.youtube.com/embed/0NwCKCmf0Qg\" title=\"아는 사람만 찾아먹는다는 자연산 잡어회(입질의 해산로드 #16, 마산 어시장편)\" \r\n" + 
					"            frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>");
			break;
		case 4 : skin = "mustard";
			
			break;
		case 5 : skin = "pomegranate";
			cafeDTO.setCafeLayout("1");
			break;
		case 6 : skin = "turquoise";
			break;
		case 7 : skin = "yellow";
			break;
		}
		
		cafeDTO.setCafeId(cafeId);
		cafeDTO.setCafeSkin(skin);
		cafeDTO.setCafeName("테스트 카페" + order);
		cafeDTO.setUserId("테스트 카페"+ order +"(cafeId: cafeId"+ order +")에 대한 소개입니다.");
	
		model.addAttribute("categoryList", categoryList);
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
