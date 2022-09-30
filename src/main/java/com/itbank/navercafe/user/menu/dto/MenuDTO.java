package com.itbank.navercafe.user.menu.dto;

public class MenuDTO {
	private int boardMenuNum;
	private String cafeId;
	private String boardMenuName;
	private String boardMenuDesc;
	private int boardMenuType;
	private int boardWriteAuth;
	private int boardReplyAuth;
	private int boardReadAuth;
	private int boardOrder;
	private String boardLikesFlag;
	private String boardReplyFlag;
	private String boardPrefixesFlag;
	private String boardPublicFlag;
	
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
	public String getBoardLikesFlag() {
		return boardLikesFlag;
	}
	public void setBoardLikesFlag(String boardLikesFlag) {
		this.boardLikesFlag = boardLikesFlag;
	}
	public String getBoardReplyFlag() {
		return boardReplyFlag;
	}
	public void setBoardReplyFlag(String boardReplyFlag) {
		this.boardReplyFlag = boardReplyFlag;
	}
	public String getBoardPrefixesFlag() {
		return boardPrefixesFlag;
	}
	public void setBoardPrefixesFlag(String boardPrefixesFlag) {
		this.boardPrefixesFlag = boardPrefixesFlag;
	}
	public String getBoardPublicFlag() {
		return boardPublicFlag;
	}
	public void setBoardPublicFlag(String boardPublicFlag) {
		this.boardPublicFlag = boardPublicFlag;
	}
}
