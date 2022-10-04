package com.itbank.navercafe.user.cafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.navercafe.common.CommonUtils;
import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.dto.FileResult;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.service.CafeService;
import com.itbank.navercafe.user.cafemember.dto.CafeJoinAnswerDTO;
import com.itbank.navercafe.user.cafemember.dto.CafeMemberDTO;
import com.itbank.navercafe.user.cafemember.service.CafeMemberService;
import com.itbank.navercafe.user.member.service.MemberService;
import com.itbank.navercafe.user.menu.service.MenuService;

@Controller
@RequestMapping("/user")
public class CafeController {
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private FileService fileService;
	
	@Autowired MemberService ms;
	@Autowired CafeMemberService cms;
	
	@GetMapping("/main")
	public String main(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
		if(request.getParameter("cafeId") == null) {
			redirectAttributes.addFlashAttribute("message", "해당 카페가 없습니다.");
			return "redirect:/";
		}
		
		return "user/main";
	}
	
	@GetMapping("cafeSignup")  //카페 회원가입 페이지 이동
	public String cafeSignup() {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/cafeSignup";
	}
	
	@PostMapping(value="cafeRegApp", produces="application/json") //카페 회원가입
	@ResponseBody
	public int cafeReg(MultipartHttpServletRequest multiRequest) {
		int result = 0;
		
		try {
			MultipartFile profileImage = multiRequest.getFile("profileImage");
			CommonUtils commonUtils = new CommonUtils();
			CafeMemberDTO cafeMemberDTO = new CafeMemberDTO();
			String[] cafeAnswerContents = multiRequest.getParameterValues("cafeAnswerContent");
			String cafeId = "";
			String userId = "";
			
			cafeMemberDTO = (CafeMemberDTO) commonUtils.setDTO(multiRequest, cafeMemberDTO);
			cafeId = cafeMemberDTO.getCafeId();
			userId = cafeMemberDTO.getUserId();
			
			if(profileImage != null && profileImage.getSize() > 0) {
			
				
				String directory = "profile/" +  cafeId + "/" + userId;
				FileResult fileResult = fileUtils.uploadFile(profileImage, directory);
				
				if(fileResult.getState() == fileResult.SUCCESS) {
					FileDTO fileDTO = fileResult.getFileDTO();
					int cafeUserImageNum = cms.getUserImageSeq();
					
					cafeMemberDTO.setCafeUserImageNum(cafeUserImageNum);
					fileDTO.setCafeUserImageNum(cafeUserImageNum);
					
					fileService.insertAttachFile(fileDTO);
				}
			}
			
			result = cms.signup(cafeMemberDTO);
			
			if(cafeAnswerContents != null && cafeAnswerContents.length > 0) {
				for(int i=0;i<cafeAnswerContents.length;i++) {
					CafeJoinAnswerDTO cafeJoinAnswerDTO = new CafeJoinAnswerDTO();
					int order = i+1;
					
					cafeJoinAnswerDTO.setCafeId(cafeId);
					cafeJoinAnswerDTO.setUserId(userId);
					cafeJoinAnswerDTO.setCafeQuestionNum(order);
					cafeJoinAnswerDTO.setCafeAnswerContent(cafeAnswerContents[i]);
					
					cms.insertJoinAnswer(cafeJoinAnswerDTO);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}
	
	@GetMapping("profileUpdate") // 회원정보수정창 이동 + 개인정보
	public String profileUpdate() {
		return "user/profileUpdate";
	}
	
	@PostMapping("profilesubmit") // 회원정보수정
	public String profilesubmit(CafeMemberDTO dto) {
		int result = cms.cafeMemberUpdate(dto);
		if(result == 1) {
			
			return "redirect:/user/main?cafeId="+dto.getCafeId();
		}
		
		return "redirect:/user/main?cafeId="+dto.getCafeId();
	}
	
	@PostMapping("profilesubmit2")
	public String profilesubmit2(MultipartHttpServletRequest mul) {
		System.out.println();
		int result = cms.cafeMemberUpdate(mul);
		if(result == 1 ) {
			
			return "redirect:/user/main?cafeId="+mul.getParameter("cafeId");
		}
		return "redirect:/user/main?cafeId="+mul.getParameter("cafeId");
		
	}
	
	//@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	@PostMapping(value = "/nickCheck") // 카페회원정보수정 닉네임 체크
	public @ResponseBody String nickCheck(@RequestParam("oldNick") String oldNick,@RequestParam("id") String cafeUserNickname, @RequestParam("cafeId")String cafeId) {
		String result = cms.idOverlap(cafeUserNickname,cafeId, oldNick);
		
		return result;
	}
	@PostMapping(value = "/nickCheck2") // 카페 회원가입 닉네임 체크
	public @ResponseBody String nickCheck2(@RequestParam("id") String cafeUserNickname, @RequestParam("cafeId")String cafeId) {
		String result = cms.idOverlap(cafeUserNickname,cafeId);
		
		return result;
	}
	
	//게시글 더 보러가기
	@GetMapping("userViewList")
	public String userViewList(String cafeId,String userId,Model model) {
		cms.getUserViewList(cafeId,userId,model);
		return "board/userViewList";
	}
	
	@GetMapping("cafeInformation")
	public String cafeInformation() {
		return "user/cafeInformation";
	}
}
