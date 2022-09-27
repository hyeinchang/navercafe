package com.itbank.navercafe.user.reply.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.TestFileService;
//import com.itbank.navercafe.comon.file.FileService;
import com.itbank.navercafe.mybatis.cafemember.CafeMemberMapper;
import com.itbank.navercafe.mybatis.reply.ReplyMapper;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;



@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired ReplyMapper rm;
	@Autowired TestFileService replyFileService;
	@Autowired CafeMemberMapper cafeMemberMap;
	
	@Override
	public Integer getReplyCount(int boardNum) {
		//System.out.println("board에서 넘겨준 : "+boardNum);
		int result=rm.getReplyCount(boardNum);
		//System.out.println("그래서 갯수는? : "+result);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> getReplyList(int boardNum) {
		return rm.getReplyList(boardNum);
	}

	@Override
	public void saveReply(MultipartHttpServletRequest mul,int step) {
		TestFileDTO tfd=new TestFileDTO();
		
		ReplyDTO dto = new ReplyDTO();
		dto.setBoardNum(Integer.parseInt(mul.getParameter("boardNum")));
		dto.setUserId(mul.getParameter("userId"));
		dto.setReplyContent(mul.getParameter("replyContent"));
		dto.setReplyStep(step);
		//System.out.println("순서:"+dto.getReplyStep());
		//System.out.println("그룹번호 : "+mul.getParameter("groupNum"));
		
		MultipartFile file = mul.getFile("replyImgName");
		
//		System.out.println("보드번호:"+Integer.parseInt(mul.getParameter("boardNum")));
//		System.out.println("(세션통해서)유저아이디:"+mul.getParameter("userId"));
//		System.out.println("내용:"+mul.getParameter("replyContent"));
//		System.out.println("이미지파일:"+file);
//		System.out.println("이미지파일 조건 여부:"+file.getSize());
		if(file.getSize()!=0) {
			int seq=cafeMemberMap.getSequence();
			dto.setReplyImgName(seq);
			tfd.setFileNum(seq);
			tfd.setFileOrgName(replyFileService.saveFile(file));
			//System.out.println("얘가 실행 되면 안되는데");
			cafeMemberMap.saveFileDTO(tfd);
		}
		//답글 작성시
		if(mul.getParameter("groupNum")!=null) {
			dto.setReplyGroup(Integer.parseInt(mul.getParameter("groupNum")));
			rm.saveGroupNumReply(dto);
			cafeMemberMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
		}else {//댓글 작성시	
			int result=rm.saveReply(dto);
			if(result==1) {
				cafeMemberMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
			}
		}
		
	}
	

}
