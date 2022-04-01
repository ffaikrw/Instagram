package com.ffaikrw.instagram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.instagram.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	// 댓글 작성
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("loginId") String loginId
			, @Param("comment") String comment
			);
	
	
	// 댓글 보여주기
	public List<Comment> selectCommentList(@Param("postId") int postId);
	
	
	// 해당 포스트의 댓글 삭제하기
	public int deleteCommentByPostId(@Param("postId") int postId);
	

}
