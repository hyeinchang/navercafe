package com.itbank.navercafe.user.cafe.dto;

import java.util.Date;
import java.util.List;

import com.itbank.navercafe.user.menu.dto.MenuDTO;

public class CafeDTO {
	private String cafeId;
	private String cafeName;
	private String cafeExplanation;
	private int cafeTitleNum;
	private String cafeFront;
	private String cafeSkin;
	private String cafeLayout;
	private String userId;
	private String cafeJoinApply;
	private String cafeJoinGender;
	private String cafeJoinAge;
	private int cafeIconNum;
	private String cafeJoinInformation;
	private Date cafeRegdate;
	private String isCafeMember;
	private String isCafeManager;
	private String loginId;
	private List<MenuDTO> cafeMenuList;

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
	public String getCafeExplanation() {
		return cafeExplanation;
	}
	public void setCafeExplanation(String cafeExplanation) {
		this.cafeExplanation = cafeExplanation;
	}
	public int getCafeTitleNum() {
		return cafeTitleNum;
	}
	public void setCafeTitleNum(int cafeTitleNum) {
		this.cafeTitleNum = cafeTitleNum;
	}
	public String getCafeFront() {
		return cafeFront;
	}
	public void setCafeFront(String cafeFront) {
		this.cafeFront = cafeFront;
	}
	public String getCafeSkin() {
		return cafeSkin;
	}
	public void setCafeSkin(String cafeSkin) {
		this.cafeSkin = cafeSkin;
	}
	public String getCafeLayout() {
		return cafeLayout;
	}
	public void setCafeLayout(String cafeLayout) {
		this.cafeLayout = cafeLayout;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCafeJoinApply() {
		return cafeJoinApply;
	}
	public void setCafeJoinApply(String cafeJoinApply) {
		this.cafeJoinApply = cafeJoinApply;
	}
	public String getCafeJoinGender() {
		return cafeJoinGender;
	}
	public void setCafeJoinGender(String cafeJoinGender) {
		this.cafeJoinGender = cafeJoinGender;
	}
	public String getCafeJoinAge() {
		return cafeJoinAge;
	}
	public void setCafeJoinAge(String cafeJoinAge) {
		this.cafeJoinAge = cafeJoinAge;
	}
	public int getCafeIconNum() {
		return cafeIconNum;
	}
	public String getCafeJoinInformation() {
		return cafeJoinInformation;
	}
	public void setCafeJoinInformation(String cafeJoinInformation) {
		this.cafeJoinInformation = cafeJoinInformation;
	}
	public Date getCafeRegdate() {
		return cafeRegdate;
	}
	public void setCafeRegdate(Date cafeRegdate) {
		this.cafeRegdate = cafeRegdate;
	}
	public void setCafeIconNum(int cafeIconNum) {
		this.cafeIconNum = cafeIconNum;
	}
	public String getIsCafeMember() {
		return isCafeMember;
	}
	public void setIsCafeMember(String isCafeMember) {
		this.isCafeMember = isCafeMember;
	}
	public String getIsCafeManager() {
		return isCafeManager;
	}
	public void setIsCafeManager(String isCafeManager) {
		this.isCafeManager = isCafeManager;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public List<MenuDTO> getCafeMenuList() {
		return cafeMenuList;
	}
	public void setCafeMenuList(List<MenuDTO> cafeMenuList) {
		this.cafeMenuList = cafeMenuList;
	}
}
