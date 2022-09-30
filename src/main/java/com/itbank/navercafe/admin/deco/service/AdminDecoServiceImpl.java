package com.itbank.navercafe.admin.deco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.admin.deco.mapper.AdminDecoMapper;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Service
public class AdminDecoServiceImpl implements AdminDecoService {
	@Autowired
	AdminDecoMapper decoMapper;
	
	@Override
	public int saveFront(CafeDTO cafeDTO) throws Exception {
		return decoMapper.saveFront(cafeDTO);
	}
	
	@Override
	public int saveSkin(CafeDTO cafeDTO) throws Exception {
		return decoMapper.saveSkin(cafeDTO);
	}
	
	@Override
	public int saveTitle(CafeDTO cafeDTO) throws Exception {
		return decoMapper.saveTitle(cafeDTO);
	}
}
