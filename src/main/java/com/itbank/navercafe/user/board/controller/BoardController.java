package com.itbank.navercafe.user.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.user.board.dto.BoardDTO;
import com.itbank.navercafe.user.board.service.BoardService;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafemember.service.CafeMemberService;
import com.itbank.navercafe.user.reply.service.ReplyService;

@Controller
@RequestMapping("/user/board")
public class BoardController {
	@Autowired BoardService ser;
	@Autowired ReplyService replySer;
	@Autowired CafeMemberService boardCafeSer;
	
	@RequestMapping("/writeForm")
	public String writeForm(CafeDTO cafeDTO, Model model) {
		model.addAttribute("cafeDTO", cafeDTO);
		return "user/board/writeForm";
	}
	//전체목록인데 수영이형이랑 상의.
	@GetMapping("/goBoardList")	
	public String goBoardList(Model model, String cafeId){
		System.out.println("보드 리스트 cafeId:"+cafeId);
		model.addAttribute("boardList",ser.getBoardList(cafeId));
		model.addAttribute("cafeId",cafeId);
		return "user/board/boardList";
	}

	@GetMapping("/goBoardInside")
	public String goBoardInside(int boardNum, Model model,HttpSession session,String cafeId,int boardMenuNum,
			@RequestParam(value="num",required=false,defaultValue="0")int num,
			@RequestParam(value="next",required=false,defaultValue="0")int next,
			@RequestParam(value="preview",required=false,defaultValue="0")int preview) {
//		System.out.println("넘어온 보드 값 : "+boardNum);
//		System.out.println("넘어온 boardMenuNum 값 :"+boardMenuNum);
//		System.out.println("next 값 : "+next);
//		System.out.println("preview 값 : "+preview);
		
		//System.out.println("boardInside실행");
		//System.out.println("cafeId:"+cafeId);
		
		//댓글 갯수 세오기
		model.addAttribute("replyCount",replySer.getReplyCount(boardNum));
		//System.out.println("댓글 갯수 세오기 컷");
		//게시물 가져오기
		BoardDTO dto= ser.getUserBoard(boardNum,boardMenuNum,model,num,cafeId,next,preview);
		model.addAttribute("userBoard",dto);
		//System.out.println("게시물 가져오기 컷");
		//카페유저 정보 가져오기
		model.addAttribute("cafeUserInfo",boardCafeSer.getCafeUserInfo(cafeId,dto.getUserId()));
		//위에있는거 2개 맵으로 가져와서 합쳐 줄 라고 했는데 clob이 문제가 생기네?
		//System.out.println("카페 유저 정보 가져오기 컷");
		//댓글 리스트 가져오기
		model.addAttribute("replyList",replySer.getReplyList(boardNum));
		//System.out.println(replySer.getReplyList(boardNum));
		//System.out.println("댓글 리스트 가져오기 컷");
		
		
		//세션 아이디 줘서 정보 가져오기
		model.addAttribute("sessionUser",boardCafeSer.getSessionUserInfo(cafeId,(String) session.getAttribute("loginId")));
		//System.out.println("세션 아디 줘서 정보 가져오기 컷");
		//조회수
		ser.hit(boardNum,num);
		//System.out.println("조회수 컷");
		//좋아요 되어있는지 여부
		ser.likeViewChk(boardNum, (String) session.getAttribute("loginId"), model);
		//System.out.println("좋아요 되있는지 여부 이상부");
		//인기글 리스트
		ser.topList(model);
		//System.out.println("인기글 리스트 이상무");
		//파일테이블리스트
		ser.getFileList(model);
		//System.out.println("파일 테이블 리스트 이상무");

		return "user/board/boardInside";
	}

	
//	댓글, 답글 step으로 식별하기
	@PostMapping("saveReply")
	public String saveReply(MultipartHttpServletRequest mul,
		@RequestParam(value="step",required=false,defaultValue="0")int step) {
		replySer.saveReply(mul,step);
		return "redirect:goBoardInside?boardNum="
				+mul.getParameter("boardNum")+"&num="+1+
				"&boardMenuNum="+mul.getParameter("boardMenuNum")+"&cafeId="+mul.getParameter("cafeId");
	//댓글 작성시 조회수 오르는거 방지
	}
	
	@GetMapping("likeChk")
	public String likeChk(int boardNum,String userId,Model model) {
		System.out.println("컨트롤러 : "+boardNum+" - "+userId);
		ser.likeChk(boardNum,userId,model);
		return "redirect:goBoardInside?boardNum="+boardNum+"&num="+1;
	}
	
	
	
}
