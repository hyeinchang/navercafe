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
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
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
	public String manageRegisterBan(Model model) {
		
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
		return "admin/registerGrade/manageRegisterBan";
	}
	
	@GetMapping("manageRegisterInfo")
	public String manageRegisterInfo(Model model, String cafeId) {
		RegisterInfoDTO dto = new RegisterInfoDTO();
		dto.setExplanation("카페설명입니다");
		dto.setJoin_question(true); // 컨트롤러/등에서 직접 설정 해줘야 질문 뿌리기 안뿌리기 설정함
		dto.setQ1Content("1번질문 내용");
		dto.setQ2Content("2번 질문내용입니다~");
		dto.setQ3Content("3번내용입니다~");
		
		if(dto.getQ3Content() != null ) {
			dto.setQuestionQty(3);
		} else if(dto.getQ2Content() != null) {
			dto.setQuestionQty(2);
		} else if(dto.getQ1Content() != null) {
			dto.setQuestionQty(1);
		} else if(dto.getQ1Content() == null) {
			dto.setQuestionQty(0);
		}
		
		model.addAttribute("regiInfo", dto);
		
		// rgs.getCafeInfo(cafeId, model); 가입신청 넣을때 뿌려주는 인포 그대로 가져오면됨
		
		return "admin/registerGrade/manageRegisterInfo";
	}
	
	@GetMapping("manageRegisterRequest")
	public String manageRegisterRequest() {
		return "admin/registerGrade/manageRegisterRequest";
	}
	
	@PostMapping("unbanMembers2")
	public String unbanMembers2(String unbanMembers, String cafeId) {
		return "redirect:manageRegisterBan";
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
	
	@PostMapping(value="modifyMembersGrade", produces="application/json; charset=utf-8")
	@ResponseBody
	public String modifyMembersGrade(@RequestBody Map<String, List<MembersGradeDTO>> dataList) {
		List<MembersGradeDTO> update = dataList.get("data");
		return rgs.modifyMembersGrade(update);
	}
	
	@PostMapping("modifyRegisterInfo")
	public String modifyRegisterInfo(RegisterInfoDTO dto) {
		String msg = rgs.modifyRegisterInfo(dto);
		return "redirect:manageRegisterInfo";
	}
	
}
