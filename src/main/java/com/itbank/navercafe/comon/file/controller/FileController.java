package com.itbank.navercafe.comon.file.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.comon.file.FileUtils;
import com.itbank.navercafe.comon.file.dto.FileDTO;
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
}
