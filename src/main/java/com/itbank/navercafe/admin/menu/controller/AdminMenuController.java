package com.itbank.navercafe.admin.menu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.admin.menu.BoardMenuType;
import com.itbank.navercafe.admin.menu.service.AdminMenuService;
import com.itbank.navercafe.user.boardmenu.dto.BoardMenuDTO;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;

@Controller
@RequestMapping("admin/menu")
public class AdminMenuController {
	@Autowired
	AdminMenuService adminMenuService;
	
	// BoardMenuType class로 게시판 메뉴 타입 설정
	private BoardMenuType boardMenuType = new BoardMenuType();
	private List<BoardMenuDTO> boardMenuTypeList = boardMenuType.getBoardMenuTypeList();
	
	@RequestMapping("/boardMenu")
	public String boardMenu(CafeDTO cafeDTO, BoardMenuDTO menuDTO, Model model) {
		try {
			List<BoardMenuDTO> boardMenuList = adminMenuService.selectBoardMenuList(cafeDTO);
			
			// 2022-09-23 임시로 설정
			if(boardMenuList == null) {
				boardMenuList = new ArrayList<>();
			
				for(int i=0;i<6;i++) {
					BoardMenuDTO tempDTO = new BoardMenuDTO();
					int boardTypeNumber = i+1;
					
					tempDTO.setBoardMenuName("임시 게시판" + boardTypeNumber);
					tempDTO.setBoardMenuType(boardTypeNumber);
					tempDTO.setBoardOrder(i+1);
					
					boardMenuList.add(tempDTO);
				}
			}
			
			model.addAttribute("cafeDTO", cafeDTO);
			model.addAttribute("menuDTO", menuDTO);
			model.addAttribute("menuTypeList", boardMenuTypeList);
			model.addAttribute("menuList", boardMenuList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "admin/menu/boardMenu";
	}
	
	@RequestMapping("/boardInput")
	public String boardInput(CafeDTO cafeDTO, @RequestBody BoardMenuDTO menuDTO, Model model) {
		String inputFileUrl = "admin/menu/boardMenuInput/";
		
		try {
			List<BoardMenuDTO> boardMenuList = adminMenuService.selectBoardMenuList(cafeDTO);
			
			// 2022-09-23 임시로 설정
			if(boardMenuList == null) {
				boardMenuList = new ArrayList<>();
			
				for(int i=0;i<6;i++) {
					BoardMenuDTO tempDTO = new BoardMenuDTO();
					int boardTypeNumber = i+1;
					
					tempDTO.setBoardMenuName("임시 게시판" + boardTypeNumber);
					tempDTO.setBoardMenuType(boardTypeNumber);
					tempDTO.setBoardOrder(i+1);
					
					boardMenuList.add(tempDTO);
				}
			}
			
			inputFileUrl = inputFileUrl + menuDTO.getBoardMenuType();
			
			model.addAttribute("noLayout", true);
			model.addAttribute("cafeDTO", cafeDTO);
			model.addAttribute("menuDTO", menuDTO);
			model.addAttribute("menuTypeList", boardMenuTypeList);
			model.addAttribute("menuList", boardMenuList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return inputFileUrl;
	}
}
