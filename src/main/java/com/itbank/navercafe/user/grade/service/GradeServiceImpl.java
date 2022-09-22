package com.itbank.navercafe.user.grade.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.mybatis.grade.GradeMapper;
import com.itbank.navercafe.user.grade.dto.GradeDTO;



@Service
public class GradeServiceImpl implements GradeService{
	@Autowired GradeMapper upMap;
	
	@Override
	public ArrayList<GradeDTO> getUpGradeboardList() {
		return upMap.getUpGradeboardList();
	}

}






