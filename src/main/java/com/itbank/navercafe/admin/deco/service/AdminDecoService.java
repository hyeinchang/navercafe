package com.itbank.navercafe.admin.deco.service;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface AdminDecoService {
	public int saveTitle(CafeDTO cafeDTO) throws Exception;
	public int deleteTitle(int titleNum) throws Exception;
}
