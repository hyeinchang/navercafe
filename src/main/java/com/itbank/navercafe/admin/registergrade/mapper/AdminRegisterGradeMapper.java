package com.itbank.navercafe.admin.registergrade.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.itbank.navercafe.admin.registergrade.dto.GradeUpAppliesDTO;
import com.itbank.navercafe.admin.registergrade.dto.JoinQuestionDTO;
import com.itbank.navercafe.admin.registergrade.dto.MembersGradeDTO;
import com.itbank.navercafe.admin.registergrade.dto.RegisterInfoDTO;

public interface AdminRegisterGradeMapper {
	public int deleteRequest(Map<String, String> map) throws Exception;
	public int acceptMembers(Map<String, String> map) throws Exception;
	public int modifyMembersGrade(MembersGradeDTO membersGradeDTO);
	public int modifyRegisterInfo(RegisterInfoDTO dto);
	public int countQuestion(RegisterInfoDTO dto);
	public void insertQuestion(JoinQuestionDTO jdto);
	public void updateQuestion(JoinQuestionDTO jdto);
	
	//project_upgrade_board(등업게시판) 에서 멤버삭제
	public int gradeRejectMembers(Map<String, String> map);
	//project_cafe_member(카페회원) 의  cafe_user_grade 상승
	public int gradeUpMembers(Map<String, String> map);
	public ArrayList<MembersGradeDTO> getMembersGradeList(String cafeId);
	public ArrayList<GradeUpAppliesDTO> getGradeUpAppliesList(String cafeId);
}
