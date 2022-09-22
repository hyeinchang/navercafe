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
import org.springframework.web.bind.annotation.RequestMapping;

//import com.itbank.navercafe.comon.file.FileService;
import com.itbank.navercafe.user.memo.service.MemoService;



@Controller
@RequestMapping("/user/board")
public class MemoController {
	@Autowired MemoService memoSer;
	
	@GetMapping("/goMemoBoardList")
	public String goMemoBoardList(Model model){
		//메모 게시글들
		model.addAttribute("mapList",memoSer.getMemoList());
		System.out.println("메모 게시물들 키 :"+memoSer.getMemoList());
		//메모 댓글들
		model.addAttribute("memoReplyList",memoSer.getReplyList());
		System.out.println("메모 댓글 키 :"+memoSer.getReplyList());
		return "user/board/memoBoardList";
	}
	
	
//	 @GetMapping("download") 
//	 public void download(String file,HttpServletResponse res) throws Exception { 
//		 //System.out.println("받아온 파일"+file);
//		 res.addHeader("Content-disposition","attachment; fileName="+file); File f=new
//		 File(FileService.IMAGE_REPO+"/"+file); FileInputStream in = new
//		 FileInputStream(f); FileCopyUtils.copy(in, res.getOutputStream());
//		 in.close(); 
//	 }
	 

}
