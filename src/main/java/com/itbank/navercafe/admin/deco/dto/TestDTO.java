package com.itbank.navercafe.admin.deco.dto;

import java.util.List;

public class TestDTO {
	private String hello;
	private String bye;
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
	public List<TestDTO> getTestDTOList() {
		return testDTOList;
	}
	public void setTestDTOList(List<TestDTO> testDTOList) {
		this.testDTOList = testDTOList;
	}
	
}
