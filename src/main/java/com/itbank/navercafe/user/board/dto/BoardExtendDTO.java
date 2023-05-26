package com.itbank.navercafe.user.board.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;

public class BoardExtendDTO extends MenuDTO {
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardSaveDate;
	private int boardLikes;
	private String boardNotice;
	private String boardReplyAllow;
	private String boardPrefix;
	private String userId;
	private int boardMenuNum;
	private int hit;
	private String cafeId;
	
	private String cafeUserNickname;
	private int cafeUserImageNum;
	private int cafeUserGrade;
	private int cafeUserVisit;
	private int cafeUserWrite;
	private int cafeUserReply;
	private int cafeUserVisitCheck;
	private Date cafeUserRegdate;
	private Date cafeUserApplydate;
	private String cafeUserStatus;
	
	private String cutName;
	private int upCafeUserGrade;
	private String upCutName;
	
	private int replyCount;
	private List<ReplyDTO> replyList;
	private List<FileDTO> fileList;
	
	private Map<String, Object> addData;
	private Map<String, Object> htmlData;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Timestamp getBoardSaveDate() {
		return boardSaveDate;
	}
	public void setBoardSaveDate(Timestamp boardSaveDate) {
		this.boardSaveDate = boardSaveDate;
	}
	public int getBoardLikes() {
		return boardLikes;
	}
	public void setBoardLikes(int boardLikes) {
		this.boardLikes = boardLikes;
	}
	public String getBoardNotice() {
		return boardNotice;
	}
	public void setBoardNotice(String boardNotice) {
		this.boardNotice = boardNotice;
	}
	public String getBoardReplyAllow() {
		return boardReplyAllow;
	}
	public void setBoardReplyAllow(String boardReplyAllow) {
		this.boardReplyAllow = boardReplyAllow;
	}
	public String getBoardPrefix() {
		return boardPrefix;
	}
	public void setBoardPrefix(String boardPrefix) {
		this.boardPrefix = boardPrefix;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBoardMenuNum() {
		return boardMenuNum;
	}
	public void setBoardMenuNum(int boardMenuNum) {
		this.boardMenuNum = boardMenuNum;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCafeId() {
		return cafeId;
	}
	public void setCafeId(String cafeId) {
		this.cafeId = cafeId;
	}
	public String getCafeUserNickname() {
		return cafeUserNickname;
	}
	public void setCafeUserNickname(String cafeUserNickname) {
		this.cafeUserNickname = cafeUserNickname;
	}
	public int getCafeUserImageNum() {
		return cafeUserImageNum;
	}
	public void setCafeUserImageNum(int cafeUserImageNum) {
		this.cafeUserImageNum = cafeUserImageNum;
	}
	public int getCafeUserGrade() {
		return cafeUserGrade;
	}
	public void setCafeUserGrade(int cafeUserGrade) {
		this.cafeUserGrade = cafeUserGrade;
	}
	public int getCafeUserVisit() {
		return cafeUserVisit;
	}
	public void setCafeUserVisit(int cafeUserVisit) {
		this.cafeUserVisit = cafeUserVisit;
	}
	public int getCafeUserWrite() {
		return cafeUserWrite;
	}
	public void setCafeUserWrite(int cafeUserWrite) {
		this.cafeUserWrite = cafeUserWrite;
	}
	public int getCafeUserReply() {
		return cafeUserReply;
	}
	public void setCafeUserReply(int cafeUserReply) {
		this.cafeUserReply = cafeUserReply;
	}
	public int getCafeUserVisitCheck() {
		return cafeUserVisitCheck;
	}
	public void setCafeUserVisitCheck(int cafeUserVisitCheck) {
		this.cafeUserVisitCheck = cafeUserVisitCheck;
	}
	public Date getCafeUserRegdate() {
		return cafeUserRegdate;
	}
	public void setCafeUserRegdate(Date cafeUserRegdate) {
		this.cafeUserRegdate = cafeUserRegdate;
	}
	public Date getCafeUserApplydate() {
		return cafeUserApplydate;
	}
	public void setCafeUserApplydate(Date cafeUserApplydate) {
		this.cafeUserApplydate = cafeUserApplydate;
	}
	public String getCafeUserStatus() {
		return cafeUserStatus;
	}
	public void setCafeUserStatus(String cafeUserStatus) {
		this.cafeUserStatus = cafeUserStatus;
	}
	public String getCutName() {
		return cutName;
	}
	public void setCutName(String cutName) {
		this.cutName = cutName;
	}
	public int getUpCafeUserGrade() {
		return upCafeUserGrade;
	}
	public void setUpCafeUserGrade(int upCafeUserGrade) {
		this.upCafeUserGrade = upCafeUserGrade;
	}
	public String getUpCutName() {
		return upCutName;
	}
	public void setUpCutName(String upCutName) {
		this.upCutName = upCutName;
	}
	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public List<ReplyDTO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<ReplyDTO> replyList) {
		this.replyList = replyList;
	}
	public List<FileDTO> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileDTO> fileList) {
		this.fileList = fileList;
	}
	public Map<String, Object> getAddData() {
		return addData;
	}
	public void setAddData(Map<String, Object> addData) {
		this.addData = addData;
	}
	public Map<String, Object> getHtmlData() {
		return htmlData;
	}
	public void setHtmlData(Map<String, Object> htmlData) {
		this.htmlData = htmlData;
	}
}
