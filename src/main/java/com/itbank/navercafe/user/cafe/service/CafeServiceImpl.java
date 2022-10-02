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
import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.menu.service.MenuService;

@Service
public class CafeServiceImpl implements CafeService {
	@Autowired
	private CafeMapper cafeMapper;
	
	@Autowired
	private MenuService menuService;
	
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
		List<MenuDTO> cafeMenuList = null;
		Map<String, Integer> dayCountMap = null;
		
		try {
			String cafeId = cafeDTO.getCafeId();
			cafeDTO = cafeMapper.selectCafe(cafeDTO);
			cafeMenuList = menuService.selectBoardMenuList(cafeId);
			dayCountMap = this.getCafeDayCount(cafeId);
			
			if(cafeDTO != null && cafeMenuList != null) {
				cafeDTO.setCafeMenuList(cafeMenuList);
			}
			if(cafeDTO != null && dayCountMap != null) {
				cafeDTO.setDayCountMap(dayCountMap);
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
	public Map<String, Integer> getCafeDayCount(String cafeId) throws Exception {
		Map<String, Integer> dayCountMap = new HashMap<>();
		
		try {
			int dayBoardCount = cafeMapper.getDayTotalBoardCount(cafeId);
			int dayBoardHit = cafeMapper.getDayTotalBoardHit(cafeId);
			int dayReplyCount = cafeMapper.getDayTotalReplyCount(cafeId);
			int totalCafeMember = cafeMapper.getTotalCafeMemberCount(cafeId);
			
			dayCountMap.put("dayBoardCount", dayBoardCount);
			dayCountMap.put("dayBoardHit", dayBoardHit);
			dayCountMap.put("dayReplyCount", dayReplyCount);
			dayCountMap.put("totalCafeMember", totalCafeMember);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dayCountMap;
	}

	@Override
	public int insertMemberGrade(CafeMemberGradeDTO cafeMemberGradeDTO) throws Exception {
		return cafeMapper.insertMemberGrade(cafeMemberGradeDTO);
	}
}
