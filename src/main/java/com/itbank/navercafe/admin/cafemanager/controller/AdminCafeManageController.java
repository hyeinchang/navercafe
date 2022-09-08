package com.itbank.navercafe.admin.cafemanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminCafeManageController {
	
	@GetMapping("basicInfo")
	public String basicInfo() {
		return "admin/cafeManage/basicInfo";
	}
	
	@GetMapping("eventManage") 
	public String eventManage() {
		return "admin/cafeManage/eventManage";
	}
	
	@GetMapping("layoffManager")
	public String layoffManager() {
		return "admin/cafeManage/layoffManager";
	}
	
	
}
