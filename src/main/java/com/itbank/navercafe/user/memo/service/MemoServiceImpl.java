package com.itbank.navercafe.user.memo.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.dto.FileResult;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.user.cafemember.mapper.CafeMemberMapper;
import com.itbank.navercafe.user.memo.dto.MemoDTO;
import com.itbank.navercafe.user.memo.dto.MemoReplyDTO;
import com.itbank.navercafe.user.memo.mapper.MemoMapper;


@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoMapper memoMap;
	@Autowired CafeMemberMapper memoCafeMap;
	@Autowired FileService fs;
	@Autowired private FileUtils fileUtils;
	
	
	//메모 리스트
	@Override
	public List<HashMap<String, Object>> getMemoList(String cafeId) {
		List<HashMap<String, Object>>map=memoMap.getMemoList(cafeId);

		for(int i=0; i<map.size();i++) {//댓글 갯수 구해와서 새로운 key 값에 값 부여
			map.get(i).put("REPLY_COUNT",memoMap.getReplyCount(map.get(i).get("MEMO_NUM")));
			//System.out.println(map.get(i).get("REPLY_COUNT"));
		}
		return map;
	}

	
	
	
	//메모 댓글 리스트
	@Override
	public List<HashMap<String, Object>> getReplyList(String cafeId) {
		return memoMap.getReplyList(cafeId);
	}

	//메모 댓글 작성
	@Override
	public void saveMemoReply(MultipartHttpServletRequest mul) {
		MultipartFile multipartFile = mul.getFile("replyImgName");
		try {
			String directory = "memoReply";
			String userId =  mul.getParameter("userId");
//			System.out.println("userId : " + userId);
//			System.out.println("replyImgName : " + multipartFile.getOriginalFilename());
			
			if(userId != null && userId.length() > 0) {
				directory += "/" + userId;
			}
//			System.out.println("directory >>>> " + directory);
			
			//memo_reply_num_seq
			int seq=memoMap.getMemoReplyNumSeq();
	
			MemoReplyDTO dto = new MemoReplyDTO();
			dto.setMemoReplyGroup(Integer.parseInt(mul.getParameter("groupNum")));
//			System.out.println("댓글을 작성할 메모 게시글 번호 : "+Integer.parseInt(mul.getParameter("groupNum")));
			dto.setUserId(mul.getParameter("userId"));
			dto.setMemoReplyContent(mul.getParameter("memoReplyContent"));
			dto.setMemoReplyNum(seq);
//			System.out.println("memoreplyNum을 생성할 번호 :"+seq);
			
			if(multipartFile.getSize()!=0) {
				FileDTO fileDTO = null;
				FileResult fileResult = fileUtils.uploadFile(multipartFile, directory);
				fileDTO = fileResult.getFileDTO();
				fileDTO.setMemoReplyNum(seq);
				fs.insertAttachFile(fileDTO);
			}
			memoMap.saveMemoReply(dto);
			memoCafeMap.replyUp(mul.getParameter("cafeId"),mul.getParameter("userId"));
		} catch (Exception e) {
			e.printStackTrace();
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
