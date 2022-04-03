package com.ffaikrw.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.instagram.common.EncryptUtils;
import com.ffaikrw.instagram.user.dao.UserDAO;
import com.ffaikrw.instagram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	
	// 회원가입
	public int addUser(
			String loginId,
			String password,
			String name,
			String email
			) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		if (encryptPassword == null || encryptPassword.equals("")) {
			return 0;
		}
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	
	// 사용자 아이디 중복확인
	public boolean isDuplicate(String loginId) {
		
		int count = userDAO.selectLoginIdCount(loginId);
		
		return !(count == 0);
		
	}
	
	
	// 로그인
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
		
	}
	
	
	// 특정 사용자의 loginId 가져오기
	public String getLoginIdByUserId(int userId) {
		return userDAO.selectLoginIdByUserId(userId);
	}
	
}
