package com.itbank.navercafe.mybatis.cafemember;

import java.util.ArrayList;

import com.itbank.navercafe.comon.file.dto.FileDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;



public interface CafeMemberMapper {
	public ArrayList<CafeMemberDTO> getCafeMemberList();
	
	public int saveData(CafeMemberDTO dto);
	public void saveFileDTO(TestFileDTO tfd);
	
	
	public CafeMemberDTO getCafeUserInfo(String userId);
	
	//댓글 작성시 세션값 넘겨주기
	public CafeMemberDTO getSessionUserInfo(String sessionId);
	
	//게시글 더보기 용도
	public CafeMemberDTO getUserViewList(String userId);
	
	//댓글 작성시 세션아이디를 userId 라는 이름으로 넘겨줌
	public void replyUp(String userId);
	
	public int getSequence();
	
	public void insert(CafeMemberDTO dto);

	
	public ArrayList<TestFileDTO> getFileNameList();

}
