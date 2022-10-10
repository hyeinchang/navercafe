package com.itbank.navercafe.common.file.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.itbank.navercafe.common.file.dto.FileDTO;

public interface FileMapper {
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception;
	
	public FileDTO selectAttachFile_fileNum(int fileNum) throws Exception;
	
	public int selectAttachFileNum(FileDTO fileDTO) throws Exception;
	public int insertAttachFile(FileDTO fileDTO) throws Exception;
	public int updateAttachFile(FileDTO fileDTO) throws Exception;
	public int deleteAttachFile(int fileNum) throws Exception;
	//댓글에 사진 있는지 여부
	public ArrayList<FileDTO> getFileList();
	//replyNum이 존재하는지 여부
	public FileDTO getReplyNum(int replyNum);
	//댓글 사진 업데이트
	public void updateReply(@Param("fileDTO")FileDTO fileDTO,
			@Param("replyNum")int replyNum);
	
	public void deleteReplyNum(int replyNum);
}
