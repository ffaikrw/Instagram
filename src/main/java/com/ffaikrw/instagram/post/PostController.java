package com.ffaikrw.instagram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	
	
	// 타임라인 View
	@GetMapping("/timeline")
	public String timelineView() {
		return "post/timeline";
	}
	
	
	
}
