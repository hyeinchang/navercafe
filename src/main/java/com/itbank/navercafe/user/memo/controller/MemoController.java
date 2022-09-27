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
	public String goMemoBoardList(Model model,HttpSession sesison){
		//메모 게시글들
		model.addAttribute("mapList",memoSer.getMemoList());
		//System.out.println("메모 게시물들 키 :"+memoSer.getMemoList());
		//메모 댓글들
		model.addAttribute("memoReplyList",memoSer.getReplyList());
		//System.out.println("메모 댓글 키 :"+memoSer.getReplyList());
		//세션 아이디 줘서 정보 가져오기
		model.addAttribute("sessionUser",cafeMemberService.getSessionUserInfo((String) sesison.getAttribute("loginId")));
		return "user/board/memoBoardList";
	}
	
	//	댓글, 답글 step으로 식별하기
	@PostMapping("saveMemoReply")
	public String saveReply(MultipartHttpServletRequest mul,
		@RequestParam(value="step",required=false,defaultValue="1")int step) {
												//답글에 답글 step 2로 해서 줘도 될 듯?
//		System.out.println("그룹번호:"+mul.getParameter("groupNum"));
//		System.out.println("넘겨준 스텝값:"+mul.getParameter("step"));
//		System.out.println("현재스텝값:"+step);
//		System.out.println("작성하고있는쉐끼:"+mul.getParameter("userId"));
//		System.out.println("내용:"+mul.getParameter("replyContent"));
//		System.out.println("파일명:"+mul.getFile("replyImageName"));

		memoSer.saveMemoReply(mul,step);
		return "redirect:goMemoBoardList";
	}
	
	@PostMapping("memoSave")
	public String memoSave(HttpServletRequest res) {
		memoSer.memoSave(res);
		return "redirect:goMemoBoardList";
	}
	
	

	 

}
