package com.itbank.navercafe.user.memo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.user.cafemember.service.CafeMemberService;
//import com.itbank.navercafe.comon.file.FileService;
import com.itbank.navercafe.user.memo.service.MemoService;



@Controller
@RequestMapping("/user/board")
public class MemoController {
	@Autowired MemoService memoSer;
	@Autowired CafeMemberService cafeMemberService;
	
	//@RequestParam(value="num",required=false,defaultValue="0")int num)
	//boardInside 방식참고해서 num 도 넣어주고
	
	@GetMapping("/goMemoBoardList")
	public String goMemoBoardList(String cafeId,Model model,HttpSession sesison){
		//메모 게시글들
		model.addAttribute("mapList",memoSer.getMemoList(cafeId));
		//System.out.println("메모 게시물들 키 :"+memoSer.getMemoList());
		//메모 댓글들
		model.addAttribute("memoReplyList",memoSer.getReplyList(cafeId));
		//System.out.println("메모 댓글 키 :"+memoSer.getReplyList());
		//세션 아이디 줘서 정보 가져오기
		model.addAttribute("sessionUser",cafeMemberService.getSessionUserInfo(cafeId,(String) sesison.getAttribute("loginId")));
		model.addAttribute("cafeId",cafeId);
		return "user/board/memoBoardList";
	}
	

	@PostMapping("saveMemoReply")
	public String saveReply(MultipartHttpServletRequest mul) {
//		System.out.println("그룹번호:"+mul.getParameter("groupNum"));
//		System.out.println("작성하고있는쉐끼:"+mul.getParameter("userId"));
//		System.out.println("내용:"+mul.getParameter("memoReplyContent"));
//		System.out.println("파일명:"+mul.getFile("replyImageName"));
//		System.out.println("cafeId : "+mul.getParameter("cafeId"));
		memoSer.saveMemoReply(mul);
		
		return "redirect:goMemoBoardList?cafeId="+mul.getParameter("cafeId");
	}
	
	@PostMapping("memoSave")
	public String memoSave(HttpServletRequest res) {
		memoSer.memoSave(res);
		return "redirect:goMemoBoardList";
	}
	
	

	 

}
