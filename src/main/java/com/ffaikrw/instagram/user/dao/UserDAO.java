package com.ffaikrw.instagram.user.dao;

import org.apache.ibatis.annotations.Param;

import com.ffaikrw.instagram.user.model.User;

public interface UserDAO {
	
	// 회원가입
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email
			);
	
	
	// 사용자 아이디 중복확인
	public int selectLoginIdCount(
			@Param("loginId") String loginId
			);
	
	
	// 로그인
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password") String password
			);
	
}
