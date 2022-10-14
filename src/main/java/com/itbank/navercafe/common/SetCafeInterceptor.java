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

public class SetCafeInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private CafeService cafeService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		CafeDTO cafeDTO = new CafeDTO();
		boolean forward = false;
		
		try {
			String xrw = request.getHeader("X-Requested-With");
	
			if("XMLHttpRequest".equals(xrw)) {
				return true;
			}
			
			String cafeId = request.getParameter("cafeId");
			
			if(cafeId != null && cafeId.length() > 0) {
				cafeDTO.setCafeId(cafeId);
				HttpSession session = request.getSession();
				String loginId = (String) session.getAttribute("loginId");
				String boardMenuNumStr = request.getParameter("boardMenuNum");
				String board = request.getParameter("board");
				
				if(board != null && "total".equals(board)) {
					request.setAttribute("board", board);
				}
				
				if(loginId != null) {
					cafeDTO.setLoginId(loginId);
				}
				
				if(boardMenuNumStr != null && boardMenuNumStr.length() > 0) {
					boardMenuNumStr = boardMenuNumStr.replaceAll("\\D", "");
					
					if(boardMenuNumStr.length() > 0) {
						int boardMenuNum = Integer.parseInt(boardMenuNumStr);
						
						cafeDTO.setBoardMenuNum(boardMenuNum);
					}
				}
				
				cafeDTO = cafeService.selectCafe(cafeDTO);
				
				if(cafeDTO == null) {
					forward = true;
				}
			} else {
				forward = true;
			}
			
			request.setAttribute("_cafeDTO", cafeDTO);
			
			if(forward) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/");
				String message = "해당카페가 존재하지 않습니다.";
				
				request.setAttribute("message", message);
				
				requestDispatcher.forward(request, response);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

}
