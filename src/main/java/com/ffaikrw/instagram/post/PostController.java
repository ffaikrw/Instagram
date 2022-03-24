package com.ffaikrw.instagram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffaikrw.instagram.post.bo.PostBO;
import com.ffaikrw.instagram.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	// 타임라인 View
	@GetMapping("/timeline")
	public String timelineView(Model model) {
		
		List<Post> postList = postBO.getTimeline();
		
		model.addAttribute("timeline", postList);
		
		return "post/timeline";
	}
	
	
	// 게시물 작성 View
	@GetMapping("/create_view")
	public String createView() {
		return "post/create";
	}
	
	

	
}
