package com.itbank.navercafe.common.file;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Service
public class TestFileServiceImpl implements TestFileService{

	
	
//	@Override
//	public void saveFile(MultipartHttpServletRequest mul) {
//		System.out.println("id : "+mul.getParameter("id"));
//		System.out.println("name : "+mul.getParameter("name"));
//		
//		MultipartFile file = mul.getFile("f");
//		System.out.println("file : "+file.getOriginalFilename());
//	
//		FileDTO dto = new FileDTO();
//		dto.setId(mul.getParameter("id"));
//		dto.setName(mul.getParameter("name"));
//		
//		
//		if(file.getSize() != 0) {//!file.isEmpty()
//			SimpleDateFormat f= new SimpleDateFormat("yyyyMMddHHmmss-");
//			String sysFileName = f.format(new Date());
//			System.out.println(sysFileName);
//			sysFileName += file.getOriginalFilename();
//			
//			dto.setImgName(sysFileName);
//			
//			File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
//			try {
//				file.transferTo(saveFile);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//		}else {
//			dto.setImgName("nan");
//		}
//		fm.saveData(dto);
//	}

	public String saveFile(MultipartFile file) {
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


	

}
