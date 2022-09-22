package com.itbank.navercafe.comon.file.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.FileUtils;
import com.itbank.navercafe.comon.file.dto.FileDTO;
import com.itbank.navercafe.comon.file.dto.FileResult;
import com.itbank.navercafe.comon.file.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping("/download")
	public void download(HttpServletResponse response, FileDTO fileDTO) {
		try {
			fileUtils.download(response, fileDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/download/smarteditor")
	public void downloadSmarteditor(HttpServletResponse response, FileDTO fileDTO) {
		try {
			fileUtils.download(response, fileDTO, true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/upload/smarteditor/temp", produces="application/json")
	@ResponseBody
	public FileResult uploadSmarteditorTemp(MultipartHttpServletRequest multiRequest) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		FileResult fileResult = null;
		
		try {
			String directory = "smarteditor/temp/" + sdf.format(new Date());
			
			fileResult = fileUtils.uploadFile(multiRequest, directory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileResult;
	}
	
	@RequestMapping(value="/upload/smarteditor", produces="application/json")
	@ResponseBody
	public FileResult uploadSmarteditor(MultipartHttpServletRequest multiRequest) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		FileResult fileResult = null;
		
		try {
			String directory = "smarteditor";
			String editorDirectory = multiRequest.getParameter("editorDirectory");
			
			if(editorDirectory != null && editorDirectory.length() > 0) {
				directory += "/" + editorDirectory;
			}
			
			directory += "/" + sdf.format(new Date());
			
			fileResult = fileUtils.uploadFile(multiRequest, directory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileResult;
	}
}
