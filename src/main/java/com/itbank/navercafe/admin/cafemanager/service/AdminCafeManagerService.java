package com.itbank.navercafe.admin.cafemanager.service;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface AdminCafeManagerService {
	public int updateBasicInfo(CafeDTO cafeDTO) throws Exception;
	
	public String changeManager(String cafeId, String searchResult);

	public String searchId(String id, String cafeId);

	public String searchNickname(String nickname, String cafeId);
}
