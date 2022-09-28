package com.itbank.navercafe.user.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.mapper.CafeMapper;

@Service
public class CafeServiceImpl implements CafeService {
	@Autowired
	private CafeMapper cafeMapper;
	
	@Override
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CafeDTO selectCafe(String cafeId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
