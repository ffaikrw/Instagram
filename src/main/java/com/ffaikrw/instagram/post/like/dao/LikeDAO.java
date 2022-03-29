package com.ffaikrw.instagram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	// 좋아요 누르기
	public int insertLike(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("loginId") String loginId
			);
	
	
	// 좋아요 취소
	public int deleteLike(
			@Param("postId") int postId
			, @Param("userId") int userId
			);
	
	
	// 좋아요 개수
	public int selectLikeCount(@Param("postId") int postId);
	
	
	// 좋아요 중복확인
	public int selectUserLikeCount(
			@Param("postId") int postId
			, @Param("userId") int userId
			);
	
}
