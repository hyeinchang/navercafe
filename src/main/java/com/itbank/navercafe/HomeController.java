package com.itbank.navercafe;

import java.lang.reflect.Field;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.common.CommonUtils;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.service.CafeService;
import com.itbank.navercafe.user.cafeJoin.CafeJoinQuestionDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CafeService cafeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		String url = "home";
		url = "index";
		
		String contextPath = request.getContextPath();
		
		ArrayList<CafeDTO> cafeList = new ArrayList<>();
		ArrayList<CafeDTO> rankingList = new ArrayList<>();
		
		for(int i=0; i<10; i++) {
			CafeDTO cafe = new CafeDTO();
			int order = i+1;
			String skin = "";
			cafe.setCafeId("cafeId" + order);
			cafe.setCafeName("테스트 카페" + order);
			cafe.setCafeExplanation("테스트 카페"+ order +"(cafeId: cafeId" + order + ")에 대한 소개입니다.");
		
			
			switch(order) {
			case 1 : skin = "asphalt";
				break;
			case 2 : skin = "blue";
				break;
			case 3 : skin = "brown";
				break;
			case 4 : skin = "mustard";
				break;
			case 5 : skin = "pomegranate";
				break;
			case 6 : skin = "turquoise";
				break;
			case 7 : skin = "yellow";
				break;
			}
			
			cafeList.add(cafe);
			
			if(order <= 3) {
				rankingList.add(cafe);
			}
		}
		
		model.addAttribute("cafeList" , cafeList);
		model.addAttribute("rankingList" , rankingList);
		
		return url;
	}
	
	@GetMapping("/cafe/createCafeForm")
	public String createCafeForm() {
		return "cafe/createCafeForm";
	}
	
	@PostMapping(value="/cafe/createCafe", produces="application/json")
	@ResponseBody
	public int createCafe(MultipartHttpServletRequest multiRequest) {
		int result = 0;
		
		try {
			CommonUtils commonUtils = new CommonUtils();
			CafeDTO cafeDTO = new CafeDTO();
			String cafeId = null;
		
			commonUtils.setMultirequestToDTO(multiRequest, cafeDTO);
			
			cafeId = cafeDTO.getCafeId();
			
			if(cafeId == null) {
				return result;
			}
			
			System.out.println("cafeId : " + cafeId);
			
			int cafeResult = cafeService.InsertCafe(cafeDTO);
			
			// 카페가입질문 설정
			String questionFlag = multiRequest.getParameter("cafeJoinQuestion");
			String questions[] = multiRequest.getParameterValues("cafeQuestionContent");
			
			if(questionFlag != null && questionFlag.equals("Y") && questions != null) {
				for(int i=0;i<questions.length;i++) {
					CafeJoinQuestionDTO questionDTO = new CafeJoinQuestionDTO();
					String question = questions[i];
					int order = i+1;
					
					if(question.length() == 0) {
						continue;
					}
					
					questionDTO.setCafeId(cafeId);
					questionDTO.setCafeQuestionNum(order);
					questionDTO.setCafeQuestionContent(question);
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GetMapping(value="/cafe/checkCafeId", produces="application/json")
	@ResponseBody
	public int checkCafeId(String cafeId) {
		int idCount = 0;

		try {
			idCount = cafeService.checkCafeId(cafeId);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return idCount;
	}
}
