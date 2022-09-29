package com.itbank.navercafe.common;

import java.lang.reflect.Field;
import java.util.Enumeration;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public class CommonUtils {
	// MultipartHttpServletRequest에서 받은 매개변수를 DTO에 설정
	public Object setMultirequestToDTO(MultipartHttpServletRequest multiRequest, Object DTO) {
	
		try {
			Field cafeDTOFileds[] = DTO.getClass().getDeclaredFields();
			Enumeration prameterNames = multiRequest.getParameterNames();
			
			while(prameterNames.hasMoreElements()) {
				String paramName = (String) prameterNames.nextElement();
				
				for(Field f : cafeDTOFileds) {
					String filedName = f.getName();
					
					if(paramName.equals(filedName)) {
						if(multiRequest.getParameter(paramName) != null) {
							f.setAccessible(true);
							f.set(DTO, multiRequest.getParameter(paramName));
							f.setAccessible(false);
						}
						break;
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return DTO;
	}
}
