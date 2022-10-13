package com.itbank.navercafe.user.board.dto;

import java.lang.reflect.Field;

import com.itbank.navercafe.common.pagination.Pagination;

public class BoardSearchDTO extends Pagination {
	private String searchDate;
	private String searchCondition;
	private String searchKeyword;
	private String startSearchDate;
	private String endSearchDate;
	private String boardTitle;
	private String boardContent;
	private String cafeUserNickname;
	private String replyContent;
	private String replyUserNickname;
	
	// 검색했을 경우 키워드를 해당 변수에 설정
	public void setKeyword() {
		if(searchKeyword != null && searchKeyword.length() > 0 &&
			searchCondition != null && searchCondition.length() > 0) {
			try {
				Field[] fields = BoardSearchDTO.class.getDeclaredFields();
				for(Field field : fields) {

					if(searchCondition.equals(field.getName())) {
						field.setAccessible(true);
						field.set(this, (Object) searchKeyword);
						field.setAccessible(false);
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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
