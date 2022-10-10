package com.itbank.navercafe.common.file.service;

import org.springframework.ui.Model;

import com.itbank.navercafe.common.file.dto.FileDTO;

public interface FileService {
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception;
	public FileDTO selectAttachFile_fileNum(int fileNum) throws Exception;
	public int selectAttachFileNum(FileDTO fileDTO) throws Exception;
	public int insertAttachFile(FileDTO fileDTO) throws Exception;
	public int updateAttachFile(FileDTO fileDTO) throws Exception;
	public int deleteAttachFile(int fileNum) throws Exception;
	
	//파일테이블리스트
	public void getFileList(Model model);
	//replyNum존재여부
		public FileDTO getReplyNum(int replyNum);
	//댓글 사진 업데이트
	public void updateReply(FileDTO fileDTO, int replyNum);
	
}
