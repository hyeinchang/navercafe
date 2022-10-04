package com.itbank.navercafe.admin.cafemanager.service;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface AdminCafeManagerService {
	public int updateBasicInfo(CafeDTO cafeDTO) throws Exception;
}
