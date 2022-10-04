package com.itbank.navercafe.admin.cafemanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.navercafe.admin.cafemanager.service.AdminCafeManagerService;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("admin")
public class AdminCafeManageController {
	@Autowired AdminCafeManagerService acms;
	
	@GetMapping("basicInfo")
	public String basicInfo(Model model, CafeDTO cafeDTO) {
		return "admin/cafeManage/basicInfo";
	}
	
	@GetMapping("eventManage") 
	public String eventManage(Model model) {
		return "admin/cafeManage/eventManage";
	}
	
	@GetMapping("layoffManager")
	public String layoffManager(Model model, String cafeId) {
		model.addAttribute("cafeId", cafeId);
		return "admin/cafeManage/layoffManager";
	}
	
	@GetMapping(value="searchId", produces="application/json; charset=utf8")
	@ResponseBody
	public String searchId(String id, String cafeId) {
		return acms.searchId(id, cafeId);
	}
	
	@GetMapping(value="searchNickname", produces="application/json; charset=utf8")
	@ResponseBody
	public String searchNickname(String nickname, String cafeId) {
		System.out.println(nickname);
		System.out.println(cafeId);
		return acms.searchNickname(nickname, cafeId);
	}
	
	@PostMapping("changeManager")
	public void changeManager(String cafeId, String searchResult) {
		acms.changeManager(cafeId, searchResult);
	}
	
	
}
