package com.itbank.navercafe.user.memo.dto;

import java.sql.Timestamp;

public class MemoReplyDTO {
	private int memoReplyNum;
	private String userId;
	private String memoReplyContent;
	private Timestamp memoReplySavedate;
	private int memoReplyGroup;
	
	
	public int getMemoReplyGroup() {
		return memoReplyGroup;
	}
	public void setMemoReplyGroup(int memoReplyGroup) {
		this.memoReplyGroup = memoReplyGroup;
	}
	public int getMemoReplyNum() {
		return memoReplyNum;
	}
	public void setMemoReplyNum(int memoReplyNum) {
		this.memoReplyNum = memoReplyNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMemoReplyContent() {
		return memoReplyContent;
	}
	public void setMemoReplyContent(String memoReplyContent) {
		this.memoReplyContent = memoReplyContent;
	}
	public Timestamp getMemoReplySavedate() {
		return memoReplySavedate;
	}
	public void setMemoReplySavedate(Timestamp memoReplySavedate) {
		this.memoReplySavedate = memoReplySavedate;
	}
	

	
	
}
