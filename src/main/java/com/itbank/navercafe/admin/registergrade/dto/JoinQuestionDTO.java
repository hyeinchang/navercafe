package com.itbank.navercafe.admin.registergrade.dto;

public class JoinQuestionDTO {
	private String cafeQuestionContent;
	private int cafeId, cafeQuestionNum;
	
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
	public int getCafeId() {
		return cafeId;
	}
	public void setCafeId(int cafeId) {
		this.cafeId = cafeId;
	}
}
