package com.itbank.navercafe.admin.email.dto;

public class AdminEmailDTO {
	private String cafeId;
	private String cafeName;
	private String userEmail;
	private String subject;
	private String content;
	
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getCafeName() {
		return cafeName;
	}
	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}
	public String getToEmailAddress() {
		return userEmail;
	}
	public void setToEmailAddress(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
