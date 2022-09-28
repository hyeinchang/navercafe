package com.itbank.navercafe.comon.file;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



public interface TestFileService {
	String IMAGE_REPO="c:/spring/image_repo";
	public String saveFile(MultipartFile file);

}
