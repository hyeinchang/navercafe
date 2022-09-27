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
	private Timestamp cafeUserApplyDate;
	private String cafeUserStatus;
	private String cafeUserEmailReceieve;
	private String cafeUserGenderReveal;
	
	
	
	public String getCafeUserGenderReveal() {
		return cafeUserGenderReveal;
	}
	public void setCafeUserGenderReveal(String cafeUserGenderReveal) {
		this.cafeUserGenderReveal = cafeUserGenderReveal;
	}
	public String getCafeUserEmailReceieve() {
		return cafeUserEmailReceieve;
	}
	public void setCafeUserEmailReceieve(String cafeUserEmailReceieve) {
		this.cafeUserEmailReceieve = cafeUserEmailReceieve;
	}
	public Timestamp getCafeUserApplyDate() {
		return cafeUserApplyDate;
	}
	public void setCafeUserApplyDate(Timestamp cafeUserApplyDate) {
		this.cafeUserApplyDate = cafeUserApplyDate;
	}
	public String getCafeUserStatus() {
		return cafeUserStatus;
	}
	public void setCafeUserStatus(String cafeUserStatus) {
		this.cafeUserStatus = cafeUserStatus;
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
