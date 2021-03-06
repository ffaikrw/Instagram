package com.ffaikrw.instagram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// 회원가입 view
	@GetMapping("/signup_view")
	public String signUpView() {
		return "user/signUp";
	}
	
	
	// 로그인 View
	@GetMapping("/signin_view")
	public String signInView() {
		return "user/signIn";
	}
	
	
	// 로그아웃
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/signin_view";
		
	}
	
	
}
