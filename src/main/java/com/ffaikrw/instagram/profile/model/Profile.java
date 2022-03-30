package com.ffaikrw.instagram.profile.model;

import java.util.List;

import com.ffaikrw.instagram.post.model.Post;

public class Profile {
	
	private List<Post> userPostList;

	public List<Post> getUserPostList() {
		return userPostList;
	}

	public void setUserPostList(List<Post> userPostList) {
		this.userPostList = userPostList;
	}
	
}
