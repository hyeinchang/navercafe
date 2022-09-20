package com.itbank.navercafe.comon.file.dto;

import java.sql.Date;

public class FileDTO {
	private int fileNum;
	private String fileDirectory;
	private String fileOrgName;
	private String fileStoredName;
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
	public String getFileDirectory() {
		return fileDirectory;
	}
	public void setFileDirectory(String fileDirectory) {
		this.fileDirectory = fileDirectory;
	}
	public String getFileOrgName() {
		return fileOrgName;
	}
	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}
	public String getFileStoredName() {
		return fileStoredName;
	}
	public void setFileStoredName(String fileStoredName) {
		this.fileStoredName = fileStoredName;
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
