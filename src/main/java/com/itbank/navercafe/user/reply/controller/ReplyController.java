package com.itbank.navercafe.user.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.itbank.navercafe.user.reply.service.ReplyService;


@Controller
public class ReplyController {
	@Autowired ReplyService replySer;

	
	

}
