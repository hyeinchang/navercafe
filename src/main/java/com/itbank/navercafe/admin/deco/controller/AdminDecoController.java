package com.itbank.navercafe.admin.deco.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.admin.deco.service.AdminDecoService;
import com.itbank.navercafe.comon.file.FileUtils;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("/admin/deco")
public class AdminDecoController {
	@Autowired
	private AdminDecoService adminDecoService;
	
	@Autowired
	private FileUtils fileUtils;
	
	@GetMapping("frontdoor")
	public String frontdoor(HttpServletRequest request, CafeDTO cafeDTO, Model model) {
		
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
		
		model.addAttribute("cafeDTO", cafeDTO);
		
		return "admin/deco/frontdoor";
	}
	
	// 대문 저장
	@PostMapping(value="saveFront", produces="application/json; charset=utf8")
	@ResponseBody
	public HashMap<Object, Object> saveFront(@RequestBody CafeDTO cafeDTO) {
		HashMap<Object, Object> map = new HashMap<>();
		int result = 0;
		
		System.out.println("cafeId : " + cafeDTO.getCafeId());
		System.out.println("front : " + cafeDTO.getCafeFront());
	
		result = 1;
		
		map.put("result", result);

		return map;
	}
	
	// 스킨 설정 페이지로 이동
	@GetMapping("/skin")
	public String skin(CafeDTO cafeDTO, Model model) {
		ArrayList<String> skinList = new ArrayList<>();
		
		try {
			
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
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "admin/deco/skin";
	}
	
	// 스킨 저장
	@PostMapping(value="saveSkin", produces="application/json; charset=utf8")
	@ResponseBody
	public HashMap<Object, Object> saveSkin(@RequestBody CafeDTO cafeDTO) {
		HashMap<Object, Object> map = new HashMap<>();
		int result = 0;
		
		System.out.println("cafeId : " + cafeDTO.getCafeId());
		System.out.println("skin : " + cafeDTO.getCafeSkin());
	
		result = 1;
		
		map.put("result", result);

		return map;
	}
	
	// 타이틀 설정페이지로 이동
	@GetMapping("title")
	public String title(HttpServletRequest request, CafeDTO cafeDTO, Model model) {
		String contextPath = request.getContextPath();
		
		
		model.addAttribute("cafeDTO", cafeDTO);
		
		return "admin/deco/title";
	}
	
	@RequestMapping(value="saveTitle", produces="application/json; charset=utf8")
	@ResponseBody
	public HashMap<Object, Object> saveTitle(MultipartHttpServletRequest multiRequest) {
		HashMap<Object, Object> map = new HashMap<>();
		MultipartFile multipartFile = multiRequest.getFile("titleImage");
		int result = 0;
		
		try {
			String directory = "title";
			String cafeId =  multiRequest.getParameter("cafeId");
			
			System.out.println("cafeId : " + cafeId);
			System.out.println("tileImage : " + multipartFile.getOriginalFilename());
			
			if(cafeId != null && cafeId.length() > 0) {
				directory += "/" + cafeId;
			}
			
			fileUtils.uploadFile(multipartFile, directory);
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		result = 1;
		
		map.put("result", result);
		
		return map;
	}
	
	// 타이틀 설정페이지로 이동
	@GetMapping("deleteTitle")
	public String deleteTitle(HttpServletRequest request, CafeDTO cafeDTO) {
		String cafeId ="";
		
		try {
			if(cafeDTO != null && cafeDTO.getCafeId() != null) {
				int titleNum = cafeDTO.getTitleNum();
				
				adminDecoService.deleteTitle(titleNum);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/deco/title?cafeId="+cafeId;
	}

}
