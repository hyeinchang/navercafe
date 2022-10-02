package com.itbank.navercafe.admin.cafemanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.admin.cafemanager.service.AdminCafeManagerService;
import com.itbank.navercafe.common.file.FileUtils;
import com.itbank.navercafe.common.file.dto.FileDTO;
import com.itbank.navercafe.common.file.dto.FileResult;
import com.itbank.navercafe.common.file.service.FileService;
import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.service.CafeService;

@Controller
@RequestMapping("admin")
public class AdminCafeManageController {
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private FileUtils fileUtils;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private AdminCafeManagerService cafeManagerService;
	
	@GetMapping("basicInfo")
	public String basicInfo(CafeDTO cafeDTO) {
		return "admin/cafeManage/basicInfo";
	}
	
	@PostMapping(value="saveCafeBasic", produces="application/json; charset=utf-8")
	@ResponseBody
	public int saveCafeBasic(MultipartHttpServletRequest multiRequest) {
		int result = 0;
		
		try {
			CafeDTO cafeDTO = new CafeDTO();
			String cafeId = multiRequest.getParameter("cafeId");
			String cafeName = multiRequest.getParameter("cafeName");
			String cafeExplanation = multiRequest.getParameter("cafeExplanation");
			String cafeIconNumStr = multiRequest.getParameter("cafeIconNum");
			String iconDelete = multiRequest.getParameter("iconDelete");
			
			cafeDTO.setCafeId(cafeId);
			cafeDTO.setCafeName(cafeName);
			cafeDTO.setCafeExplanation(cafeExplanation);
			
			if("Y".equals(iconDelete)) {
				if(cafeIconNumStr.length() > 0) {
					FileDTO fileDTO = new FileDTO();
					int cafeIconNum = Integer.parseInt(cafeIconNumStr);
					
					fileDTO.setCafeIconNum(cafeIconNum);
					fileUtils.deleteFile(fileDTO);
					cafeDTO.setCafeIconNum(0);
				}
			} else {
				MultipartFile iconImage = multiRequest.getFile("iconImage");
				String orgFileName = iconImage.getOriginalFilename();
				
				if(iconImage != null && orgFileName != null && orgFileName.length() > 0) {
					FileDTO fileDTO = new FileDTO();
					
					if(cafeIconNumStr.length() > 0 && Integer.parseInt(cafeIconNumStr) > 0) {
						int cafeIconNum = Integer.parseInt(cafeIconNumStr);
						
						fileDTO.setCafeIconNum(cafeIconNum);
						cafeDTO.setCafeIconNum(cafeIconNum);
						
						fileUtils.updateFile(iconImage, fileDTO);
					} else {
						FileResult fileResult = fileUtils.uploadFile(iconImage, "icon/" + cafeId);
						fileDTO = fileResult.getFileDTO();
						int cafeIconNum = cafeService.getIconSeq();
						
						fileDTO.setCafeIconNum(cafeIconNum);
						cafeDTO.setCafeIconNum(cafeIconNum);
						
						fileService.insertAttachFile(fileDTO);
					}
				}
			}
			
			result = cafeManagerService.updateBasicInfo(cafeDTO);	
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("eventManage") 
	public String eventManage() {
		return "admin/cafeManage/eventManage";
	}
	
	@GetMapping("layoffManager")
	public String layoffManager() {
		return "admin/cafeManage/layoffManager";
	}
	
	@GetMapping("searchId")
	public String searchId(String id) {
		return "매니저 : "+id;
	}
	
	
}
