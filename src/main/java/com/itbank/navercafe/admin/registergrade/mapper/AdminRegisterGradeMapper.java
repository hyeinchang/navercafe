package com.itbank.navercafe.admin.registergrade.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.itbank.navercafe.admin.registergrade.dto.GradeUpAppliesDTO;
import com.itbank.navercafe.admin.registergrade.dto.JoinQuestionDTO;
import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterBanDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterRequestDTO;

public interface AdminRegisterGradeMapper {
	
	//project_cafe_join_request 에 등록된 가입신청 삭제
	public int deleteRequest(Map<String, String> map) throws Exception;
	// 가입허가
	public int acceptMembers(Map<String, String> map) throws Exception;
	
	//
	public int modifyMembersGrade(MembersGradeDTO membersGradeDTO);
	public int modifyRegisterInfo(RegisterInfoDTO dto);
	
	//project_join_question 에서 등록된 질문 개수 카운트
	public int countQuestion(RegisterInfoDTO dto);
	//project_join_question 에 질문 추가
	public void insertQuestion(JoinQuestionDTO jdto);
	//project_join_question 에 질문 수정
	public void updateQuestion(JoinQuestionDTO jdto);
	//project_join_question 에 질문 삭제
	public void deleteQuestion(Map<String, String> map);
	
	//project_upgrade_board(등업게시판) 에서 멤버삭제
	public int gradeRejectMembers(Map<String, String> map);
	//project_cafe_member(카페회원) 의  cafe_user_grade 상승
	public int gradeUpMembers(Map<String, String> map);
	//project_blacklist 에서 회원가입 불가 처리한 인원들 삭제
	public int unbanMembers(Map<String, String> map);
	
	// body에 뿌릴 list 및 dto
	public ArrayList<MembersGradeDTO> getMembersGradeList(String cafeId);
	public ArrayList<GradeUpAppliesDTO> getGradeUpAppliesList(String cafeId);
	public ArrayList<RegisterBanDTO> getRegisterBanList(String cafeId);
	public RegisterInfoDTO getRegisterInfo(String cafeId);
	public ArrayList<JoinQuestionDTO> getJoinQuestion(String cafeId);
	public ArrayList<RegisterRequestDTO> getRegisterRequestList(String cafeId);
}
