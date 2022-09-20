package com.itbank.navercafe.admin.deco.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.json.Jackson2JsonDecoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import com.itbank.navercafe.admin.deco.dto.TestDTO;
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
	public String frontdoor() {
		
		
		return "admin/deco/frontdoor";
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
		
		System.out.println("cafeId : " + multiRequest.getParameter("cafeId"));
		System.out.println("tileImage : " + multipartFile.getOriginalFilename());
		
		try {
			fileUtils.uploadFile(multipartFile, "title");
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		result = 1;
		
		map.put("result", result);
		
		return map;
	}
	

	@RequestMapping(value="test", produces="application/json; charset=utf8")
	@ResponseBody
	public HashMap<Object, Object> test(@RequestBody String data) {
		HashMap<Object, Object> map = new HashMap<>();
		int result = 0;
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			System.out.println("data : " + data);
			JSONParser jsonParser = new JSONParser();
			JSONArray array =  new JSONArray();
			Object obj = jsonParser.parse(data);
			
			array = (JSONArray) obj;
			
			System.out.println(array);
			
			JSONObject object = (JSONObject) array.get(0);
			JSONObject object2 = (JSONObject) array.get(1);
			
			Gson gson = new Gson();
			
			TestDTO testDTO = gson.fromJson(object.toString(), TestDTO.class);
			TestDTO testDTO2 = gson.fromJson(object2.toString(), TestDTO.class);
			
			System.out.println("gson1 --- " + testDTO.getHello());
			System.out.println("gson2 --- " + testDTO2.getHello());
			
			Iterator it = array.iterator();
			
			while(it.hasNext()) {
				System.out.println(it.next());
			}
			
			System.out.println(object.get("hello"));
			System.out.println(object2.get("hello"));
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
