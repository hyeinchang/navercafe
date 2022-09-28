package com.itbank.navercafe.common.file.service;

import com.itbank.navercafe.common.file.dto.FileDTO;

public interface FileService {
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception;
	public FileDTO selectAttachFile_fileNum(int fileNum) throws Exception;
	public int selectAttachFileNum(FileDTO fileDTO) throws Exception;
	public int insertAttachFile(FileDTO fileDTO) throws Exception;
	public int modifyAttachFile(FileDTO fileDTO) throws Exception;
	public int deleteAttachFile(int fileNum) throws Exception;
}
