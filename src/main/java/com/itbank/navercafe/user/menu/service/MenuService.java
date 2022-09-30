package com.itbank.navercafe.user.menu.service;

import java.util.List;

import com.itbank.navercafe.user.menu.dto.MenuDTO;

public interface MenuService {
	public List<MenuDTO> selectBoardMenuList(String cafeId) throws Exception;
	public MenuDTO selectBoardMenu(int boardMenuNum) throws Exception;
}
