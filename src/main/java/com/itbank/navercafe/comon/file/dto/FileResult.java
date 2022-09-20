package com.itbank.navercafe.comon.file.dto;

import java.util.ArrayList;

public class FileResult {
	public final int FAIL = 0;
	public final int SUCCESS = 1;
	public final int NO_FILE = 3;
	
	private int state;
	private FileDTO fileDTO;
	private ArrayList<FileDTO> fileDTOList;
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public FileDTO getFileDTO() {
		return fileDTO;
	}
	public void setFileDTO(FileDTO fileDTO) {
		this.fileDTO = fileDTO;
	}
	public int getFAIL() {
		return FAIL;
	}
	public int getSUCCESS() {
		return SUCCESS;
	}
	public int getNO_FILE() {
		return NO_FILE;
	}
	public ArrayList<FileDTO> getFileDTOList() {
		if(fileDTOList == null) {
			fileDTOList = new ArrayList<>();
		}
		return fileDTOList;
	}
	public void setFileDTOList(ArrayList<FileDTO> fileDTOList) {
		this.fileDTOList = fileDTOList;
	}
}
