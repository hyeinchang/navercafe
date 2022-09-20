package com.itbank.navercafe.comon.file.service;

import com.itbank.navercafe.comon.file.dto.FileDTO;

public interface FileService {
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception;
	public FileDTO selectAttachFile(int fileNum) throws Exception;
	public int selectAttachFileNum(FileDTO fileDTO) throws Exception;
	public int insertAttachFile(FileDTO fileDTO) throws Exception;
	public int modifyAttachFile(FileDTO fileDTO) throws Exception;
	public int deleteAttachFile(int fileNum) throws Exception;
}
