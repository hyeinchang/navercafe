package com.itbank.navercafe.common;

import java.lang.reflect.Field;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public class CommonUtils {
	// MultipartHttpServletRequest에서 받은 매개변수를 DTO에 설정
	public Object setDTO(MultipartHttpServletRequest multiRequest, Object DTO) {
	
		try {
			Field DTOfields[] = DTO.getClass().getDeclaredFields();
			Enumeration prameterNames = multiRequest.getParameterNames();
			
			while(prameterNames.hasMoreElements()) {
				String paramName = (String) prameterNames.nextElement();
				
				for(Field f : DTOfields) {
					String fieldName = f.getName();
					
					if(paramName.equals(fieldName)) {
						Object value = multiRequest.getParameter(paramName);
						
						if(value != null) {
							String fType = String.valueOf(f.getType());
							
							if(fType.equals("int")) {
								value = Integer.parseInt((String) value);
							}
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
			Field DTOfields[] = DTO.getClass().getDeclaredFields();
			Enumeration prameterNames = request.getParameterNames();
			
			while(prameterNames.hasMoreElements()) {
				String paramName = (String) prameterNames.nextElement();
				
				for(Field f : DTOfields) {
					String fieldName = f.getName();
					
					if(paramName.equals(fieldName)) {
						Object value = request.getParameter(paramName);
						
						if(value != null) {
							String fType = String.valueOf(f.getType());
							
							if(fType.equals("int")) {
								value = Integer.parseInt((String) value);
							}
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
	
	// HttpServletRequest에서 받은 특정 index의 매개변수를 DTO에 설정
	public Object setDTO(HttpServletRequest request, Object DTO, int index) {
	
		try {
			Field DTOfields[] = DTO.getClass().getDeclaredFields();
			Enumeration prameterNames = request.getParameterNames();
			
			while(prameterNames.hasMoreElements()) {
				String paramName = (String) prameterNames.nextElement();
				
				for(Field f : DTOfields) {
					String fieldName = f.getName();
					
					if(paramName.equals(fieldName)) {
						Object[] values = request.getParameterValues(paramName);
						
						if(values.length > index) {
							Object value = values[index];
							
							if(value != null && (String.valueOf(value)).length() > 0) {
								String fType = String.valueOf(f.getType());
								
								if(fType.equals("int")) {
									value = Integer.parseInt((String) value);
								}
							
								f.setAccessible(true);
								f.set(DTO, value);
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
	
	// Map에서 받은 매개변수를 DTO에 설정
	public Object setDTO(Map<String, Object> map, Object DTO) {
	
		try {
			Field DTOfields[] = DTO.getClass().getDeclaredFields();
			
			for(Object key : map.keySet().toArray()) {
				for(Field f : DTOfields) {
					String fieldName = f.getName();
					
					if(key.equals(fieldName)) {
						Object value = map.get(key);
						
						if(value != null) {
							String fType = String.valueOf(f.getType());
							
							if(fType.equals("int")) {
								value = Integer.parseInt((String) value);
							}
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
}
