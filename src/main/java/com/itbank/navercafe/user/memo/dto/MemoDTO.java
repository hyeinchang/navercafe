package com.itbank.navercafe.user.memo.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemoDTO {
	private int memoNum;
	private String userId;
	private String memoContent;
	private Timestamp memoSaveDate;
	private String memoStepOnly;

	SimpleDateFormat simple = new SimpleDateFormat("YYYY.MM.dd. HH:mm");
	
	public int getMemoNum() {
		return memoNum;
	}
	public void setMemoNum(int memoNum) {
		this.memoNum = memoNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMemoContent() {
		return memoContent;
	}
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}
	
	public String getMemoSaveDate() {
		String memoDate=simple.format(memoSaveDate);
		return memoDate;
	}
	public void setMemoSaveDate(Timestamp memoSaveDate) {
		this.memoSaveDate = memoSaveDate;
	}
	
	public String getMemoStepOnly() {
		return memoStepOnly;
	}
	public void setMemoStepOnly(String memoStepOnly) {
		this.memoStepOnly = memoStepOnly;
	}

	
	
	
	
	
}
