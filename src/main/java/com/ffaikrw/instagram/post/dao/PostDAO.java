package com.ffaikrw.instagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.instagram.post.model.Post;

@Repository
public interface PostDAO {
	
	// 타임라인
	public List<Post> selectAllPost();
	
	
	// 게시글 작성
	public int insertPost(
			@Param("userId") int userId
			, @Param("loginId") String loginId
			, @Param("content") String content
			, @Param("imagePath") String imagePath 
			);
	
	
	// 특정 게시물 가져오기
	public Post selectPost(@Param("postId") int postId);
	
	
	// 게시물 삭제
	public int deletePost(@Param("postId") int postId);
	
	
	// 로그인한 사용자의 게시물 가져오기
	public List<Post> selectPostByUserId(@Param("userId") int userId);

}
