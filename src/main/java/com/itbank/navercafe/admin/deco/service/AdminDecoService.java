package com.itbank.navercafe.admin.deco.service;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface AdminDecoService {
	public int saveFront(CafeDTO cafeDTO) throws Exception;
	public int saveSkin(CafeDTO cafeDTO) throws Exception;
	public int saveTitle(CafeDTO cafeDTO) throws Exception;
}
