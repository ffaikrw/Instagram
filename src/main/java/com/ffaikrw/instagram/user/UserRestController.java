package com.ffaikrw.instagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.instagram.user.bo.UserBO;
import com.ffaikrw.instagram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	
	// 회원가입 API
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email
			) {
		
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	// 사용자 아이디 중복확인 API
	@GetMapping("/is_duplicate")
	public Map<String, Boolean> isDuplicate(@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = userBO.isDuplicate(loginId);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("is_duplicate", isDuplicate);
		
		return resultMap;
		
	}
	
	
	// 로그인 API
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (user != null) {
			resultMap.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	
}
