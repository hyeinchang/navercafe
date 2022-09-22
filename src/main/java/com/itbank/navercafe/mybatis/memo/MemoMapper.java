package com.itbank.navercafe.mybatis.memo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface MemoMapper {
	
	public List<HashMap<String, Object>> getMemoList();
	
}
