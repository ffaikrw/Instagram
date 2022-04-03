package com.ffaikrw.instagram.profile.model;

import java.util.List;

import com.ffaikrw.instagram.post.model.Post;
import com.ffaikrw.instagram.post.model.PostDetail;

public class Profile {
	
	private String loginIdByUserId;
	private List<Post> postListByUserId;
	private int postCountByUserId;
	private PostDetail postDetail;
	
	public String getLoginIdByUserId() {
		return loginIdByUserId;
	}

	public void setLoginIdByUserId(String loginIdByUserId) {
		this.loginIdByUserId = loginIdByUserId;
	}

	public List<Post> getPostListByUserId() {
		return postListByUserId;
	}

	public void setPostListByUserId(List<Post> postListByUserId) {
		this.postListByUserId = postListByUserId;
	}

	public int getPostCountByUserId() {
		return postCountByUserId;
	}

	public void setPostCountByUserId(int postCountByUserId) {
		this.postCountByUserId = postCountByUserId;
	}

	public PostDetail getPostDetail() {
		return postDetail;
	}

	public void setPostDetail(PostDetail postDetail) {
		this.postDetail = postDetail;
	}
	
	


}
