package com.itbank.navercafe.admin.menu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.menu.BoardMenuType;
import com.itbank.navercafe.user.boardmenu.dto.BoardMenuDTO;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("admin/menu")
public class AdminMenuController {
	// BoardMenuType class로 게시판 메뉴 타입 설정
	private BoardMenuType boardMenuType = new BoardMenuType();
	private List<BoardMenuDTO> boardMenuTypeList = boardMenuType.getBoardMenuTypeList();
	
	@RequestMapping("/boardMenu")
	public String boardMenu(CafeDTO cafeDTO, BoardMenuDTO menuDTO, Model model) {
		try {
			model.addAttribute("cafeDTO", cafeDTO);
			model.addAttribute("menuDTO", menuDTO);
			model.addAttribute("menuTypeList", boardMenuTypeList);
			System.out.println(boardMenuTypeList.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "admin/menu/boardMenu";
	}
}
