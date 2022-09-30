package com.itbank.navercafe.admin.registergrade.dto;

public class RegisterInfoDTO {
	private String explanation, q1Content, q2Content, q3Content;
	private int questionQty;
	private boolean join_question;
	
	private String cafeId;
	private String ageCondition;
	private int selectYear1, selectYear2;
	private String cafeJoinAge;
	private String cafeJoinGender;
	
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getCafeJoinAge() {
		return cafeJoinAge;
	}
	public void setCafeJoinAge(String cafeJoinAge) {
		this.cafeJoinAge = cafeJoinAge;
	}
	public String getCafeJoinGender() {
		return cafeJoinGender;
	}
	public void setCafeJoinGender(String cafeJoinGender) {
		this.cafeJoinGender = cafeJoinGender;
	}
	public int getSelectYear1() {
		return selectYear1;
	}
	public void setSelectYear1(int selectYear1) {
		this.selectYear1 = selectYear1;
	}
	public int getSelectYear2() {
		return selectYear2;
	}
	public void setSelectYear2(int selectYear2) {
		this.selectYear2 = selectYear2;
	}
	public String getAgeCondition() {
		return ageCondition;
	}
	public void setAgeCondition(String ageCondition) {
		this.ageCondition = ageCondition;
	}
	public int getQuestionQty() {
		return questionQty;
	}
	public void setQuestionQty(int questionQty) {
		this.questionQty = questionQty;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getQ1Content() {
		return q1Content;
	}
	public void setQ1Content(String q1Content) {
		this.q1Content = q1Content;
	}
	public String getQ2Content() {
		return q2Content;
	}
	public void setQ2Content(String q2Content) {
		this.q2Content = q2Content;
	}
	public String getQ3Content() {
		return q3Content;
	}
	public void setQ3Content(String q3Content) {
		this.q3Content = q3Content;
	}
	public boolean isJoin_question() {
		return join_question;
	}
	public void setJoin_question(boolean join_question) {
		this.join_question = join_question;
	}
	
	
}
