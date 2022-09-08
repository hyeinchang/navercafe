package com.itbank.navercafe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
			cafe.setCafeIntroduce("테스트 카페"+ order +"(cafeId: cafeId"+ order +")에 대한 소개입니다.");
			cafe.setCafeTitle(contextPath + "/resources/upload/free-icon-joy-7021182.png");
			
			switch(order) {
			case 1 : skin = "asphalt";
				cafe.setCafeTitle(request.getContextPath() + "/resources/upload/demo_01.jpg");
				break;
			case 2 : skin = "blue";
				cafe.setCafeTitle(request.getContextPath() + "/resources/upload/1794220617_XSpkAiBo_pexels-eberhard-grossgasteiger-1287142.jpg");
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
}
