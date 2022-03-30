package com.ffaikrw.instagram.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfileController {
	
	@GetMapping("profile_view")
	public String profileView(@RequestParam("userId") int userId) {
		return "profile/userProfile";
	}
	
	
}
