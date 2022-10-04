package com.itbank.navercafe.admin.cafemanager.mapper;

import java.util.Map;

public interface AdminCafeManagerMapper {

	public int changeManager(Map<String, String> map);

	public int searchId(Map<String, String> map);

	public int searchNickname(Map<String, String> map);

}
