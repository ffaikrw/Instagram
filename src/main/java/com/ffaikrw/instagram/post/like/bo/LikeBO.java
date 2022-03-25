package com.ffaikrw.instagram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.instagram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	
	// 좋아요 누르기
	public int addLike(int postId, int userId, String loginId) {
		return likeDAO.insertLike(postId, userId, loginId);
	}
	
	
	// 좋아요 취소
	public int deleteLike(int postId, int userId) {
		return likeDAO.deleteLike(postId, userId);
	}
	
	
	
}
