package com.itbank.navercafe.user.cafe.service;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface CafeService {
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception;
	public CafeDTO selectCafe(String cafeId) throws Exception;
	public int checkCafeId(String cafeId) throws Exception;
	public int InsertCafe(CafeDTO cafeDTO) throws Exception;
}
