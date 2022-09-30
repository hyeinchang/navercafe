package com.itbank.navercafe.admin.memberstaff.dto;

import java.util.Date;

public class DeportedMembersDTO {
	private String cafeId, userId, reason;
	private Date regdate;
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
	public String getReason() {
		return reason;
	}
	public void setReason(String deportedReason) {
		this.reason = deportedReason;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
