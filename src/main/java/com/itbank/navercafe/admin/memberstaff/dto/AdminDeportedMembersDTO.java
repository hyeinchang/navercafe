package com.itbank.navercafe.admin.memberstaff.dto;

import java.util.Date;

public class AdminDeportedMembersDTO {
	private String cafeId, userId, deportedReason;
	private Date regDate;
	private int banFlag;
	
	public int getBanFlag() {
		return banFlag;
	}
	public void setBanFlag(int banFlag) {
		this.banFlag = banFlag;
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
	public String getDeportedReason() {
		return deportedReason;
	}
	public void setDeportedReason(String deportedReason) {
		this.deportedReason = deportedReason;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
