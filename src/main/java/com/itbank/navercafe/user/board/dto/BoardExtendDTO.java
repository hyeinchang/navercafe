package com.itbank.navercafe.user.board.dto;

import java.sql.Date;

public class BoardExtendDTO {
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Date boardSaveDate;
	private int boardLikes;
	private String boardNotice;
	private String boardReplyAllow;
	private String boardPrefix;
	private String userId;
	private int boardMenuNum;
	private int hit;
	private String cafeId;
	
	private String cafeUserNickname;
	private int cafeUesrImageNum;
	private int cafeUserGrade;
	private int cafeUserVisit;
	private int cafeUserWrite;
	private int cafeUserReply;
	private int cafeUserVisitCheck;
	private Date cafeUserRegdate;
	private Date cafeUserApplydate;
	private String cafeUserStatus;
	
	private String cutName;
	private int upCafeUserGrade;
	private String upCutName;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardSaveDate() {
		return boardSaveDate;
	}
	public void setBoardSaveDate(Date boardSaveDate) {
		this.boardSaveDate = boardSaveDate;
	}
	public int getBoardLikes() {
		return boardLikes;
	}
	public void setBoardLikes(int boardLikes) {
		this.boardLikes = boardLikes;
	}
	public String getBoardNotice() {
		return boardNotice;
	}
	public void setBoardNotice(String boardNotice) {
		this.boardNotice = boardNotice;
	}
	public String getBoardReplyAllow() {
		return boardReplyAllow;
	}
	public void setBoardReplyAllow(String boardReplyAllow) {
		this.boardReplyAllow = boardReplyAllow;
	}
	public String getBoardPrefix() {
		return boardPrefix;
	}
	public void setBoardPrefix(String boardPrefix) {
		this.boardPrefix = boardPrefix;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBoardMenuNum() {
		return boardMenuNum;
	}
	public void setBoardMenuNum(int boardMenuNum) {
		this.boardMenuNum = boardMenuNum;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getCafeUserNickname() {
		return cafeUserNickname;
	}
	public void setCafeUserNickname(String cafeUserNickname) {
		this.cafeUserNickname = cafeUserNickname;
	}
	public int getCafeUesrImageNum() {
		return cafeUesrImageNum;
	}
	public void setCafeUesrImageNum(int cafeUesrImageNum) {
		this.cafeUesrImageNum = cafeUesrImageNum;
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
	public Date getCafeUserRegdate() {
		return cafeUserRegdate;
	}
	public void setCafeUserRegdate(Date cafeUserRegdate) {
		this.cafeUserRegdate = cafeUserRegdate;
	}
	public Date getCafeUserApplydate() {
		return cafeUserApplydate;
	}
	public void setCafeUserApplydate(Date cafeUserApplydate) {
		this.cafeUserApplydate = cafeUserApplydate;
	}
	public String getCafeUserStatus() {
		return cafeUserStatus;
	}
	public void setCafeUserStatus(String cafeUserStatus) {
		this.cafeUserStatus = cafeUserStatus;
	}
	public String getCutName() {
		return cutName;
	}
	public void setCutName(String cutName) {
		this.cutName = cutName;
	}
	public int getUpCafeUserGrade() {
		return upCafeUserGrade;
	}
	public void setUpCafeUserGrade(int upCafeUserGrade) {
		this.upCafeUserGrade = upCafeUserGrade;
	}
	public String getUpCutName() {
		return upCutName;
	}
	public void setUpCutName(String upCutName) {
		this.upCutName = upCutName;
	}
}
