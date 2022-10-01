package com.itbank.navercafe.user.cafe.service;

import java.util.List;

import com.itbank.navercafe.common.pagination.Pagination;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.dto.CafeJoinQuestionDTO;

public interface CafeService {
	public List<CafeDTO> selectCafeList(CafeDTO cafeDTO, Pagination pagination) throws Exception;
	public int selectCafeListTotalCount(CafeDTO cafeDTO) throws Exception;
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception;
	public int checkCafeId(String cafeId) throws Exception;
	public int insertCafe(CafeDTO cafeDTO) throws Exception;
	public int getIconSeq() throws Exception;
	public int getTitleSeq() throws Exception;
	public int insertCafeJoinQuestion(CafeJoinQuestionDTO cafeJoinQuestionDTO) throws Exception;
}
