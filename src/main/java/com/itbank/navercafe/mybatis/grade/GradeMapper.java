package com.itbank.navercafe.mybatis.grade;

import java.util.ArrayList;


import com.itbank.navercafe.user.grade.dto.GradeDTO;

public interface GradeMapper {
	public ArrayList<GradeDTO> getUpGradeboardList();
}
