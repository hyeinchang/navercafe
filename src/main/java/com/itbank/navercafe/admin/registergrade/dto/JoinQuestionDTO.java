package com.itbank.navercafe.admin.registergrade.dto;

public class JoinQuestionDTO {
	private String cafeQuestionContent, cafeId;
	private int cafeQuestionNum;
	
	public int getCafeQuestionNum() {
		return cafeQuestionNum;
	}
	public void setCafeQuestionNum(int cafeQuestionNum) {
		this.cafeQuestionNum = cafeQuestionNum;
	}
	public String getCafeQuestionContent() {
		return cafeQuestionContent;
	}
	public void setCafeQuestionContent(String cafeQuestionContent) {
		this.cafeQuestionContent = cafeQuestionContent;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
}
