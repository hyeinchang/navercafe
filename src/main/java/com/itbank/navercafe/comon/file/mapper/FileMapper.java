package com.itbank.navercafe.comon.file.mapper;

import java.util.ArrayList;

import com.itbank.navercafe.comon.file.dto.FileDTO;

public interface FileMapper {
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception;
	public FileDTO selectAttachFile(int fileNum) throws Exception;
	public int selectAttachFileNum(FileDTO fileDTO) throws Exception;
	public int insertAttachFile(FileDTO fileDTO) throws Exception;
	public int modifyAttachFile(FileDTO fileDTO) throws Exception;
	public int deleteAttachFile(int fileNum) throws Exception;
	//임시
	public ArrayList<FileDTO> getFileList();
}
