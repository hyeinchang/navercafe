package com.itbank.navercafe.user.category.dto;

public class MenuDTO {
	private int categoryNo;
	private String categoryName;
	private String categoryLink;
	private String categoryType;
	private String categoryLayout;
	
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryLink() {
		return categoryLink;
	}
	public void setCategoryLink(String categoryLink) {
		this.categoryLink = categoryLink;
	}
	public String getCategoryType() {
		return categoryType;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	public String getCategoryLayout() {
		return categoryLayout;
	}
	public void setCategoryLayout(String categoryLayout) {
		this.categoryLayout = categoryLayout;
	}
}
