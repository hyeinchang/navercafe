package com.itbank.navercafe.comon.file.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.comon.file.dto.FileDTO;
import com.itbank.navercafe.comon.file.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService {
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception {
		return null;
	}
	
	@Override
	public FileDTO selectAttachFile(int fileNum) throws Exception {
		return null;
	}
	
	@Override
	public int selectAttachFileNum(FileDTO fileDTO) throws Exception {
		return 0;
	}

	@Override
	public int insertAttachFile(FileDTO fileDTO) throws Exception {
		return fileMapper.insertAttachFile(fileDTO);
	}

	@Override
	public int modifyAttachFile(FileDTO fileDTO) throws Exception {
		return 0;
	}

	@Override
	public int deleteAttachFile(int fileNum) throws Exception {
		return 0;
	}
}
