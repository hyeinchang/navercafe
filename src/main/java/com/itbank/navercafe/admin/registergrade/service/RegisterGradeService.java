package com.itbank.navercafe.admin.registergrade.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface RegisterGradeService {

	public void unbanMembers2(String unbanMembers);

	public String acceptMembers(String acceptMembers);

	public String rejectMembers(String rejectMembers, HttpServletRequest req);

	public void modifyRegisterInfo(HttpServletRequest req, Model model);

}
