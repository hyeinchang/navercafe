package com.itbank.navercafe.common.file.mapper;

import java.util.List;

import com.itbank.navercafe.common.file.dto.FileDTO;

public interface FileMapper {
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception;
	public FileDTO selectAttachFile_fileNum(int fileNum) throws Exception;
	public int selectAttachFileNum(FileDTO fileDTO) throws Exception;
	public int insertAttachFile(FileDTO fileDTO) throws Exception;
	public int updateAttachFile(FileDTO fileDTO) throws Exception;
	public int deleteAttachFile(int fileNum) throws Exception;
	public List<FileDTO> getFileList(FileDTO fileDTO) throws Exception;
}
