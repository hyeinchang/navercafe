package com.itbank.navercafe.user.cafemember.mapper;

import java.util.ArrayList;


import com.itbank.navercafe.comon.file.dto.FileDTO;

import org.apache.ibatis.annotations.Param;

import com.itbank.navercafe.user.cafejoin.dto.CafeJoinDTO;

import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;



public interface CafeMemberMapper {

	
	//수정 할때 변경해서 임시로 사용
	public int saveData(CafeMemberDTO dto);
	//파일테이블에도 등록
	public void saveFileDTO(TestFileDTO tfd);
	//게시글 더보기 용도
	public CafeMemberDTO getUserViewList(String userId);
	//댓글 작성시 세션아이디를 userId 라는 이름으로 넘겨줌
	public void replyUp(String userId);
	//시퀀스 값 가져오는애
	public int getSequence();
	//게시글안에서 닉네임 따로 처리해주려고 가져오는 애
	public CafeMemberDTO getCafeUserInfo(String userId);
	//댓글 작성시 세션값 넘겨주기
	public CafeMemberDTO getSessionUserInfo(String sessionId);
	

	public int signup(CafeMemberDTO dto);


	public Integer cafeMembers(@Param("cafeId")String cafeId, @Param("userId")String userId);

	public CafeMemberDTO getCafeMember(@Param("cafeId")String cafeId, @Param("userId")String userId);

	public int cafeMemberUpdate(CafeMemberDTO dto);

	public Integer idOverlap(@Param("cafeUserNickname")String cafeUserNickname, @Param("cafeId")String cafeId);

}
