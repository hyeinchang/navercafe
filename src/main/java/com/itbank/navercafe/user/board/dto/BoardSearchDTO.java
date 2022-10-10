package com.itbank.navercafe.user.board.dto;

import com.itbank.navercafe.common.pagination.Pagination;

public class BoardSearchDTO extends Pagination {
	private String startSearchDate;
	private String endSearchDate;
	private String boardTitle;
	private String boardContent;
	private String cafeUserNickname;
	private String replyContent;
	private String replyUserNickname;
	
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
	public String getCafeUserNickname() {
		return cafeUserNickname;
	}
	public void setCafeUserNickname(String cafeUserNickname) {
		this.cafeUserNickname = cafeUserNickname;
	}
	public String getStartSearchDate() {
		return startSearchDate;
	}
	public void setStartSearchDate(String startSearchDate) {
		this.startSearchDate = startSearchDate;
	}
	public String getEndSearchDate() {
		return endSearchDate;
	}
	public void setEndSearchDate(String endSearchDate) {
		this.endSearchDate = endSearchDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyUserNickname() {
		return replyUserNickname;
	}
	public void setReplyUserNickname(String replyUserNickname) {
		this.replyUserNickname = replyUserNickname;
	}
}
