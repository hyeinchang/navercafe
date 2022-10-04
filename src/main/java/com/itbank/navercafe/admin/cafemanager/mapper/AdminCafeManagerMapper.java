package com.itbank.navercafe.admin.cafemanager.mapper;

import java.util.Map;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface AdminCafeManagerMapper {

	public int changeManager(Map<String, String> map);

	public int searchId(Map<String, String> map);

	public int searchNickname(Map<String, String> map);

	public int updateBasicInfo(CafeDTO cafeDTO);

}
