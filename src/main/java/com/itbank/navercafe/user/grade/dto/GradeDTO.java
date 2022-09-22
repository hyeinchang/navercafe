package com.itbank.navercafe.user.grade.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class GradeDTO {
	private String userId;
	private String gradeUp;
	private String gradeNow;
	private int visit;
	private int boardCount;
	private int replyCount;
	private Timestamp regdate;
	private Timestamp applyDate;
	
	SimpleDateFormat simple=new SimpleDateFormat("YYYY.MM.dd.");
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGradeUp() {
		return gradeUp;
	}
	public void setGradeUp(String gradeUp) {
		this.gradeUp = gradeUp;
	}
	public String getGradeNow() {
		return gradeNow;
	}
	public void setGradeNow(String gradeNow) {
		this.gradeNow = gradeNow;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	public String getRegdate() {
		String reg=simple.format(regdate);
		return reg;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public String getApplyDate() {
		String apply=simple.format(applyDate);
		return apply;
	}
	public void setApplyDate(Timestamp applyDate) {
		this.applyDate = applyDate;
	}
	
	
}
