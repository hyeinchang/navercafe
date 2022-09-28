package com.itbank.navercafe.user.boardmenu.dto;

public class BoardMenuDTO {
	private int boardMenuNum;
	private String cafeId;
	private String boardMenuName;
	private String boardMenuDesc;
	private int boardMenuType;
	private int boardWriteAuth;
	private int boardReplyAuth;
	private int boardReadAuth;
	private int boardOrder;
	
	public int getBoardMenuNum() {
		return boardMenuNum;
	}
	public void setBoardMenuNum(int boardMenuNum) {
		this.boardMenuNum = boardMenuNum;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getBoardMenuName() {
		return boardMenuName;
	}
	public void setBoardMenuName(String boardMenuName) {
		this.boardMenuName = boardMenuName;
	}
	public String getBoardMenuDesc() {
		return boardMenuDesc;
	}
	public void setBoardMenuDesc(String boardMenuDesc) {
		this.boardMenuDesc = boardMenuDesc;
	}
	public int getBoardMenuType() {
		return boardMenuType;
	}
	public void setBoardMenuType(int boardMenuType) {
		this.boardMenuType = boardMenuType;
	}
	public int getBoardWriteAuth() {
		return boardWriteAuth;
	}
	public void setBoardWriteAuth(int boardWriteAuth) {
		this.boardWriteAuth = boardWriteAuth;
	}
	public int getBoardReplyAuth() {
		return boardReplyAuth;
	}
	public void setBoardReplyAuth(int boardReplyAuth) {
		this.boardReplyAuth = boardReplyAuth;
	}
	public int getBoardReadAuth() {
		return boardReadAuth;
	}
	public void setBoardReadAuth(int boardReadAuth) {
		this.boardReadAuth = boardReadAuth;
	}
	public int getBoardOrder() {
		return boardOrder;
	}
	public void setBoardOrder(int boardOrder) {
		this.boardOrder = boardOrder;
	}
}
