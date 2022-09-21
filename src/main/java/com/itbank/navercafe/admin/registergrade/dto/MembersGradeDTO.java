package com.itbank.navercafe.admin.registergrade.dto;

import java.util.ArrayList;

public class MembersGradeDTO {
	private String cutRemoved, // 삭제되었는지  
	cafeUserGrade,  // 등급레벨 
	cutName, 	// 등급명
	cutDesc;	// 등급설명
	
	private int cutBoard, // 게시글 개수
	cutReply, // 댓글 개수
	cutVisit, // 방문수 제한
	cutType; // 등업방식
	
	ArrayList<MembersGradeDTO> list = new ArrayList<>();
	
	public ArrayList<MembersGradeDTO> getList() {
		return list;
	}
	public void setList(ArrayList<MembersGradeDTO> list) {
		this.list = list;
	}
	public String getCutName() {
		return cutName;
	}
	public void setCutName(String cutName) {
		this.cutName = cutName;
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
	public String getCafeUserGrade() {
		return cafeUserGrade;
	}
	public void setCafeUserGrade(String cafeUserGrade) {
		this.cafeUserGrade = cafeUserGrade;
	}
	public String getCutDesc() {
		return cutDesc;
	}
	public void setCutDesc(String cutDesc) {
		this.cutDesc = cutDesc;
	}
	public int getCutBoard() {
		return cutBoard;
	}
	public void setCutBoard(int cutBoard) {
		this.cutBoard = cutBoard;
	}
	public int getCutReply() {
		return cutReply;
	}
	public void setCutReply(int cutReply) {
		this.cutReply = cutReply;
	}
	public int getCutVisit() {
		return cutVisit;
	}
	public void setCutVisit(int cutVisit) {
		this.cutVisit = cutVisit;
	}
	
}