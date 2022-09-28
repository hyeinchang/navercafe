package com.itbank.navercafe.user.memo.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.itbank.navercafe.user.memo.dto.MemoDTO;
import com.itbank.navercafe.user.memo.dto.MemoReplyDTO;

public interface MemoMapper {
	//메모 리스트
	public List<HashMap<String, Object>> getMemoList();
	//메모에 댓글들 리스트
	public List<HashMap<String, Object>> getReplyList();
	
	//댓글 작성
	public int saveMemoReply(MemoReplyDTO dto);
	//답글 작성
	public void saveGroupNumReply(MemoReplyDTO dto);
	//댓글 갯수 가져오기
	public int getReplyCount(Object object);
	//메모게시글 작성
	public void memoSave(MemoDTO dto);
}
