package com.itbank.navercafe.admin.cafemanager.mapper;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface AdminCafeManagerMapper {
	public int updateBasicInfo(CafeDTO cafeDTO) throws Exception;
}
