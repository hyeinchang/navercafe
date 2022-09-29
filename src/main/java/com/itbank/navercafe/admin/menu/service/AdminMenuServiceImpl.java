package com.itbank.navercafe.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.admin.menu.dto.AdminMenuDTO;
import com.itbank.navercafe.admin.menu.mapper.AdminMenuMapper;

@Service
public class AdminMenuServiceImpl implements AdminMenuService {
	@Autowired
	AdminMenuMapper adminMenuMapper;

	@Override
	public int insertBoardMenu(AdminMenuDTO adminMenuDTO) throws Exception {
		return adminMenuMapper.insertBoardMenu(adminMenuDTO);
	}

	@Override
	public int updateBoardMenu(AdminMenuDTO adminMenuDTO) throws Exception {
		return adminMenuMapper.updateBoardMenu(adminMenuDTO);
	}
	
	@Override
	public List<AdminMenuDTO> selectBoardMenuList(String cafeId) throws Exception {
		return adminMenuMapper.selectBoardMenuList(cafeId);
	}

	@Override
	public AdminMenuDTO selectBoardMenu(int boardMenuNum) throws Exception {
		return adminMenuMapper.selectBoardMenu(boardMenuNum);
	}

	@Override
	public int deleteBoardMenu(int boardMenuNum) throws Exception {
		try {
			// 해당 게시판의 게시글 삭제
			this.deleteBoardList(boardMenuNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return adminMenuMapper.deleteBoardMenu(boardMenuNum);
	}

	@Override
	public int deleteBoardList(int boardMenuNum) throws Exception {
		return adminMenuMapper.deleteBoardList(boardMenuNum);
	}
}
