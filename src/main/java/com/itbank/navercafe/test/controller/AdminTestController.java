package com.itbank.navercafe.test.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.itbank.navercafe.admin.test.dto.TestDTO;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping(value="/admin/test")
public class AdminTestController {
	@RequestMapping(value="/jsonArrayAjax")
	public String testJasonArrayAjax() {
		return "admin/test/jsonArrayAjax";
	}
	
	@RequestMapping(value="/jsonArrayAjax/act", produces="application/json")
	@ResponseBody
	public List<TestDTO> testJasonArrayAjaxAct(@RequestBody String data) {
		List<TestDTO> result = new ArrayList<TestDTO>();
		
		try {
			JSONParser jsonParser = new JSONParser();
			
			JSONArray jsonArray = (JSONArray) jsonParser.parse(data);
			
			Iterator it = jsonArray.iterator();
			
			int count = 1;
			
			while(it.hasNext()) {
				Gson gson = new Gson();
				JSONObject jsonObject = (JSONObject) it.next();
				TestDTO testDTO = gson.fromJson(jsonObject.toString(), TestDTO.class);
				
				System.out.println("act1 ==> testDTO" + count + " -- hello : " + testDTO.getHello());
				System.out.println("act1 ==> testDTO" + count + " -- bye : " + testDTO.getBye());
				
				result.add(testDTO);
				
				count++;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/jsonArrayAjax/act2", produces="application/json")
	@ResponseBody
	public List<TestDTO> testJasonArrayAjaxAct2(@RequestBody TestDTO testDTO) {
		List<TestDTO> result = testDTO.getTestDTOList();
		
		try {
			for(int i=0;i<result.size();i++){
				TestDTO tempDTO = result.get(i);
				int order = i+1;

				System.out.println("act2 ==> testDTO" + order + " -- hello : " + tempDTO.getHello());
				System.out.println("act2 ==> testDTO" + order + " -- bye : " + tempDTO.getBye());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/jsonArrayAjax/act3", produces="application/json")
	@ResponseBody
	public List<TestDTO> testJasonArrayAjaxAct3(@RequestBody Map<String, List<TestDTO>> data) {
		List<TestDTO> result = null;
		
		try {
			result = data.get("data");
		
			for(int i=0;i<result.size();i++){
				TestDTO tempDTO = result.get(i);
				int order = i+1;

				System.out.println("act3 ==> testDTO" + order + " -- hello : " + tempDTO.getHello());
				System.out.println("act3 ==> testDTO" + order + " -- bye : " + tempDTO.getBye());
			}
			 
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/smarteditor")
	public String testSmarteditor(CafeDTO cafeDTO, Model model) {
		cafeDTO.setCafeId("testCagfeId_20220922");
		cafeDTO.setCafeFront("<h2>Index</h2>\r\n" + 
				"            <div>\r\n" + 
				"                index 페이지입니다.\r\n" + 
				"            </div>\r\n" + 
				"            <iframe width=\"720\" height=\"405\" src=\"https://www.youtube.com/embed/0NwCKCmf0Qg\" title=\"아는 사람만 찾아먹는다는 자연산 잡어회(입질의 해산로드 #16, 마산 어시장편)\" \r\n" + 
				"            frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>");

		System.out.println("cafeId : " + cafeDTO.getCafeId());

		
		model.addAttribute("cafeDTO", cafeDTO);

		return "admin/test/smarteditor";
	}

	@RequestMapping(value="/smarteditor/save")
	public String testSmarteditorSave(CafeDTO cafeDTO, TestDTO testDTO) {
		String cafeId = "";
		try {
			cafeId = testDTO.getCafeId();
			System.out.println("==== submit으로 전송 했을 경우 ====");
			System.out.println("testDTO > cafeId : " + testDTO.getCafeId());
			System.out.println("testDTO > Content : " + testDTO.getContent());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/test/smarteditor?cafeId=" + cafeId;
	}
	
	@RequestMapping(value="/smarteditor/saveAjax", produces="application/json")
	@ResponseBody
	public int testSmarteditorSaveAjax(@RequestBody TestDTO testDTO) {
		int result = 0;
		
		try {
			result = 1;
			System.out.println("==== 비동기로 전송 했을 경우 ====");
			System.out.println("testDTO > cafeId : " + testDTO.getCafeId());
			System.out.println("testDTO > Content : " + testDTO.getContent());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
