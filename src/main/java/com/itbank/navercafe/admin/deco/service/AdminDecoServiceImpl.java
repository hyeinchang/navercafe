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
	public int saveTitle(CafeDTO cafeDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTitle(int titleNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
