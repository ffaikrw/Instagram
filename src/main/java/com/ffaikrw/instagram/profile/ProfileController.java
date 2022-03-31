package com.ffaikrw.instagram.profile;

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
	
	@GetMapping("profile_view")
	public String profileView(
			@RequestParam("userId") int userId
			, Model model	
			) {
		
		Profile profile = profileBO.getPostListByUserId(userId);
		model.addAttribute("userPostList", profile);
		
		return "profile/userProfile";
	}
	
	
}
