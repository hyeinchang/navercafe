package com.itbank.navercafe.common;

import java.lang.reflect.Field;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public class CommonUtils {
	// MultipartHttpServletRequest에서 받은 매개변수를 DTO에 설정
	public Object setDTO(MultipartHttpServletRequest multiRequest, Object DTO) {
	
		try {
			Field cafeDTOfields[] = DTO.getClass().getDeclaredFields();
			Enumeration prameterNames = multiRequest.getParameterNames();
			
			while(prameterNames.hasMoreElements()) {
				String paramName = (String) prameterNames.nextElement();
				
				for(Field f : cafeDTOfields) {
					String fieldName = f.getName();
					
					if(paramName.equals(fieldName)) {
						Object value = multiRequest.getParameter(paramName);
						
						if(value != null) {
							f.setAccessible(true);
							f.set(DTO, value);
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
	
	// HttpServletRequest에서 받은 매개변수를 DTO에 설정
	public Object setDTO(HttpServletRequest request, Object DTO) {
	
		try {
			Field cafeDTOfields[] = DTO.getClass().getDeclaredFields();
			Enumeration prameterNames = request.getParameterNames();
			
			while(prameterNames.hasMoreElements()) {
				String paramName = (String) prameterNames.nextElement();
				
				for(Field f : cafeDTOfields) {
					String fieldName = f.getName();
					
					if(paramName.equals(fieldName)) {
						Object value = request.getParameter(paramName);
						
						if(value != null) {
							f.setAccessible(true);
							f.set(DTO, value);
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
	
	// HttpServletRequest에서 받은 매개변수를 DTO에 설정
	public Object setDTO(HttpServletRequest request, Object DTO, int index) {
	
		try {
			Field cafeDTOfields[] = DTO.getClass().getDeclaredFields();
			Enumeration prameterNames = request.getParameterNames();
			
			while(prameterNames.hasMoreElements()) {
				String paramName = (String) prameterNames.nextElement();
				
				for(Field f : cafeDTOfields) {
					String fieldName = f.getName();
					
					if(paramName.equals(fieldName)) {
						String values[] = request.getParameterValues(paramName);
					
						if(values != null && values.length-1 >= index) {
							String value = values[index];
						
							if(value != null && value.length() > 0) {
								f.setAccessible(true);
								System.out.println("fieldName : " + fieldName);
								System.out.println("value : " + value);
								f.set(DTO, (Object) value);
								f.setAccessible(false);
							}
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
