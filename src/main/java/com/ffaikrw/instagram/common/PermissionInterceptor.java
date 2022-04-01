package com.ffaikrw.instagram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			) throws IOException {
		
		String uri = request.getRequestURI();
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null) { // 로그인 X
			
			if (uri.startsWith("/post")) {
				response.sendRedirect("/user/signin_view");
				return false;
			}
			
		} else { // 로그인 O
			
			if (uri.startsWith("/user")) {
				response.sendRedirect("/post/timeline");
				return false;
			}
			
		}
		
		return true;
	}
	

	@Override
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView
			) {

	}
	
	
	@Override
	public void afterCompletion(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, Exception ex
			) {
		
	}
	
		
}
