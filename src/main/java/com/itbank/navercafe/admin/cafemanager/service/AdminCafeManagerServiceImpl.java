package com.itbank.navercafe.admin.cafemanager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.admin.cafemanager.mapper.AdminCafeManagerMapper;

@Service
public class AdminCafeManagerServiceImpl implements AdminCafeManagerService{
	@Autowired
	AdminCafeManagerMapper cafeManagerMapper;
}
