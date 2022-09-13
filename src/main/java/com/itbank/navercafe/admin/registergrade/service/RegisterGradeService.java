package com.itbank.navercafe.admin.registergrade.service;

import javax.servlet.http.HttpServletRequest;

public interface RegisterGradeService {

	public void unbanMembers2(String unbanMembers);

	public String acceptMembers(String acceptMembers);

	public String rejectMembers(String rejectMembers, HttpServletRequest req);

}
