package com.ffaikrw.instagram.post.model;

import java.util.List;

import com.ffaikrw.instagram.post.comment.model.Comment;

public class PostDetail {
	
	private Post post;
	private int likeCount;
	private boolean userLikeDuplicate;
	private List<Comment> commentList;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public boolean isUserLikeDuplicate() {
		return userLikeDuplicate;
	}
	public void setUserLikeDuplicate(boolean userLikeDuplicate) {
		this.userLikeDuplicate = userLikeDuplicate;
	}

	
	
}
