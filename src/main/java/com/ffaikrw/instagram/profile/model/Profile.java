package com.ffaikrw.instagram.profile.model;

import java.util.List;

import com.ffaikrw.instagram.post.model.Post;

public class Profile {
	
	private List<Post> postListByUserId;

	public List<Post> getPostListByUserId() {
		return postListByUserId;
	}

	public void setPostListByUserId(List<Post> postListByUserId) {
		this.postListByUserId = postListByUserId;
	}

}
