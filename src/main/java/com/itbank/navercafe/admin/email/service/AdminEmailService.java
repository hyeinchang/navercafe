package com.itbank.navercafe.admin.email.service;

import java.util.ArrayList;

import com.itbank.navercafe.admin.email.dto.AdminEmailDTO;

public interface AdminEmailService {
	public String getMessage(String msg, String url) throws Exception;
	public void sendMail(String to, String subject, String body) throws Exception;
	public void sendMail(AdminEmailDTO emailDTO) throws Exception;
	public ArrayList<String> getUserEmail(String cafeId) throws Exception;
	public String sendAllMail(String subject, String content, String cafeId) throws Exception;
	public String sendAllMail(AdminEmailDTO emailDTO) throws Exception;
}
