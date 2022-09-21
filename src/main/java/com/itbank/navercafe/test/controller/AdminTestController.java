package com.itbank.navercafe.test.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.itbank.navercafe.admin.test.dto.TestDTO;

@RequestMapping(value="/test")
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
	public String testSmarteditor(Model model) {
		return "admin/test/smarteditor";
	}

	@RequestMapping(value="/smarteditor/save")
	public String testSmarteditorSave(TestDTO testDTO) {
		return "admin/test/smarteditor";
	}
	
	@RequestMapping(value="/smarteditor/saveAjax", produces="application/json")
	@ResponseBody
	public int testSmarteditorSaveAjax() {
		int result = 0;
		
		result = 1;
		
		return result;
	}
}