package com.itbank.navercafe.admin.menu.service;

import java.util.List;

import com.itbank.navercafe.user.boardmenu.dto.BoardMenuDTO;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface AdminMenuService {
	public List<BoardMenuDTO> selectBoardMenuList(CafeDTO cafeDTO) throws Exception;
	public List<BoardMenuDTO> selectBoardMenuList(String cafeId) throws Exception;
}
