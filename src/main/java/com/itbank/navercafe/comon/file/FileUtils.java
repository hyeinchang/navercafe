package com.itbank.navercafe.comon.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtils {
	@Value("${navercafe.file.upload_path}")
	private String upload_path;
	
	public void test(MultipartFile multipartFile) throws IllegalStateException, IOException {
		String testPath = upload_path+"/test";
		File file = new File(testPath);
		boolean exists = file.exists() ? true : file.mkdirs();
		
		if(exists) {
			multipartFile.transferTo(new File(testPath + "/" + multipartFile.getOriginalFilename()));
		}
		
		System.out.println(file.isDirectory());
		System.out.println(file.exists());
		System.out.println("upload_path ---- " + upload_path);
	}
	
	public void download(HttpServletResponse response, String directory, String fileName) throws IllegalStateException, IOException {
		String downloadPath = upload_path + "/" + directory;
		FileInputStream fis = null;
		File dir = null;
		
		try {
			dir = new File(downloadPath);
			
			if(dir.exists()) {
				File file = new File(downloadPath + "/" + fileName);
				fis = new FileInputStream(file);
				FileCopyUtils.copy(fis, response.getOutputStream());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			fis.close();
		}
		
		
		
	}

	public String getUpload_path() {
		return upload_path;
	}

	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}
}
