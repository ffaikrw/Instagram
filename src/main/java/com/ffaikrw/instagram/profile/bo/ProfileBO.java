package com.ffaikrw.instagram.profile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.instagram.post.bo.PostBO;
import com.ffaikrw.instagram.profile.model.Profile;
import com.ffaikrw.instagram.user.bo.UserBO;

@Service
public class ProfileBO {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	public Profile getProfileByUserId(int userId) {
		
		Profile profile = new Profile();
		
		profile.setLoginIdByUserId(userBO.getLoginIdByUserId(userId));
		profile.setPostListByUserId(postBO.getPostListByUserId(userId));
		profile.setPostCountByUserId(postBO.getPostCountByUserId(userId));
		
		return profile;
	}
	
	
	public Profile getPost(int postId) {
		
		Profile profile = new Profile();
		
		profile.getPostDetail();
		
		return profile;
		
	}
	
}
