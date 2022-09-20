package com.itbank.navercafe.comon.file;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl implements FileService{

	
	public String saveFile(MultipartFile file) {
		
		/*
		 * if(file.equals(null)) { System.out.println("이미지 파일 없음"); File saveFile = new
		 * File(IMAGE_REPO+"/"+"프로필.jpg"); try { file.transferTo(saveFile);//해당 위치에 파일
		 * 저장 }catch (Exception e) { e.printStackTrace(); } return "프로필.jpg"; }
		 */
	    SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss-");
	    Calendar calendar = Calendar.getInstance();
	    String sysFileName = simpl.format(calendar.getTime()) + file.getOriginalFilename();
	    File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
	    try {
	    	file.transferTo(saveFile);//해당 위치에 파일 저장
			 }catch (Exception e) {
			   e.printStackTrace();
			    }
	    return sysFileName;
	}

	/*
	 * @Override public void deleteImage(String delImage) { File d=new
	 * File(IMAGE_REPO+"/"+delImage); d.delete();
	 * 
	 * }
	 */
}
