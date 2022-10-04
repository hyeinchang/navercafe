package com.itbank.navercafe.common.file;

import org.springframework.web.multipart.MultipartFile;



public interface TestFileService {
	String IMAGE_REPO="c:/spring/image_repo";
	public String saveFile(MultipartFile file);

}
