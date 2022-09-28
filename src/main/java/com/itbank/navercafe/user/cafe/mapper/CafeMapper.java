package com.itbank.navercafe.user.cafe.mapper;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface CafeMapper {
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception;
	public CafeDTO selectCafe(String cafeId) throws Exception;
	public int checkCafeId(String cafeId) throws Exception;
	public int InsertCafe(CafeDTO cafeDTO) throws Exception;
}
