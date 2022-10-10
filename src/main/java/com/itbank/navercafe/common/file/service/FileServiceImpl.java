package com.itbank.navercafe.common.file.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public void getFileList(Model model) {
		ArrayList<FileDTO> list=fileMapper.getFileList();
		for(int i=0 ; i<list.size();i++) {
		}
		model.addAttribute("fileList",fileMapper.getFileList());
	}
	
	@Override
	public FileDTO getReplyNum(int replyNum) {
		return fileMapper.getReplyNum(replyNum);
	}

	@Override
	public void updateReply(FileDTO fileDTO, int replyNum) {
		fileMapper.updateReply(fileDTO, replyNum);
	}

	@Override
	public void deleteReplyNum(int replyNum) {
		System.out.println("여까지 안오나?"+replyNum);
		fileMapper.deleteReplyNum(replyNum);
	}

	
}
