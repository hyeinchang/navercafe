package com.itbank.navercafe.common.file.dto;

import java.sql.Date;

public class FileDTO {
	private int fileNum;
	private String fileDirectory;
	private String fileOrgName;
	private String fileStoredName;
	private int boardNum;
	private int replyNum;
	private int cafeUserImageNum;
	private int cafeTitleNum;
	private int memoReplyNum;
	private int cafeIconNum;
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
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getCafeUserImageNum() {
		return cafeUserImageNum;
	}
	public void setCafeUserImageNum(int cafeUserImageNum) {
		this.cafeUserImageNum = cafeUserImageNum;
	}
	public int getCafeTitleNum() {
		return cafeTitleNum;
	}
	public void setCafeTitleNum(int cafeTitleNum) {
		this.cafeTitleNum = cafeTitleNum;
	}
	public int getMemoReplyNum() {
		return memoReplyNum;
	}
	public void setMemoReplyNum(int memoReplyNum) {
		this.memoReplyNum = memoReplyNum;
	}
	public int getCafeIconNum() {
		return cafeIconNum;
	}
	public void setCafeIconNum(int cafeIconNum) {
		this.cafeIconNum = cafeIconNum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
