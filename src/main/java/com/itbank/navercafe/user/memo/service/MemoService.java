package com.itbank.navercafe.user.memo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface MemoService {
	public List<HashMap<String, Object>> getMemoList();
	public List<HashMap<String, Object>> getReplyList();
}
