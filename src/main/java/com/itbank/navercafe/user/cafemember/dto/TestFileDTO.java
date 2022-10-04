package com.itbank.navercafe.user.cafemember.dto;

import java.sql.Date;

public class TestFileDTO {
	private int fileNum;
	private String fileOrgName;
	private int boardNum;
	private int boardReplyNum;
	private int profileNum;
	private int titleNum;
	private int memoReplyNum;
	private Date regdate;
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}

	public String getFileOrgName() {
		return fileOrgName;
	}
	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getBoardReplyNum() {
		return boardReplyNum;
	}
	public void setBoardReplyNum(int boardReplyNum) {
		this.boardReplyNum = boardReplyNum;
	}
	public int getProfileNum() {
		return profileNum;
	}
	public void setProfileNum(int profileNum) {
		this.profileNum = profileNum;
	}
	public int getTitleNum() {
		return titleNum;
	}
	public void setTitleNum(int titleNum) {
		this.titleNum = titleNum;
	}
	public int getMemoReplyNum() {
		return memoReplyNum;
	}
	public void setMemoReplyNum(int memoReplyNum) {
		this.memoReplyNum = memoReplyNum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
