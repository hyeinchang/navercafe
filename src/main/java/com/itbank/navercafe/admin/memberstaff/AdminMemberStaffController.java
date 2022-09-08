package com.itbank.navercafe.admin.memberstaff;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.cafemember.dto.AdminCafeMemberDTO;

@Controller
@RequestMapping("admin")
public class AdminMemberStaffController {

	@GetMapping("manageAllMembers")
	public String manageAllMembers(Model model) {
		
		ArrayList<AdminCafeMemberDTO> list = new ArrayList<>();
		for(int i = 0; i < 40; i++) {
			AdminCafeMemberDTO pcm = new AdminCafeMemberDTO();
			pcm.setUserName("응애"+i);
			pcm.setUserId("ddd"+i);
			pcm.setUserEmail("email"+i);
			pcm.setUserLevel(i);
			pcm.setUserPoint(i);
			list.add(pcm);
			
		}
		model.addAttribute("list", list);
		
		return "admin/memberStaff/manageAllMembers";
	}
	
	@GetMapping("manageDeportedMembers")
	public String manageDeportedMembers() {
		return "admin/memberStaff/manageDeportedMembers";
	}
	
	@GetMapping("manageStaffs")
	public String manageStaffs() {
		return "admin/memberStaff/manageStaffs";
	}
	
	
	@PostMapping("deportMembers")
	public String deportMembers(String deportMembers) {
		String[] arr = deportMembers.split("/");
		System.out.println(arr.length);
		for(int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
		return "redirect:manageAllMembers";
	}
	
	@PostMapping("emailMembers")
	public String emailMembers(String emailMembers) {
		String[] arr = emailMembers.split("/");
		System.out.println(arr.length);
		for(int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
		return "redirect:manageAllMembers";
	}
	
	@PostMapping("modifyMembers")
	public String modifyMembers(String modifyMembers) {
		String[] arr = modifyMembers.split("/");
		System.out.println(arr.length);
		for(int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
		return "redirect:manageAllMembers";
	}
	
	
}
