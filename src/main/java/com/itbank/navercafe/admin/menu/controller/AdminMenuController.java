package com.itbank.navercafe.admin.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.navercafe.admin.menu.dto.AdminMenuDTO;
import com.itbank.navercafe.admin.menu.service.AdminMenuService;
import com.itbank.navercafe.common.CommonUtils;
import com.itbank.navercafe.common.menu.BoardMenuType;
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
			String cafeId = cafeDTO.getCafeId();
			List<AdminMenuDTO> boardMenuList = adminMenuService.selectBoardMenuList(cafeId);
			
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
	public String boardInput(CafeDTO cafeDTO, @RequestBody AdminMenuDTO menuDTO, Model model) {
		String inputFileUrl = "admin/menu/boardMenuInput/";
		
		try {
			int boardMenuNum = menuDTO.getBoardMenuNum();
			
			inputFileUrl = inputFileUrl + menuDTO.getBoardMenuType();
			
			if(boardMenuNum != 0) {
				menuDTO = adminMenuService.selectBoardMenu(boardMenuNum);
			} 
			
			model.addAttribute("noLayout", true);
			model.addAttribute("cafeDTO", cafeDTO);
			model.addAttribute("menuDTO", menuDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return inputFileUrl;
	}
	
	
	@RequestMapping("/saveBoardMenu")
	public String saveBoardMenu(HttpServletRequest request, CafeDTO cafeDTO, RedirectAttributes ra) {
		String[] boardMenuNums = request.getParameterValues("boardMenuNum");
		CommonUtils commonUtils = new CommonUtils();	

		try {
			if(boardMenuNums != null && boardMenuNums.length > 0) {
				int order = 1;
				
				for(int i=0; i<boardMenuNums.length; i++) {
					AdminMenuDTO menuDTO = new AdminMenuDTO();
					
					menuDTO.setCafeId(cafeDTO.getCafeId());
					commonUtils.setDTO(request, menuDTO, i);
					
					if(menuDTO.getDelFlag().equals("Y")) {
						continue;
					}
					
					menuDTO.setBoardOrder(order);
					
					// insert
					if(menuDTO.getBoardMenuNum() == 0) {
						adminMenuService.insertBoardMenu(menuDTO);
					// update
					} else {
						adminMenuService.updateBoardMenu(menuDTO);
					}
					
					order++;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		ra.addAttribute("cafeId", cafeDTO.getCafeId());
		
		return "redirect:boardMenu";
	}
}
