package com.itbank.navercafe.admin.registergrade.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.itbank.navercafe.admin.registergrade.dto.GradeUpAppliesDTO;
import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterBanDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterRequestDTO;

public interface AdminRegisterGradeService {

	public String acceptMembers(String cafeId, String acceptMembers);

	public String rejectMembers(String cafeId, String rejectMembers);

	public String modifyMembersGrade(List<MembersGradeDTO> result);

	public String modifyRegisterInfo(RegisterInfoDTO dto);

	public String unbanMembers2(String unbanMembers, String cafeId);

	//등업 허가
	public String gradeUpMembers(String cafeId, String gradeUpMembers);
	//등업 거절
	public String gradeRejectMembers(String cafeId, String gradeRejectMembers);

	public ArrayList<MembersGradeDTO> getMembersGradeList(String cafeId);

	public ArrayList<GradeUpAppliesDTO> getGradeUpAppliesList(String cafeId);

	public ArrayList<RegisterBanDTO> getRegisterBanList(String cafeId);

	public RegisterInfoDTO getRegisterInfo(String cafeId);

	public ArrayList<RegisterRequestDTO> getRegisterRequestList(String cafeId);

}
