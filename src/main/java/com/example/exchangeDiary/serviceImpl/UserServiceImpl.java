package com.example.exchangeDiary.serviceImpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.exchangeDiary.dao.UserDao;
import com.example.exchangeDiary.dto.UserInfoDto;
import com.example.exchangeDiary.dto.UserSignupReqDto;
import com.example.exchangeDiary.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
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
