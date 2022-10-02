package com.itbank.navercafe.user.cafe.dto;

public class CafeMemberGradeDTO {
	private String cafeId;
	private int cafeUserGrade;
	private String cutName;
	private String cutDesc;
	private int cutVisit;
	private int cutReply;
	private int cutBoard;
	private int cutType;
	private String cutRemoved;
	
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public int getCafeUserGrade() {
		return cafeUserGrade;
	}
	public void setCafeUserGrade(int cafeUserGrade) {
		this.cafeUserGrade = cafeUserGrade;
	}
	public String getCutName() {
		return cutName;
	}
	public void setCutName(String cutName) {
		this.cutName = cutName;
	}
	public String getCutDesc() {
		return cutDesc;
	}
	public void setCutDesc(String cutDesc) {
		this.cutDesc = cutDesc;
	}
	public int getCutVisit() {
		return cutVisit;
	}
	public void setCutVisit(int cutVisit) {
		this.cutVisit = cutVisit;
	}
	public int getCutReply() {
		return cutReply;
	}
	public void setCutReply(int cutReply) {
		this.cutReply = cutReply;
	}
	public int getCutBoard() {
		return cutBoard;
	}
	public void setCutBoard(int cutBoard) {
		this.cutBoard = cutBoard;
	}
	public int getCutType() {
		return cutType;
	}
	public void setCutType(int cutType) {
		this.cutType = cutType;
	}
	public String getCutRemoved() {
		return cutRemoved;
	}
	public void setCutRemoved(String cutRemoved) {
		this.cutRemoved = cutRemoved;
	}
}
