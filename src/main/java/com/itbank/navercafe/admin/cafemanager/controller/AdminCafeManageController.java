package com.itbank.navercafe.admin.cafemanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("admin")
public class AdminCafeManageController {
	
	@GetMapping("basicInfo")
	public String basicInfo(CafeDTO cafeDTO) {
		return "admin/cafeManage/basicInfo";
	}
	
	@PostMapping("saveCafeBasic")
	public int saveCafeBasic(CafeDTO cafeDTO) {
		int result = 0;
		
		try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("eventManage") 
	public String eventManage() {
		return "admin/cafeManage/eventManage";
	}
	
	@GetMapping("layoffManager")
	public String layoffManager() {
		return "admin/cafeManage/layoffManager";
	}
	
	@GetMapping("searchId")
	public String searchId(String id) {
		return "매니저 : "+id;
	}
	
	
}
