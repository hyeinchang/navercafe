package com.itbank.navercafe.admin.email.service;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class AdminEmailService {
	@Autowired JavaMailSender mailSender;
	
	public String getMessage(String msg, String url) {
		String message = "";
		message += "<script>alert('"+msg+"');";
		message += "location.href='"+url+"';</script>";
		return message;
	}
	
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper mm = new MimeMessageHelper(message, true, "utf-8");
			mm.setSubject(subject);
			mm.setTo(to);
			mm.setText(body);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

	public ArrayList<String> getUserEmail(String cafeId) {
		// return mapper.getEmailList(cafeId);
		// 에러 방지를 위한 메소드 매퍼 구현 후 삭제요망
		ArrayList<String> EmailList = new ArrayList<>();
		return EmailList;
	}

	
	public String sendAllMail(String subject, String content, String cafeId) {
		ArrayList<String> emailList = getUserEmail(cafeId);
		// ArrayList<String> emailList = mapper.getEmailList(cafeId); 메퍼 만들어야함
		
		for(String email : emailList) {
			if(email.length() > 1) {
				sendMail(email, subject, content);
			}
		}
		
		String url, msg;
		msg = "성공적으로 반영되었습니다";
		url = "email";
		return getMessage(msg,url);
	}
	
}
