package com.itbank.navercafe.user.cafe.mapper;

import java.util.HashMap;
import java.util.List;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.dto.CafeJoinQuestionDTO;
import com.itbank.navercafe.user.cafe.dto.CafeMemberGradeDTO;

public interface CafeMapper {
	public List<CafeDTO> selectCafeList(HashMap<Object, Object> map) throws Exception;
	public int selectCafeListTotalCount(CafeDTO cafeDTO) throws Exception;
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception;
	public int checkCafeId(String cafeId) throws Exception;
	public int insertCafe(CafeDTO cafeDTO) throws Exception;
	public int getIconSeq() throws Exception;
	public int getTitleSeq() throws Exception;
	public int insertCafeJoinQuestion(CafeJoinQuestionDTO cafeJoinQuestionDTO) throws Exception;
	public int getDayTotalBoardCount(String cafeId) throws Exception;
	public int getDayTotalBoardHit(String cafeId) throws Exception;
	public int getDayTotalReplyCount(String cafeId) throws Exception;
	public int getTotalCafeMemberCount(String cafeId) throws Exception;
	public int insertMemberGrade(CafeMemberGradeDTO cafeMemberGradeDTO) throws Exception;
}
