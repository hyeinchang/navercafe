package com.itbank.navercafe.user.reply.dto;

import java.sql.Timestamp;
import java.util.List;

import com.itbank.navercafe.common.file.dto.FileDTO;

public class ReplyDTO {
	private int replyNum;
	private int boardNum;
	private String replyContent;
	private Timestamp replySaveDate;
	private String userId;
	private int replyGroup;
	private int replyStep;
	private int replyIndent;
	private int replyParent;
	
	private String cafeUserNickname;
	private int cafeUserImageNum;
	private int cafeUserGrade;
	
	private List<FileDTO> fileList;

	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
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
	public int getReplyIndent() {
		return replyIndent;
	}
	public void setReplyIndent(int replyIndent) {
		this.replyIndent = replyIndent;
	}
	public int getReplyParent() {
		return replyParent;
	}
	public void setReplyParent(int replyParent) {
		this.replyParent = replyParent;
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
	
	public List<FileDTO> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileDTO> fileList) {
		this.fileList = fileList;
	}
}
