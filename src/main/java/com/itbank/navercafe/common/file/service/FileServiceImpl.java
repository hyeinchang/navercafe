package com.itbank.navercafe.common.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService {
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public FileDTO selectAttachFile(FileDTO fileDTO) throws Exception {
		return fileMapper.selectAttachFile(fileDTO);
	}
	
	@Override
	public FileDTO selectAttachFile_fileNum(int fileNum) throws Exception {
		return fileMapper.selectAttachFile_fileNum(fileNum);
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
	public int updateAttachFile(FileDTO fileDTO) throws Exception {
		return fileMapper.updateAttachFile(fileDTO);
	}

	@Override
	public int deleteAttachFile(int fileNum) throws Exception {
		return fileMapper.deleteAttachFile(fileNum);
	}

	@Override
	public List<FileDTO> getFileList(FileDTO fileDTO) throws Exception {
		return fileMapper.getFileList(fileDTO);
	}

	@Override
	public List<FileDTO> getBoardFileList(int boardMenuNum) throws Exception {
		return fileMapper.getBoardFileList(boardMenuNum);
	}
}
