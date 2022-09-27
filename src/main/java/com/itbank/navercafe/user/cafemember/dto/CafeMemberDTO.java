package com.itbank.navercafe.user.cafemember.dto;

import java.sql.Timestamp;

public class CafeMemberDTO {
	private String cafeId;
	private String userId;
	private String cafeUserNickname;
	private int cafeUserImageNum;
	private int cafeUserGrade;
	private int cafeUserVisit;
	private int cafeUserWrite;
	private int cafeUserReply;
	private int cafeUserVisitCheck;
	private Timestamp cafeUserRegdate;
	
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getUserId() {
		return userId;
	}

	
	public int getCafeUserImageNum() {
		return cafeUserImageNum;
	}
	public void setCafeUserImageNum(int cafeUserImageNum) {
		this.cafeUserImageNum = cafeUserImageNum;
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


	
	public int getCafeUserGrade() {
		return cafeUserGrade;
	}
	public void setCafeUserGrade(int cafeUserGrade) {
		this.cafeUserGrade = cafeUserGrade;
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
	public int getCafeUserVisitCheck() {
		return cafeUserVisitCheck;
	}
	public void setCafeUserVisitCheck(int cafeUserVisitCheck) {
		this.cafeUserVisitCheck = cafeUserVisitCheck;
	}
	public Timestamp getCafeUserRegdate() {
		return cafeUserRegdate;
	}
	public void setCafeUserRegdate(Timestamp cafeUserRegdate) {
		this.cafeUserRegdate = cafeUserRegdate;
	}
	
}
