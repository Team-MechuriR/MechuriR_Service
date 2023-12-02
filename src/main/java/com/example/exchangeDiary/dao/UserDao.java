package com.example.exchangeDiary.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.example.exchangeDiary.dto.UserInfoDto;
import com.example.exchangeDiary.dto.UserSignupReqDto;

public class UserDao {
	
	@Inject
	SqlSession sqlSession;

	public UserInfoDto loginCheck(UserInfoDto dto) {
		return sqlSession.selectOne("user.loginCheck", dto);
	}

	public int registerUser(UserSignupReqDto dto) {
		return sqlSession.insert("user.register");
	}

}
