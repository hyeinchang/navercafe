package com.itbank.navercafe.user.memo.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.TestFileService;
import com.itbank.navercafe.mybatis.cafemember.CafeMemberMapper;
import com.itbank.navercafe.mybatis.memo.MemoMapper;
import com.itbank.navercafe.user.cafemember.dto.TestFileDTO;
import com.itbank.navercafe.user.memo.dto.MemoDTO;
import com.itbank.navercafe.user.memo.dto.MemoReplyDTO;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;


@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoMapper memoMap;
	@Autowired CafeMemberMapper memoCafeMap;
	@Autowired TestFileService replyFileService;
	
	
	//메모 리스트
	@Override
	public List<HashMap<String, Object>> getMemoList() {
		List<HashMap<String, Object>>map=memoMap.getMemoList();

		for(int i=0; i<map.size();i++) {//댓글 갯수 구해와서 새로운 key 값에 값 부여
			map.get(i).put("REPLY_COUNT",memoMap.getReplyCount(map.get(i).get("MEMO_NUM")));
			//System.out.println(map.get(i).get("REPLY_COUNT"));
		}
		return map;
	}

	
	
	
	//메모 댓글 리스트
	@Override
	public List<HashMap<String, Object>> getReplyList() {
		return memoMap.getReplyList();
	}

	//메모 댓글 작성
	@Override
	public void saveMemoReply(MultipartHttpServletRequest mul, int step) {
		TestFileDTO tfd=new TestFileDTO();
		
		MemoReplyDTO dto = new MemoReplyDTO();
		
		dto.setUserId(mul.getParameter("userId"));
		dto.setMemoReplyContent(mul.getParameter("memoReplyContent"));
		dto.setMemoReplyStep(step);
//		System.out.println("순서:"+dto.getMemoReplyStep());
//		System.out.println("그룹번호 : "+mul.getParameter("groupNum"));
		
		MultipartFile file = mul.getFile("replyImgName");
		
		
//		System.out.println("(세션통해서)유저아이디:"+mul.getParameter("userId"));
//		System.out.println("내용:"+mul.getParameter("memoReplyContent"));
//		System.out.println("이미지파일 조건 여부:"+file.getSize());
		if(file.getSize()!=0) {
			int seq=memoCafeMap.getSequence();
			tfd.setFileNum(seq);
			tfd.setFileOrgName(replyFileService.saveFile(file));
			memoCafeMap.saveFileDTO(tfd);
		}
		//답글 작성시
		if(mul.getParameter("groupNum")!=null) {
			dto.setMemoReplyGroup(Integer.parseInt(mul.getParameter("groupNum")));
			memoMap.saveGroupNumReply(dto);
			memoCafeMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
		}else {//댓글 작성시	
			int result=memoMap.saveMemoReply(dto);
			if(result==1) {
				memoCafeMap.replyUp(mul.getParameter("userId"));//세션값 넘겨준거임
			}
		}
	}

	
	
	//메모 작성시
	@Override
	public void memoSave(HttpServletRequest res) {
		//System.out.println(res.getParameter("userId"));
		//System.out.println(res.getParameter("memoContent"));
		//System.out.println(res.getParameter("checkbox"));
		MemoDTO dto=new MemoDTO();
		dto.setUserId(res.getParameter("userId"));
		dto.setMemoContent(res.getParameter("memoContent"));
		if(res.getParameter("checkbox")==null) {
			dto.setMemoStepOnly("N");
		}else {
			dto.setMemoStepOnly("Y");
		}
		memoMap.memoSave(dto);
	}
	
	

}
