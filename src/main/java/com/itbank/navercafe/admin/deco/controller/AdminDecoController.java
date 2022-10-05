package com.itbank.navercafe.admin.deco.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.admin.deco.dto.AdminSkin;
import com.itbank.navercafe.admin.deco.service.AdminDecoService;
import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.dto.FileResult;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.service.CafeService;

@Controller
@RequestMapping("/admin/deco")
public class AdminDecoController {
	@Autowired
	private AdminDecoService adminDecoService;
	
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("frontdoor")
	public String frontdoor(HttpServletRequest request, CafeDTO cafeDTO, Model model) {
		try {			
			if(cafeDTO != null) {
				cafeDTO = cafeService.selectCafe(cafeDTO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cafeDTO", cafeDTO);
		
		return "admin/deco/frontdoor";
	}
	
	// 대문 저장
	@PostMapping(value="saveFront", produces="application/json; charset=utf8")
	@ResponseBody
	public int saveFront(@RequestBody CafeDTO cafeDTO) {
		int result = 0;
		
		try {
			result = adminDecoService.saveFront(cafeDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	// 스킨 설정 페이지로 이동
	@GetMapping("/skin")
	public String skin(CafeDTO cafeDTO, Model model) {
		AdminSkin skin =  new AdminSkin();
		ArrayList<String> skinList = null;
		
		try {
			if(cafeDTO != null) {
				cafeDTO = cafeService.selectCafe(cafeDTO);
			}
			
			if(cafeDTO.getCafeSkin() == null) {
				cafeDTO.setCafeSkin("default");
			}
			
			skinList = (ArrayList<String>) skin.getSkinList();
			
			model.addAttribute("skinList", skinList);
			model.addAttribute("cafeDTO", cafeDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "admin/deco/skin";
	}
	
	// 스킨 저장
	@PostMapping(value="saveSkin", produces="application/json; charset=utf8")
	@ResponseBody
	public int saveSkin(@RequestBody CafeDTO cafeDTO) {
		int result = 0;
		
		try {
			result = adminDecoService.saveSkin(cafeDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 타이틀 설정페이지로 이동
	@GetMapping("title")
	public String title(HttpServletRequest request, CafeDTO cafeDTO, Model model) {
		try {

			if(cafeDTO != null) {
				cafeDTO = cafeService.selectCafe(cafeDTO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cafeDTO", cafeDTO);
		
		return "admin/deco/title";
	}
	
	// 타이틀 저장
	@RequestMapping(value="saveTitle", produces="application/json; charset=utf8")
	@ResponseBody
	public int saveTitle(MultipartHttpServletRequest multiRequest) {
		MultipartFile multipartFile = multiRequest.getFile("titleImage");
		int result = 0;
		
		try {
			FileResult fileResult = null;
			FileDTO fileDTO = null;
			String directory = "title";
			String cafeId =  multiRequest.getParameter("cafeId");
			String titleNumStr = multiRequest.getParameter("cafeTitleNum");
	
			if(cafeId == null || cafeId.length() == 0) {
				return result;
			}
			
			directory += "/" + cafeId;
			
			if(titleNumStr == null || titleNumStr.length() == 0 || titleNumStr.equals("0")) {
				CafeDTO cafeDTO = new CafeDTO();
				int cafeTitleNum = cafeService.getTitleSeq();
				
				fileResult = fileUtils.uploadFile(multipartFile, directory);
				fileDTO = fileResult.getFileDTO();
				
				cafeDTO.setCafeId(cafeId);
				cafeDTO.setCafeTitleNum(cafeTitleNum);
				fileDTO.setCafeTitleNum(cafeTitleNum);
				
				int uploadFile = fileResult.getState();
				
				if(uploadFile == 1) {
					int updateCafe = adminDecoService.saveTitle(cafeDTO);
					
					if(updateCafe == 1) {
						result = fileService.insertAttachFile(fileDTO);
					}
				}
			} else {
				fileDTO = new FileDTO();
				fileDTO.setCafeTitleNum(Integer.parseInt(titleNumStr));
				
				fileResult = fileUtils.updateFile(multipartFile, fileDTO);
				result = fileResult.getState();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		
		return result;
	}

	@PostMapping("deleteTitle")
	public String deleteTitle(HttpServletRequest request, CafeDTO cafeDTO) {
		String cafeId ="";
		
		try {
			if(cafeDTO != null && cafeDTO.getCafeId() != null) {
				cafeId = cafeDTO.getCafeId();
				int cafeTitleNum = cafeDTO.getCafeTitleNum();
				FileDTO fileDTO = new FileDTO();
				
				cafeDTO.setCafeTitleNum(0);
				fileDTO.setCafeTitleNum(cafeTitleNum);
			
				fileUtils.deleteFile(fileDTO);
				adminDecoService.saveTitle(cafeDTO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/deco/title?cafeId="+cafeId;
	}
	
	@PostMapping(value="deleteFront", produces="application/json")
	@ResponseBody
	public int deleteFront(@RequestBody Map<String, String> paramMap) {
		int result = 0;

		try {
			CafeDTO cafeDTO = new CafeDTO();
			String editorDirectory = (String) paramMap.get("editorDirectory");
			
			cafeDTO.setCafeId(paramMap.get("cafeId"));

			fileUtils.deleteDirectory(editorDirectory);
			result = adminDecoService.saveFront(cafeDTO);
			//System.out.println( " editorDirectory :" + editorDirectory);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	// 레이아웃 설정 페이지로 이동
	@GetMapping("/layout")
	public String layout() {
		return "admin/deco/layout";
	}
	
	// 레이아웃 저장
	@PostMapping(value="saveLayout", produces="application/json; charset=utf8")
	@ResponseBody
	public int saveLayout(@RequestBody CafeDTO cafeDTO) {
		int result = 0;
		
		try {
			result = adminDecoService.saveLayout(cafeDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
