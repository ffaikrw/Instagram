package com.ffaikrw.instagram.profile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.instagram.post.bo.PostBO;
import com.ffaikrw.instagram.profile.model.Profile;

@Service
public class ProfileBO {
	
	@Autowired
	private PostBO postBO;
	
	public Profile getPostListByUserId(int userId) {
		
		Profile profile = new Profile();
		
		profile.setPostListByUserId(postBO.getPostByUser(userId));
		
		return profile;
	}
	
}
