package com.itbank.navercafe;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.common.CommonUtils;
import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.dto.FileResult;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.common.pagination.Pagination;
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
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, CafeDTO cafeDTO, Pagination pagination, Model model) {
		String url = "index";
		ArrayList<CafeDTO> rankingList = new ArrayList<>();
		List<CafeDTO> cafeList = new ArrayList<>();

		try {
			int totalCafeCount = cafeService.selectCafeListTotalCount(cafeDTO);
			int page = pagination.getPage();
			
			if(page == 0) {
				page = 1;
			}
			
			pagination.setPageination(page, totalCafeCount);
			cafeList = cafeService.selectCafeList(cafeDTO, pagination);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cafeDTO" , cafeDTO);
		model.addAttribute("pagination" , pagination);
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
			MultipartFile iconImage = multiRequest.getFile("iconImage");
			commonUtils.setMultirequestToDTO(multiRequest, cafeDTO);
			
			cafeId = cafeDTO.getCafeId();
			
			if(cafeId == null) {
				return result;
			}
			
			if(iconImage != null) {
				FileResult fileResult = fileUtils.uploadFile(iconImage, "icon/" + cafeId);
				FileDTO fileDTO = fileResult.getFileDTO();
				int cafeIconNum = cafeService.getIconSeq();
				
				fileDTO.setCafeIconNum(cafeIconNum);
				cafeDTO.setCafeIconNum(cafeIconNum);
				
				fileService.insertAttachFile(fileDTO);
			}

			result = cafeService.InsertCafe(cafeDTO);
			
			if(result == 0) {
				return result;
			}
			
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
