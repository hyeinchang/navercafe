package com.itbank.navercafe.admin.memberstaff.dto;

import java.util.Date;

public class DeportedMembersDTO {
	private String cafeId, userId, reason, managerId;
	private Date regdate;
	private String banFlag;
	
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getBanFlag() {
		return banFlag;
	}
	public void setBanFlag(String banFlag) {
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
