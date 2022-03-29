package com.ffaikrw.instagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffaikrw.instagram.post.bo.PostBO;
import com.ffaikrw.instagram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	// 타임라인 View
	@GetMapping("/timeline")
	public String timelineView(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getTimeline(userId);
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
	
	
	// 게시물 작성 View
	@GetMapping("/create_view")
	public String createView() {
		return "post/create";
	}
	
	
	

	
}
