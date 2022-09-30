package com.itbank.navercafe.common;

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
		//System.out.println("---------- preHandle 실행 ---------");

		CafeDTO cafeDTO = new CafeDTO();
		
		try {
			
			String cafeId = request.getParameter("cafeId");
			if(cafeId != null && cafeId.length() > 0) {
				cafeDTO.setCafeId(cafeId);
				//System.out.println("cafeId : " + cafeId);
				
				HttpSession session = request.getSession();
				
				String loginId = (String) session.getAttribute("loginId");
				
				cafeDTO.setLoginId(loginId);
				cafeDTO = cafeService.selectCafe(cafeDTO);	
				
				//System.out.println(cafeDTO.getCafeName());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		request.setAttribute("_cafeDTO", cafeDTO);
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//System.out.println("-------------postHandle 실행 -------");
		
	}

}
