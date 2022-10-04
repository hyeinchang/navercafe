package com.itbank.navercafe.user.cafemember.mapper;

import org.apache.ibatis.annotations.Param;

import com.itbank.navercafe.user.cafemember.dto.CafeJoinAnswerDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;

public interface CafeMemberMapper {

	//게시글 더보기 용도
	public CafeMemberDTO getUserViewList(@Param("cafeId")String cafeId, @Param("userId")String userId);
	//댓글 작성시 세션아이디를 userId 라는 이름으로 넘겨줌
	public void replyUp(@Param("cafeId")String cafeId, @Param("userId")String userId);
	//게시글안에서 닉네임 따로 처리해주려고 가져오는 애
	public CafeMemberDTO getCafeUserInfo(@Param("cafeId")String cafeId, @Param("userId")String userId);
	//댓글 작성시 세션값 넘겨주기
	public CafeMemberDTO getSessionUserInfo(@Param("cafeId")String cafeId, @Param("userId")String userId);

	public int signup(CafeMemberDTO dto);

	public Integer cafeMembers(@Param("cafeId")String cafeId, @Param("userId")String userId);

	public CafeMemberDTO getCafeMember(@Param("cafeId")String cafeId, @Param("userId")String userId);

	public int cafeMemberUpdate(CafeMemberDTO dto);

	public Integer idOverlap(@Param("cafeUserNickname")String cafeUserNickname, @Param("cafeId")String cafeId);
	
	public int getUserImageSeq() throws Exception;
	
	public int insertJoinAnswer(CafeJoinAnswerDTO cafeJoinAnswerDTO) throws Exception;
}
