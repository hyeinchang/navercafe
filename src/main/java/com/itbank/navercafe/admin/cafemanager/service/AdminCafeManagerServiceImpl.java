package com.itbank.navercafe.admin.cafemanager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.admin.cafemanager.mapper.AdminCafeManagerMapper;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Service
public class AdminCafeManagerServiceImpl implements AdminCafeManagerService{
	@Autowired
	AdminCafeManagerMapper cafeManagerMapper;

	@Override
	public int updateBasicInfo(CafeDTO cafeDTO) throws Exception {
		return cafeManagerMapper.updateBasicInfo(cafeDTO);
	}
}
