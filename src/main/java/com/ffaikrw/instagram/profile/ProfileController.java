package com.ffaikrw.instagram.profile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.instagram.profile.bo.ProfileBO;
import com.ffaikrw.instagram.profile.model.Profile;

@Controller
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO;
	
	
	// 개인 프로필 화면
	@GetMapping("profile_view")
	public String profileView(
			@RequestParam("userId") int userId
			, Model model
			) {
		
		Profile profile = profileBO.getProfileByUserId(userId);
		model.addAttribute("userProfile", profile);
		
		return "profile/userProfile";
	}
	
	
	// 개인 포스트 상세화면
	@GetMapping("profile_detail_view")
	public String posrView(
			@RequestParam("postId") int postId
			, HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		Profile profile = profileBO.getPost(postId, userId);
		model.addAttribute("userPost", profile);
		
		return "profile/userPostDetail";
	}
	
	
	
}
