package com.itbank.navercafe.user.reply.dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int replyNum;
	private int boardNum;
	private String replyContent;
	private Timestamp replySaveDate;
	private String userId;
	private int replyGroup;
	private int replyStep;
	
	private String cafeUserNickname;
	private int cafeUserImageNum;
	private int cafeUserGrade;

	public int getReplyGroup() {
		return replyGroup;
	}
	public void setReplyGroup(int replyGroup) {
		this.replyGroup = replyGroup;
	}
	public int getReplyStep() {
		return replyStep;
	}
	public void setReplyStep(int replyStep) {
		this.replyStep = replyStep;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Timestamp getReplySaveDate() {
		return replySaveDate;
	}
	public void setReplySaveDate(Timestamp replySaveDate) {
		this.replySaveDate = replySaveDate;
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
	public int getCafeUserImageNum() {
		return cafeUserImageNum;
	}
	public void setCafeUserImageNum(int cafeUserImageNum) {
		this.cafeUserImageNum = cafeUserImageNum;
	}
	public int getCafeUserGrade() {
		return cafeUserGrade;
	}
	public void setCafeUserGrade(int cafeUserGrade) {
		this.cafeUserGrade = cafeUserGrade;
	}
}
