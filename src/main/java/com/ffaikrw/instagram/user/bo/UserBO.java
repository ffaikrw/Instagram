package com.ffaikrw.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.instagram.common.EncryptUtils;
import com.ffaikrw.instagram.user.dao.UserDAO;

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
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	
	// 사용자 아이디 중복확인
	public boolean isDuplicate(String loginId) {
		
		int count = userDAO.selectLoginIdCount(loginId);
		
		// 0이 아니면 중복(true), 0이면 중복아님(false)
		return !(count == 0);
		
	}
	
}
