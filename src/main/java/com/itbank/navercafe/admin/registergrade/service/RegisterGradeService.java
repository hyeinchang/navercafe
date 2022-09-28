package com.itbank.navercafe.admin.registergrade.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;

public interface RegisterGradeService {

	public void unbanMembers2(String unbanMembers);

	public String acceptMembers(String acceptMembers);

	public String rejectMembers(String rejectMembers, HttpServletRequest req);

	public String modifyMembersGrade(List<MembersGradeDTO> result);

	public String modifyRegisterInfo(RegisterInfoDTO dto);

}
