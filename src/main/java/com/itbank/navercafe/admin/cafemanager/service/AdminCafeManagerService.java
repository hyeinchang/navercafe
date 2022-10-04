package com.itbank.navercafe.admin.cafemanager.service;

public interface AdminCafeManagerService {

	public String changeManager(String cafeId, String searchResult);

	public String searchId(String id, String cafeId);

	public String searchNickname(String nickname, String cafeId);

}
