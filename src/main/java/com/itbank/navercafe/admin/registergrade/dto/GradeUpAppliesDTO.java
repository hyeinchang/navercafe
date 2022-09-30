package com.itbank.navercafe.admin.registergrade.dto;

import java.util.Date;

public class GradeUpAppliesDTO {
	//등업신청 게시판 DTO
	private String cafeUserNickname, userId,
	cutName, //현재등급
	upCutName; //다음등급
	
	private int cafeUserVisit, cafeUserWrite, cafeUserReply, boardNum; 
	
	private Date cafeUserRegdate, //카페 가입일
	boardSavedate;	//등업 신청일

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getCafeUserNickname() {
		return cafeUserNickname;
	}

	public void setCafeUserNickname(String cafeUserNickname) {
		this.cafeUserNickname = cafeUserNickname;
	}

	public String getCutName() {
		return cutName;
	}

	public void setCutName(String cutName) {
		this.cutName = cutName;
	}

	public String getUpCutName() {
		return upCutName;
	}

	public void setUpCutName(String upCutName) {
		this.upCutName = upCutName;
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

	public Date getCafeUserRegdate() {
		return cafeUserRegdate;
	}

	public void setCafeUserRegdate(Date cafeUserRegdate) {
		this.cafeUserRegdate = cafeUserRegdate;
	}

	public Date getBoardSavedate() {
		return boardSavedate;
	}

	public void setBoardSavedate(Date boardSavedate) {
		this.boardSavedate = boardSavedate;
	}
	
	

	
}
