package com.itbank.navercafe.admin.menu.service;

import java.util.List;

import com.itbank.navercafe.admin.menu.dto.AdminMenuDTO;

public interface AdminMenuService {
	public int insertBoardMenu(AdminMenuDTO adminMenuDTO) throws Exception;
	public int updateBoardMenu(AdminMenuDTO adminMenuDTO) throws Exception;
	public List<AdminMenuDTO> selectBoardMenuList(String cafeId) throws Exception;
	public AdminMenuDTO selectBoardMenu(int boardMenuNum) throws Exception;
	public int deleteBoardMenu(int boardMenuNum) throws Exception;
	public int deleteBoardList(int boardMenuNum) throws Exception;
}
