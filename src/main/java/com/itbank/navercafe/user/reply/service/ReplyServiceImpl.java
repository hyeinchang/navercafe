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

import com.itbank.navercafe.comon.file.FileUtils;
import com.itbank.navercafe.comon.file.dto.FileDTO;
import com.itbank.navercafe.comon.file.dto.FileResult;
import com.itbank.navercafe.comon.file.service.FileService;
import com.itbank.navercafe.user.cafemember.mapper.CafeMemberMapper;

import com.itbank.navercafe.user.reply.dto.ReplyDTO;
import com.itbank.navercafe.user.reply.mapper.ReplyMapper;



@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired ReplyMapper rm;
	@Autowired CafeMemberMapper cafeMemberMap;
	@Autowired FileService fs;
	@Autowired
	private FileUtils fileUtils;
	
	
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

//	@Override
//	public void saveReply(MultipartHttpServletRequest mul,int step) {
//		TestFileDTO tfd=new TestFileDTO();
//		
//		ReplyDTO dto = new ReplyDTO();
//		dto.setBoardNum(Integer.parseInt(mul.getParameter("boardNum")));
//		dto.setUserId(mul.getParameter("userId"));
//		dto.setReplyContent(mul.getParameter("replyContent"));
//		dto.setReplyStep(step);
//		//System.out.println("순서:"+dto.getReplyStep());
//		//System.out.println("그룹번호 : "+mul.getParameter("groupNum"));
//		
//		MultipartFile file = mul.getFile("replyImgName");
//		
////		System.out.println("보드번호:"+Integer.parseInt(mul.getParameter("boardNum")));
////		System.out.println("(세션통해서)유저아이디:"+mul.getParameter("userId"));
////		System.out.println("내용:"+mul.getParameter("replyContent"));
////		System.out.println("이미지파일:"+file);
////		System.out.println("이미지파일 조건 여부:"+file.getSize());
//		if(file.getSize()!=0) {
//			int seq=cafeMemberMap.getSequence();
//			//dto.setReplyImgName(seq);
//			tfd.setFileNum(seq);
//			tfd.setFileOrgName(replyFileService.saveFile(file));
//			//System.out.println("얘가 실행 되면 안되는데");
//			cafeMemberMap.saveFileDTO(tfd);
//		}
//		//답글 작성시
//		if(mul.getParameter("groupNum")!=null) {
//			dto.setReplyGroup(Integer.parseInt(mul.getParameter("groupNum")));
//			rm.saveGroupNumReply(dto);
//			cafeMemberMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
//		}else {//댓글 작성시	
//			int result=rm.saveReply(dto);
//			if(result==1) {
//				cafeMemberMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
//			}
//		}
//		
//	}
	
	@Override
	public void saveReply(MultipartHttpServletRequest mul,int step) {
		HashMap<Object, Object> map = new HashMap<>();
		MultipartFile multipartFile = mul.getFile("replyImgName");
		int result = 0;
		try {
			//생성할 디렉토리
			String directory = "boardReply";
			String userId =  mul.getParameter("userId");
			
			System.out.println("userId : " + userId);
			System.out.println("replyImgName : " + multipartFile.getOriginalFilename());
			
			if(userId != null && userId.length() > 0) {
				directory += "/" + userId;
			}
			
			//reply_num 빼오기
			int seq=rm.getReplyNum();


			ReplyDTO redto=new ReplyDTO();
			redto.setBoardNum(Integer.parseInt(mul.getParameter("boardNum")));
			redto.setUserId(mul.getParameter("userId"));
			redto.setReplyContent(mul.getParameter("replyContent"));
			redto.setReplyStep(step);
			redto.setReplyNum(seq);
			System.out.println("들어갈 보드넘 :"+redto.getBoardNum());
			System.out.println("들어갈 유저아이디 :"+redto.getUserId());
			System.out.println("들어갈 내용 :"+redto.getReplyContent());
			System.out.println("들어갈 스탭 :"+redto.getReplyStep());
			System.out.println("들어갈 댓글넘버 :"+redto.getReplyNum());
			
			FileDTO fileDTO = null;
			FileResult fileResult = fileUtils.uploadFile(multipartFile, directory);
			fileDTO = fileResult.getFileDTO();
			fileDTO.setProfileNum(seq);
			fs.insertAttachFile(fileDTO);
			System.out.println("댓글인지 답글인지 판단할 그룹번호 : "+mul.getParameter("groupNum"));
			//답글 작성시
			if(mul.getParameter("groupNum")!=null) {
				redto.setReplyGroup(Integer.parseInt(mul.getParameter("groupNum")));
				rm.saveGroupNumReply(redto);
				cafeMemberMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
			}else {//댓글 작성시	
				int saveResult=rm.saveReply(redto);
				if(saveResult==1) {
					cafeMemberMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
				}
			}

		} catch(Exception e) {
			e.printStackTrace();
		}
	
		result = 1;
		
		map.put("result", result);

	}



}
