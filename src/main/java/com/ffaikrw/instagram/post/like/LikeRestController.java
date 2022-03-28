package com.ffaikrw.instagram.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.instagram.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	
	// 좋아요 누르기 API
	@GetMapping("/like")
	public Map<String, String> addLike(
			@RequestParam("postId") int postId
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("userLoginId");
		
		int count = likeBO.addLike(postId, userId, loginId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	// 좋아요 취소 API
	@GetMapping("/like_delete")
	public Map<String, String> deleteLike(
			@RequestParam("postId") int postId
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.deleteLike(postId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	// 좋아요 중복확인 API
	@GetMapping("/like_duplicate")
	public Map<String, Boolean> likeIsDuplicate(
			@RequestParam("postId") int postId
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		
		
	}
	
	
}
