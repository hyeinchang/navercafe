package com.itbank.navercafe.user.cafe.mapper;

import java.util.HashMap;
import java.util.List;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

public interface CafeMapper {
	public List<CafeDTO> selectCafeList(HashMap<Object, Object> map) throws Exception;
	public int selectCafeListTotalCount(CafeDTO cafeDTO) throws Exception;
	public CafeDTO selectCafe(CafeDTO cafeDTO) throws Exception;
	public int checkCafeId(String cafeId) throws Exception;
	public int InsertCafe(CafeDTO cafeDTO) throws Exception;
	public int getIconSeq() throws Exception;
	public int getTitleSeq() throws Exception;
}
