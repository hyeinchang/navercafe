package com.itbank.navercafe.admin.memberstaff.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.cafemember.dto.AdminCafeMemberDTO;
import com.itbank.navercafe.admin.memberstaff.dto.AllMembersDTO;
import com.itbank.navercafe.admin.memberstaff.service.AdminMemberStaffService;

@Controller
@RequestMapping("admin")
public class AdminMemberStaffController {
	@Autowired AdminMemberStaffService amss;

	@GetMapping("manageAllMembers")
	public String manageAllMembers(Model model, String cafeId) {
		ArrayList<AllMembersDTO> amList = amss.getAllMembersList(cafeId);
		ArrayList<String> gradeNameList = amss.getCafeGradeNames(cafeId);
		System.out.println("리스트 사이즈 : " + gradeNameList.size());
		
		model.addAttribute("list", amList);
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("gradeList", gradeNameList);
		
		return "admin/memberStaff/manageAllMembers";
	}
	
	@GetMapping("manageDeportedMembers")
	public String manageDeportedMembers(Model model) {
		ArrayList<AdminCafeMemberDTO> list = new ArrayList<>();
		for(int i = 0; i < 3; i++) {
			AdminCafeMemberDTO pcm = new AdminCafeMemberDTO();
			pcm.setUserName("테스트"+i);
			pcm.setUserId("ddd"+i);
			pcm.setUserEmail("email"+i);
			pcm.setUserLevel(i);
			pcm.setUserPoint(i);
			list.add(pcm);
		}
		
		model.addAttribute("list", list);
		return "admin/memberStaff/manageDeportedMembers";
	}
	
	@GetMapping("manageStaffs")
	public String manageStaffs() {
		return "admin/memberStaff/manageStaffs";
	}
	
	
	@PostMapping("modifyMembers")
	public String modifyMembers(String modifyMembers) {
		amss.modifyMembers(modifyMembers);
		return "redirect:manageAllMembers";
	}
	
	@PostMapping("deportMembers")
	public String deportMembers(String deportMembers) {
		amss.deportMembers(deportMembers);
		return "redirect:manageAllMembers";
	}
	
	@PostMapping("emailMembers")
	public String emailMembers(String emailMembers) {
		amss.emailMembers(emailMembers);
		return "redirect:manageAllMembers";
	}
	
	@PostMapping("unbanMembers")
	public String unbanMembers(String unbanMembers) {
		amss.unbanMembers(unbanMembers);
		return "redirect:manageDeportedMembers";
	}
	
	@PostMapping("banMembers")
	public String banMembers(String banMembers) { 
		amss.banMembers(banMembers);
		return "redirect:manageDeportedMembers";
	}
	

	
	
}
