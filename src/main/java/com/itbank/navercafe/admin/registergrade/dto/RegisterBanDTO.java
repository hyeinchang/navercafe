package com.itbank.navercafe.admin.registergrade.dto;

import java.util.Date;

public class RegisterBanDTO {
	private String userId, cafeId, reason; 
	private Date blacklistRegdate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getBlacklistRegdate() {
		return blacklistRegdate;
	}
	public void setBlacklistRegdate(Date blacklistRegdate) {
		this.blacklistRegdate = blacklistRegdate;
	}
	
}
