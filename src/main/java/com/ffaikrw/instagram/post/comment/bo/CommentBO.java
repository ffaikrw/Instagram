package com.ffaikrw.instagram.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.instagram.post.comment.dao.CommentDAO;
import com.ffaikrw.instagram.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	// 댓글 작성
	public int addComment(int postId, int userId, String loginId, String comment) {
		return commentDAO.insertComment(postId, userId, loginId, comment);
	}
	

	// 댓글 보여주기
	public Comment getComment(int postId) {
		return commentDAO.selectPostComment(postId);
	}
	
	
	
}
