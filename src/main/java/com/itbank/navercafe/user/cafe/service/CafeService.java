package com.itbank.navercafe.user.cafe.service;

import java.util.List;
import java.util.Map;

import com.itbank.navercafe.common.pagination.Pagination;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.dto.CafeJoinQuestionDTO;
import com.itbank.navercafe.user.cafe.dto.CafeMemberGradeDTO;

public interface CafeService {
	public List<CafeDTO> selectCafeList(CafeDTO cafeDTO, Pagination pagination) throws Exception;
	public int selectCafeListTotalCount(CafeDTO cafeDTO) throws Exception;
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception;
	public int checkCafeId(String cafeId) throws Exception;
	public int insertCafe(CafeDTO cafeDTO) throws Exception;
	public int getIconSeq() throws Exception;
	public int getTitleSeq() throws Exception;
	public int insertCafeJoinQuestion(CafeJoinQuestionDTO cafeJoinQuestionDTO) throws Exception;
	public Map<String, Integer> getCafeCount(String cafeId) throws Exception;
	public int insertMemberGrade(CafeMemberGradeDTO cafeMemberGradeDTO) throws Exception;
	public List<CafeJoinQuestionDTO> selectQuestionList(String cafeId) throws Exception;
}
