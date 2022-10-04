package com.itbank.navercafe.user.cafemember.dto;

public class CafeJoinAnswerDTO {
	private int cafeAnswerNum;
	private String userId;
	private String cafeAnswerContent;
	private String cafeId;
	private int cafeQuestionNum;
	
	public int getCafeAnswerNum() {
		return cafeAnswerNum;
	}
	public void setCafeAnswerNum(int cafeAnswerNum) {
		this.cafeAnswerNum = cafeAnswerNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCafeAnswerContent() {
		return cafeAnswerContent;
	}
	public void setCafeAnswerContent(String cafeAnswerContent) {
		this.cafeAnswerContent = cafeAnswerContent;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public int getCafeQuestionNum() {
		return cafeQuestionNum;
	}
	public void setCafeQuestionNum(int cafeQuestionNum) {
		this.cafeQuestionNum = cafeQuestionNum;
	}
}
