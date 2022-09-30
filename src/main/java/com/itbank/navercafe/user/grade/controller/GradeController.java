package com.itbank.navercafe.user.grade.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.navercafe.user.grade.service.GradeService;



@Controller
@RequestMapping("/user/board")
public class GradeController {
	@Autowired GradeService upSer;
	
	@GetMapping("/goGradeBoardList")
	public String goGradeBoardList(Model model) {
		upSer.getGradeList(model);
		return "user/board/gradeBoardList";
	}
}
