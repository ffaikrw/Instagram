package com.ffaikrw.instagram.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.instagram.post.comment.bo.CommentBO;

@RestController
@RequestMapping("/post/comment")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	
	// 댓글 달기
	@PostMapping("/create")
	public Map<String, String> createComment(
			@RequestParam("postId") int postId
			, @RequestParam("comment") String comment
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("userLoginId");
		
		int count = commentBO.addComment(postId, userId, loginId, comment);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	
}
