package com.itbank.navercafe.user.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.common.CommonUtils;
import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.dto.FileResult;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.user.reply.dto.ReplyDTO;
import com.itbank.navercafe.user.reply.service.ReplyService;


@Controller
@RequestMapping("/user/reply")
public class ReplyController {
	@Autowired ReplyService replySer;
	@Autowired
	private FileService fileService;
	@Autowired
	private FileUtils fileUtils;

	@PostMapping(value="writeReply", produces="application/json; charset=UTF-8")
	@ResponseBody
	public int writeReply(MultipartHttpServletRequest multiRequest) {
		int result = 0;
		
		try {
			CommonUtils commonUtils = new CommonUtils();
			ReplyDTO replyDTO = new ReplyDTO();
			MultipartFile replyImage = multiRequest.getFile("replyImage");
			int replyNum = replySer.getReplyNum();
			
			replyDTO = (ReplyDTO) commonUtils.setDTO(multiRequest, replyDTO);
			replyDTO.setReplyNum(replyNum);
			
			if(replyDTO.getReplyGroup() == 0) {
				replyDTO.setReplyGroup(replyNum);
			}
			
			if(replyImage != null && replyImage.getSize() > 0) {
				String cafeId = multiRequest.getParameter("cafeId");
				String userId = multiRequest.getParameter("userId");
				String directory = "reply/" + cafeId + "/" + userId;
				
				FileResult fileResult = fileUtils.uploadFile(replyImage, directory);
				
				if(fileResult.getState() == fileResult.SUCCESS) {
					FileDTO fileDTO = fileResult.getFileDTO();
					
					fileDTO.setReplyNum(replyNum);
					fileService.insertAttachFile(fileDTO);
				}
			}
			
			result = replySer.insertReply(replyDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
