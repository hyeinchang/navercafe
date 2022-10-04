package com.itbank.navercafe.admin.email.mapper;

import java.util.ArrayList;

public interface AdminEmailMapper {

	ArrayList<String> getAllUserEmail(String cafeId);

	String getCafeName(String cafeId);

}
