package com.itbank.navercafe.user.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.menu.mapper.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<MenuDTO> selectBoardMenuList(String cafeId) throws Exception {
		return menuMapper.selectBoardMenuList(cafeId);
	}

	@Override
	public MenuDTO selectBoardMenu(int boardMenuNum) throws Exception {
		return menuMapper.selectBoardMenu(boardMenuNum);
	}
}
