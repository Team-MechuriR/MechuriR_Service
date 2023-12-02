package com.example.exchangeDiary.serviceImpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.example.exchangeDiary.dao.UserDao;
import com.example.exchangeDiary.dto.UserInfoDto;
import com.example.exchangeDiary.dto.UserSignupReqDto;
import com.example.exchangeDiary.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Inject
	UserDao userDao;
	
	@Override
	public UserInfoDto loginCheck(UserInfoDto dto, HttpSession session) {
		UserInfoDto userInfo = userDao.loginCheck(dto);
		if (userInfo.getUserName() != null) { // 세션 변수 저장
			session.setAttribute("userid", userInfo.getUserId());
			session.setAttribute("name", userInfo.getUserName());
		}
	 return userInfo; 
	}

	@Override
	public int registerUser(UserSignupReqDto dto) {
		int result = userDao.registerUser(dto);
		return result;
	}

	
}
