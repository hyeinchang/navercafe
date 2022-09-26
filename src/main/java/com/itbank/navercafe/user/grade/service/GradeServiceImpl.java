package com.itbank.navercafe.user.grade.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itbank.navercafe.mybatis.grade.GradeMapper;



@Service
public class GradeServiceImpl implements GradeService{
	@Autowired GradeMapper upMap;


	@Override
	public void getGradeList(Model model) {
		
		SimpleDateFormat simple= new SimpleDateFormat("YYYY-MM-dd");
		List<HashMap<String, Object>> map=upMap.getGradeList();
		for(int i=0; i<map.size();i++) {
			String reg=simple.format(map.get(i).get("REGDATE"));
			String apply=simple.format(map.get(i).get("APPLY_DATE"));
			map.get(i).put("REGDATE", reg);
			map.get(i).put("APPLY_DATE", apply);
		}
		//날짜 형식 포멧하고 넘겨주기
		model.addAttribute("getGradeList",map);
	}

}






