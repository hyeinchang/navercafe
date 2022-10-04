package com.itbank.navercafe.user.cafe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.common.pagination.Pagination;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.dto.CafeJoinQuestionDTO;
import com.itbank.navercafe.user.cafe.dto.CafeMemberGradeDTO;
import com.itbank.navercafe.user.cafe.mapper.CafeMapper;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.mapper.CafeMemberMapper;
import com.itbank.navercafe.user.cafemember.service.CafeMemberService;
import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.menu.service.MenuService;

@Service
public class CafeServiceImpl implements CafeService {
	@Autowired
	private CafeMapper cafeMapper;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private CafeMemberService cafeMemberService;
	
	@Override
	public List<CafeDTO> selectCafeList(CafeDTO cafeDTO, Pagination pagination) throws Exception {
		HashMap<Object, Object> map = new HashMap<>();
		
		try {
			map.put("cafeName", cafeDTO.getCafeName());
			map.put("startRow", pagination.getStartRow());
			map.put("endRow", pagination.getEndRow());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cafeMapper.selectCafeList(map);
	}

	@Override
	public int selectCafeListTotalCount(CafeDTO cafeDTO) throws Exception {
		return cafeMapper.selectCafeListTotalCount(cafeDTO);
	}
	
	@Override
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception {
		MenuDTO menuDTO = new MenuDTO();
		List<MenuDTO> cafeMenuList = null;
		Map<String, Integer> countMap = null;
		List<CafeJoinQuestionDTO> questionList = null;
		CafeMemberDTO loginUser = null;
		
		try {
			String cafeId = cafeDTO.getCafeId();
			String loginId = cafeDTO.getLoginId();
			int boardMenuNum = cafeDTO.getBoardMenuNum();
			
			cafeDTO = cafeMapper.selectCafe(cafeDTO);
			menuDTO = menuService.selectBoardMenu(boardMenuNum);
			cafeMenuList = menuService.selectBoardMenuList(cafeId);
			countMap = this.getCafeCount(cafeId);
			questionList = this.selectQuestionList(cafeId);
			loginUser = cafeMemberService.getCafeMember(cafeId, loginId);
			
			if(cafeDTO != null && menuDTO != null) {
				cafeDTO.setMenuDTO(menuDTO);
			}
			if(cafeDTO != null && cafeMenuList != null) {
				cafeDTO.setCafeMenuList(cafeMenuList);
			}
			if(cafeDTO != null && countMap != null) {
				cafeDTO.setCountMap(countMap);
			}
			if(cafeDTO != null && questionList != null) {
				cafeDTO.setQuestionList(questionList);
			}
			if(cafeDTO != null && loginUser != null) {
				cafeDTO.setLoginUser(loginUser);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cafeDTO;
	}

	@Override
	public int checkCafeId(String cafeId) throws Exception {
		return cafeMapper.checkCafeId(cafeId);
	}

	@Override
	public int insertCafe(CafeDTO cafeDTO) throws Exception {
		return cafeMapper.insertCafe(cafeDTO);
	}

	@Override
	public int getIconSeq() throws Exception {
		return cafeMapper.getIconSeq();
	}

	@Override
	public int getTitleSeq() throws Exception {
		return cafeMapper.getTitleSeq();
	}

	@Override
	public int insertCafeJoinQuestion(CafeJoinQuestionDTO cafeJoinQuestionDTO) throws Exception {
		return cafeMapper.insertCafeJoinQuestion(cafeJoinQuestionDTO);
	}

	@Override
	public Map<String, Integer> getCafeCount(String cafeId) throws Exception {
		Map<String, Integer> countMap = new HashMap<>();
		
		try {
			int dayBoardCount = cafeMapper.getDayTotalBoardCount(cafeId);
			int dayBoardHit = cafeMapper.getDayTotalBoardHit(cafeId);
			int dayReplyCount = cafeMapper.getDayTotalReplyCount(cafeId);
			int totalCafeMember = cafeMapper.getTotalCafeMemberCount(cafeId);
			int totalBoardCount = cafeMapper.getTotalBoardCount(cafeId);
			int totalBoardHit = cafeMapper.getTotalBoardHit(cafeId);
			int totalReplyCount = cafeMapper.getTotalReplyCount(cafeId);
			
			countMap.put("dayBoardCount", dayBoardCount);
			countMap.put("dayBoardHit", dayBoardHit);
			countMap.put("dayReplyCount", dayReplyCount);
			countMap.put("totalCafeMember", totalCafeMember);
			countMap.put("totalBoardCount", totalBoardCount);
			countMap.put("totalBoardHit", totalBoardHit);
			countMap.put("totalReplyCount", totalReplyCount);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public int insertMemberGrade(CafeMemberGradeDTO cafeMemberGradeDTO) throws Exception {
		return cafeMapper.insertMemberGrade(cafeMemberGradeDTO);
	}

	@Override
	public List<CafeJoinQuestionDTO> selectQuestionList(String cafeId) throws Exception {
		List<CafeJoinQuestionDTO> questionList = null;
		
		try {
			questionList = cafeMapper.selectQuestionList(cafeId);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return questionList;
	}
}
