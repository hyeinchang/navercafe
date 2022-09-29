package com.itbank.navercafe.admin.memberstaff.dto;

import java.util.Date;

public class AdminAllMembersDTO {
	private String cafeId, userId, cafeUserNickname;
	private Date cafeUserRegdate;
	private int cafeUserVisit, cafeUserWrite, cafeUserReply;
	// 최종방문일?
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
	public String getCafeUserNickname() {
		return cafeUserNickname;
	}
	public void setCafeUserNickname(String cafeUserNickname) {
		this.cafeUserNickname = cafeUserNickname;
	}
	public Date getCafeUserRegdate() {
		return cafeUserRegdate;
	}
	public void setCafeUserRegdate(Date cafeUserRegdate) {
		this.cafeUserRegdate = cafeUserRegdate;
	}
	public int getCafeUserVisit() {
		return cafeUserVisit;
	}
	public void setCafeUserVisit(int cafeUserVisit) {
		this.cafeUserVisit = cafeUserVisit;
	}
	public int getCafeUserWrite() {
		return cafeUserWrite;
	}
	public void setCafeUserWrite(int cafeUserWrite) {
		this.cafeUserWrite = cafeUserWrite;
	}
	public int getCafeUserReply() {
		return cafeUserReply;
	}
	public void setCafeUserReply(int cafeUserReply) {
		this.cafeUserReply = cafeUserReply;
	}
	
	
}
