package com.itbank.navercafe.user.reply.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.dto.FileResult;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.user.cafemember.mapper.CafeMemberMapper;
import com.itbank.navercafe.user.menu.dto.MenuDTO;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;
import com.itbank.navercafe.user.reply.mapper.ReplyMapper;



@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired ReplyMapper rm;
	@Autowired CafeMemberMapper cafeMemberMap;
	@Autowired FileService fs;
	@Autowired
	private FileUtils fileUtils;
	@Autowired
	private FileService fileService;
	
	
	@Override
	public Integer getReplyCount(int boardNum) {
		//System.out.println("board에서 넘겨준 : "+boardNum);
		int result=rm.getReplyCount(boardNum);
		//System.out.println("그래서 갯수는? : "+result);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> getReplyList(int boardNum,String cafeId) {
		return rm.getReplyList(boardNum,cafeId);
	}

	
	@Override
	public void saveReply(MultipartHttpServletRequest mul,int step) {
		MultipartFile multipartFile = mul.getFile("replyImgName");
		int result = 0;
		try {
			//생성할 디렉토리
			String directory = "boardReply";
			String userId =  mul.getParameter("userId");
			
//			System.out.println("userId : " + userId);
//			System.out.println("replyImgName : " + multipartFile.getOriginalFilename());
			
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
//			System.out.println("들어갈 보드넘 :"+redto.getBoardNum());
//			System.out.println("들어갈 유저아이디 :"+redto.getUserId());
//			System.out.println("들어갈 내용 :"+redto.getReplyContent());
//			System.out.println("들어갈 스탭 :"+redto.getReplyStep());
//			System.out.println("들어갈 댓글넘버 :"+redto.getReplyNum());
			System.out.println("directory >>>> " + directory);
			if(multipartFile.getSize()!=0) {
				FileDTO fileDTO = null;
				FileResult fileResult = fileUtils.uploadFile(multipartFile, directory);
				fileDTO = fileResult.getFileDTO();
				fileDTO.setReplyNum(seq);
				fs.insertAttachFile(fileDTO);
			}
			System.out.println("댓글인지 답글인지 판단할 그룹번호 : "+mul.getParameter("groupNum"));
			//답글 작성시
			if(mul.getParameter("groupNum")!=null) {
				redto.setReplyGroup(Integer.parseInt(mul.getParameter("groupNum")));
				rm.saveGroupNumReply(redto);
				cafeMemberMap.replyUp(mul.getParameter("cafeId"),mul.getParameter("userId"));//세션값 넘겨준거임
			}else {//댓글 작성시	
				int saveResult=rm.saveReply(redto);
				if(saveResult==1) {
					cafeMemberMap.replyUp(mul.getParameter("cafeId"),mul.getParameter("userId"));//세션값 넘겨준거임
				}
			}

		} catch(Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public int getReplyNum() throws Exception {
		int replyNum = 0;
		
		try {
			replyNum = rm.getReplyNum();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return replyNum;
	}

	@Override
	public int insertReply(ReplyDTO replyDTO) throws Exception {
		int result = 0;
		
		try {
			if(replyDTO.getReplyParent() > 0) {
				int replyStep = rm.getMaxStep(replyDTO);
				
				if(replyStep > 0) {
					replyDTO.setReplyStep(replyStep);
				}
			}
			rm.updateReplyStep(replyDTO);
			result = rm.insertReply(replyDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ReplyDTO> getSearchReplyList(MenuDTO menuDTO) throws Exception {
		List<ReplyDTO> replyList = null;
		
		try {
			replyList = rm.getSearchReplyList(menuDTO);
			
			// 첨부파일 설정
			for(ReplyDTO replyDTO : replyList) {
				List<FileDTO> fileList = new ArrayList<>();
				FileDTO fileDTO = new FileDTO();
				
				fileDTO.setReplyNum(replyDTO.getReplyNum());
				fileList = fileService.getFileList(fileDTO);
				
				if(fileList != null) {
					replyDTO.setFileList(fileList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return replyList;
	}

	@Override
	public List<ReplyDTO> getBoardReplyList(int boardNum) throws Exception {
		List<ReplyDTO> replyList = null;
		try {
			replyList = rm.getBoardReplyList(boardNum);
			
			// 첨부파일 설정
			for(ReplyDTO replyDTO : replyList) {
				List<FileDTO> fileList = new ArrayList<>();
				FileDTO fileDTO = new FileDTO();
				
				fileDTO.setReplyNum(replyDTO.getReplyNum());
				fileList = fileService.getFileList(fileDTO);
				
				if(fileList != null) {
					replyDTO.setFileList(fileList);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return replyList;
	}

	@Override
	public int deleteReplyList(int boardNum) throws Exception {
		int result = 0;
		try {
			// 첨부파일 삭제
			List<ReplyDTO> replyList = rm.getBoardReplyList(boardNum);
			for(ReplyDTO replyDTO : replyList) {
				FileDTO fileDTO = new FileDTO();
				
				fileDTO.setReplyNum(replyDTO.getReplyNum());
				fileUtils.deleteFile(fileDTO);
			}
			
			result = rm.deleteReplyList(boardNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteReply(ReplyDTO replyDTO) throws Exception {
		int result = 0;
		try {
			int replyNum = replyDTO.getReplyNum();
			// 첨부파일 삭제
			FileDTO fileDTO = new FileDTO();
			fileDTO.setReplyNum(replyNum);
			fileUtils.deleteFile(fileDTO);
			
			// 정렬
			rm.updateReplyStep_minus(replyDTO);
			
			result = rm.deleteReply(replyNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateReply(ReplyDTO replyDTO) throws Exception {
		int result = 0;
		try {
			result = rm.updateReply(replyDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
