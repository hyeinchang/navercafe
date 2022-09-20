package com.itbank.navercafe.user.memo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

import com.itbank.navercafe.comon.file.FileService;
import com.itbank.navercafe.user.memo.service.MemoService;



@Controller
public class MemoController {
	@Autowired MemoService memoSer;
	
	@GetMapping("goMemoBoardList")
	public String goMemoBoardList(Model model){
		model.addAttribute("mapList",memoSer.getMemoList());
		return "board/memoBoardList";
	}
	
	
	 @GetMapping("download") 
	 public void download(String file,HttpServletResponse res) throws Exception { 
		 //System.out.println("받아온 파일"+file);
		 res.addHeader("Content-disposition","attachment; fileName="+file); File f=new
		 File(FileService.IMAGE_REPO+"/"+file); FileInputStream in = new
		 FileInputStream(f); FileCopyUtils.copy(in, res.getOutputStream());
		 in.close(); 
	 }
	 

}
