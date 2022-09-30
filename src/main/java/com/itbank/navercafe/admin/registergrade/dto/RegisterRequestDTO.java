package com.itbank.navercafe.admin.registergrade.dto;

import java.util.Date;

public class RegisterRequestDTO {
	private int cafeRequestNum;
	private String cafeId, userId;
	private Date regdate;
	
	public int getCafeRequestNum() {
		return cafeRequestNum;
	}
	public void setCafeRequestNum(int cafeRequestNum) {
		this.cafeRequestNum = cafeRequestNum;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regDate) {
		this.regdate = regDate;
	}
	
	
}
