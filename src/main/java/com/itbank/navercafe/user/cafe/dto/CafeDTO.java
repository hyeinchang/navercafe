package com.itbank.navercafe.user.cafe.dto;

public class CafeDTO {
	private String cafeId;
	private String cafeName;
	private String cafeSkin;
	private String cafeTitle;
	private String cafeIntroduce;
	private String cafeFront;
	private int cafeLayout;
	private String userId;
	private String cafeManagerNickName;
	private boolean isCafeMember;
	private boolean isCafeManager;
	
	public CafeDTO() {
		this.cafeSkin = "default";
		// 카페 회원 여부, 카페 메니저 여부 초기화
		this.isCafeMember = false;
		this.isCafeManager = false;
	}
	
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getCafeName() {
		return cafeName;
	}
	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}
	public String getCafeSkin() {
		return cafeSkin;
	}
	public void setCafeSkin(String cafeSkin) {
		this.cafeSkin = cafeSkin;
	}
	public String getCafeTitle() {
		return cafeTitle;
	}
	public void setCafeTitle(String cafeTitle) {
		this.cafeTitle = cafeTitle;
	}
	public String getCafeIntroduce() {
		return cafeIntroduce;
	}
	public void setCafeIntroduce(String cafeIntroduce) {
		this.cafeIntroduce = cafeIntroduce;
	}
	public String getCafeFront() {
		return cafeFront;
	}
	public void setCafeFront(String cafeFront) {
		this.cafeFront = cafeFront;
	}
	public int getCafeLayout() {
		return cafeLayout;
	}
	public void setCafeLayout(int cafeLayout) {
		this.cafeLayout = cafeLayout;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCafeManagerNickName() {
		return cafeManagerNickName;
	}
	public void setCafeManagerNickName(String cafeManagerNickName) {
		this.cafeManagerNickName = cafeManagerNickName;
	}
	public boolean isCafeMember() {
		return isCafeMember;
	}
	public void setCafeMember(boolean isCafeMember) {
		this.isCafeMember = isCafeMember;
	}
	public boolean isCafeManager() {
		return isCafeManager;
	}
	public void setCafeManager(boolean isCafeManager) {
		this.isCafeManager = isCafeManager;
	}
}
