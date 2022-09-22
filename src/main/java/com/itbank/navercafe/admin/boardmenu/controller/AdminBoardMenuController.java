package com.itbank.navercafe.admin.boardmenu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.boardmenu.BoardMenuType;
import com.itbank.navercafe.user.boardmenu.dto.BoardMenuDTO;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("/admin/boardmenu")
public class AdminBoardMenuController {
	// BoardMenuType class로 게시판 메뉴 타입 설정
	private BoardMenuType boardMenuType = new BoardMenuType();
	private List<BoardMenuDTO> boardMenuTypeList = boardMenuType.getBoardMenuTypeList();
	
	public String boardMenu(CafeDTO cafeDTO, BoardMenuDTO menuDTO, Model model) {
		try {
			// 게시판 메뉴 타입을 컨트롤러에서 지정
			
			model.addAttribute("cafeDTO", cafeDTO);
			model.addAttribute("menuDTO", menuDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "admin/menu/boardMenu";
	}
}
