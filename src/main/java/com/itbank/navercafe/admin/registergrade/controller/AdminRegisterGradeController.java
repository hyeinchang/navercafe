	package com.itbank.navercafe.admin.registergrade.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.navercafe.admin.cafemember.dto.AdminCafeMemberDTO;
import com.itbank.navercafe.admin.registergrade.dto.GradeUpAppliesDTO;
import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterBanDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterRequestDTO;
import com.itbank.navercafe.admin.registergrade.service.AdminRegisterGradeService;

@Controller
@RequestMapping("admin")
public class AdminRegisterGradeController {
	@Autowired AdminRegisterGradeService rgs;
	
	@GetMapping("manageMembersGrade")
	public String manageMembersGrade(Model model, String cafeId) {
		ArrayList<MembersGradeDTO> mgList = rgs.getMembersGradeList(cafeId);
		
		model.addAttribute("list", mgList);
		model.addAttribute("cafeId", cafeId);
		return "admin/registerGrade/manageMembersGrade";
	}
	
	@GetMapping("manageGradeUpApplies")
	public String manageGradeUpApplies(Model model, String cafeId) {
		ArrayList<GradeUpAppliesDTO> guaList = rgs.getGradeUpAppliesList(cafeId);
		
		model.addAttribute("list", guaList);
		model.addAttribute("cafeId", cafeId);
		return "admin/registerGrade/manageGradeUpApplies";
	}
	
	@GetMapping("manageRegisterBan")
	public String manageRegisterBan(Model model, String cafeId, String userId) {
		ArrayList<RegisterBanDTO> rbList = rgs.getRegisterBanList(cafeId);
		
		model.addAttribute("list", rbList);
		model.addAttribute("cafeId", cafeId);
		return "admin/registerGrade/manageRegisterBan";
	}
	
	@GetMapping("manageRegisterInfo")
	public String manageRegisterInfo(Model model, String cafeId) {
		RegisterInfoDTO dto = rgs.getRegisterInfo(cafeId);
		
		model.addAttribute("regiInfo", dto);
		model.addAttribute("cafeId", cafeId);
		
		return "admin/registerGrade/manageRegisterInfo";
	}
	
	@GetMapping("manageRegisterRequest")
	public String manageRegisterRequest(Model model, String cafeId) {
		ArrayList<RegisterRequestDTO> rrList = rgs.getRegisterRequestList(cafeId);
		
		model.addAttribute("list", rrList);
		model.addAttribute("cafeId", cafeId);
		
		return "admin/registerGrade/manageRegisterRequest";
	}
	
	@PostMapping("unbanMembers2")
	public void unbanMembers2(String unbanMembers, String cafeId, HttpServletResponse resp) throws Exception{
		String msg = rgs.unbanMembers2(unbanMembers, cafeId);
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("acceptMembers")
	public void acceptMembers(String cafeId, String acceptMembers, HttpServletResponse resp) throws Exception {
		String msg = rgs.acceptMembers(cafeId, acceptMembers);
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("rejectMembers")
	public void rejectMembers(String cafeId, String rejectMembers, HttpServletResponse resp) throws Exception {
		String msg = rgs.rejectMembers(cafeId, rejectMembers); 
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	//등업 허가
	@PostMapping("gradeUpMembers")
	public void gradeUpMembers(String gradeUpMembers, String cafeId, HttpServletResponse resp) throws IOException {
		String msg = rgs.gradeUpMembers(cafeId, gradeUpMembers);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	//등업 거절
	@PostMapping("gradeRejectMembers")
	public void gradeRejectMembers(String gradeRejectMembers, String cafeId, HttpServletResponse resp) throws IOException {
		String msg = rgs.gradeRejectMembers(cafeId, gradeRejectMembers);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	//가입정보 수정
	@PostMapping("modifyRegisterInfo")
	public void modifyRegisterInfo(RegisterInfoDTO dto, HttpServletResponse resp) throws Exception {
		String msg = rgs.modifyRegisterInfo(dto);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping(value="modifyMembersGrade", produces="application/json; charset=utf-8")
	@ResponseBody
	public String modifyMembersGrade(@RequestBody Map<String, List<MembersGradeDTO>> dataList) {
		List<MembersGradeDTO> update = dataList.get("data");
		return rgs.modifyMembersGrade(update);
	}
	
	
}
