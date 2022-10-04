package com.itbank.navercafe.common;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.navercafe.user.cafe.dto.CafeDTO;
import com.itbank.navercafe.user.cafe.service.CafeService;

public class CheckLoginInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private CafeService cafeService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			String xrw = request.getHeader("X-Requested-With");
	
			if("XMLHttpRequest".equals(xrw)) {
				return true;
			}
			
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			String message = "";
			boolean forward = false;
			
			// 로그인이 안되어있을 경우
			if(loginId == null || loginId.length() == 0) {
				message = "로그인 정보가 없습니다.";
				forward = true;
			} else {
				String requestURI = request.getRequestURI();
				String contextPath = request.getContextPath();
				String[] paths = requestURI.split("/");
				String group = "";
				
				if(contextPath.equals("/")) {
					group = paths[1].toLowerCase();
				} else {
					group = paths[2].toLowerCase();
				}
			
				if("admin".equals(group)) {
					CafeDTO cafeDTO = new CafeDTO();
					String cafeId = request.getParameter("cafeId");
					String managerId = "";
					
					if(cafeDTO != null) {
						CafeDTO checkCafeDTO = new CafeDTO();
						cafeDTO.setCafeId(cafeId);
						checkCafeDTO = cafeService.selectCafe(cafeDTO);
						
						if(checkCafeDTO != null) {
							managerId = checkCafeDTO.getUserId();
							
							// 로그인 유저가 관리자가 아닐 경우
							if(!loginId.equals(managerId)) {
								message = "관리자 권한이 없습니다";
								forward = true;
							}
						} else {
							message = "해당 카페가 존재하지 않습니다.";
							forward = true;
						}
					} else {
						message = "해당 카페가 존재하지 않습니다.";
						forward = true;
					}
				}
				
			}

			if(forward) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/");
				
				request.setAttribute("message", message);
				request.setAttribute("_cafeDTO", new CafeDTO());
				
				requestDispatcher.forward(request, response);
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {	
	}

}
