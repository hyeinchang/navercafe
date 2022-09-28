package com.itbank.navercafe.user.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.service.FileService;
import com.itbank.navercafe.user.reply.service.ReplyService;


@Controller
public class ReplyController {
	@Autowired ReplyService replySer;
	@Autowired FileService fs;
	//	댓글, 답글 step으로 식별하기
	@PostMapping("saveReply")
	public String saveReply(MultipartHttpServletRequest mul,
		@RequestParam(value="step",required=false,defaultValue="0")int step) {
		replySer.saveReply(mul,step);
		return "redirect:goBoardInside?boardNum="
				+mul.getParameter("boardNum")+"&num="+1;
							//댓글 작성시 조회수 오르는거 방지
	}
	
	
	
	
	
	

}
