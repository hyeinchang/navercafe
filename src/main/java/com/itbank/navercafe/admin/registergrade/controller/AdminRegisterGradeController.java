	package com.itbank.navercafe.admin.registergrade.controller;

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
import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
import com.itbank.navercafe.admin.registergrade.service.AdminRegisterGradeService;

@Controller
@RequestMapping("admin")
public class AdminRegisterGradeController {
	@Autowired AdminRegisterGradeService rgs;
	
	@GetMapping("manageMembersGrade")
	public String manageMembersGrade(Model model) {
		ArrayList<MembersGradeDTO> list = new ArrayList<>();
		for(int i = 0; i < 5; i++) {
			MembersGradeDTO dto = new MembersGradeDTO();
			dto.setCafeUserGrade("응애멤버"+i);
			dto.setCutDesc("응에멤버가 되려면 이렇게하세요"+i);
			dto.setCutBoard(i);
			dto.setCutReply(i*2);
			dto.setCutVisit(i*3);
			
			if (i < 3) {
				dto.setCutType(2);
				dto.setCutRemoved("");
			} else {
				dto.setCutType(3);
				dto.setCutRemoved("");
			}
			
			list.add(dto);
		}
		
		model.addAttribute("list", list);
		return "admin/registerGrade/manageMembersGrade";
	}
	
	@GetMapping("manageGradeUpApplies")
	public String manageGradeUpApplies() {
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
		dto.setJoin_question(true);
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
	public String unbanMembers2(String unbanMembers) {
		rgs.unbanMembers2(unbanMembers);
		return "redirect:manageRegisterBan";
	}
	
	@PostMapping("acceptMembers")
	public void acceptMembers(String acceptMembers, HttpServletResponse resp) throws Exception {
		String msg = rgs.acceptMembers(acceptMembers);
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("rejectMembers")
	public void rejectMembers(String rejectMembers, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String msg = rgs.rejectMembers(rejectMembers, req); 
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
	@PostMapping("gradeUpMembers")
	public void gradeUpMembers() {
		
	}
	
	@PostMapping("gradeRejectMembers")
	public void gradeRejectMembers() {
		
	}
	
	@PostMapping(value="modifyRegisterInfo", produces="application/json; charset=utf-8")
	@ResponseBody
	public String modifyRegisterInfo(@RequestBody Map<String, List<MembersGradeDTO>> dataList) {
		List<MembersGradeDTO> update = dataList.get("data");
		return rgs.modifyRegisterInfo(update);
	}
	
}
