package com.itbank.navercafe.comon.file.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.comon.file.FileUtils;

@Controller
@RequestMapping("/file")
public class FileController {
	@Autowired
	private FileUtils fileUtils;

	
	@GetMapping("/download")
	public void download(HttpServletResponse response, String fileName) {
		response.setHeader("Content-Disposition", "attachment; fileName=" + fileName);
		try {
			fileUtils.download(response, "test", fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
