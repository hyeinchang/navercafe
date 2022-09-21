package com.itbank.navercafe.admin.test.dto;

import java.util.List;

public class TestDTO {
	private String hello;
	private String bye;
	private String cafeId;
	private String content;
	private List<TestDTO> testDTOList;
	
	public String getHello() {
		return hello;
	}
	public void setHello(String hello) {
		this.hello = hello;
	}
	public String getBye() {
		return bye;
	}
	public void setBye(String bye) {
		this.bye = bye;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<TestDTO> getTestDTOList() {
		return testDTOList;
	}
	public void setTestDTOList(List<TestDTO> testDTOList) {
		this.testDTOList = testDTOList;
	}
	
}
