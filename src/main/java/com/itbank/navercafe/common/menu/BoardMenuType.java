package com.itbank.navercafe.common.menu;

import java.util.ArrayList;
import java.util.List;

import com.itbank.navercafe.user.boardmenu.dto.BoardMenuDTO;

// 게시판 메뉴 타입 설정
public class BoardMenuType {
	public final int TOTAL_BOARD_NUM = 1;
	public final int SIMPLE_BOARD_NUM = 2;
	public final int STAFF_BOARD_NUM = 3;
	public final int GRADE_BOARD_NUM = 4;
	public final int MEMO_BOARD_NUM = 5;
	public final int ATTENDANCE_BOARD_NUM = 6;
	
	public final String TOTAL_BOARD_NAME = "통합게시판";
	public final String SIMPLE_BOARD_NAME = "간편게시판";
	public final String STAFF_BOARD_NAME = "스탭게시판";
	public final String GRADE_BOARD_NAME = "등업게시판";
	public final String MEMO_BOARD_NAME = "메모게시판";
	public final String ATTENDANCE_BOARD_NAME = "출석게시판";
	
	private int boardMenuNum[] = {TOTAL_BOARD_NUM, SIMPLE_BOARD_NUM, STAFF_BOARD_NUM, GRADE_BOARD_NUM, MEMO_BOARD_NUM, ATTENDANCE_BOARD_NUM};
	private String boardMenuName[] = {TOTAL_BOARD_NAME, SIMPLE_BOARD_NAME, STAFF_BOARD_NAME, GRADE_BOARD_NAME, MEMO_BOARD_NAME, ATTENDANCE_BOARD_NAME};
	
	private List<BoardMenuDTO> boardMenuTypeList;

	public List<BoardMenuDTO> getBoardMenuTypeList() {
		boardMenuTypeList = new ArrayList<>();
		
		for(int i=0; i<boardMenuNum.length; i++) {
			BoardMenuDTO boardMenuDTO = new BoardMenuDTO();
			
			boardMenuDTO.setBoardMenuType(boardMenuNum[i]);
			boardMenuDTO.setBoardMenuName(boardMenuName[i]);
			
			boardMenuTypeList.add(boardMenuDTO);
		}
		
		return boardMenuTypeList;
	}
	public void setBoardMenuTypeList(List<BoardMenuDTO> boardMenuTypeList) {
		this.boardMenuTypeList = boardMenuTypeList;
	}
	public int getTOTAL_BOARD_NUM() {
		return TOTAL_BOARD_NUM;
	}
	public int getSIMPLE_BOARD_NUM() {
		return SIMPLE_BOARD_NUM;
	}
	public int getSTAFF_BOARD_NUM() {
		return STAFF_BOARD_NUM;
	}
	public int getGRADE_BOARD_NUM() {
		return GRADE_BOARD_NUM;
	}
	public int getATTENDANCE_BOARD_NUM() {
		return ATTENDANCE_BOARD_NUM;
	}
	public String getTOTAL_BOARD_NAME() {
		return TOTAL_BOARD_NAME;
	}
	public String getSIMPLE_BOARD_NAME() {
		return SIMPLE_BOARD_NAME;
	}
	public String getSTAFF_BOARD_NAME() {
		return STAFF_BOARD_NAME;
	}
	public String getGRADE_BOARD_NAME() {
		return GRADE_BOARD_NAME;
	}
	public String getATTENDANCE_BOARD_NAME() {
		return ATTENDANCE_BOARD_NAME;
	}
}
