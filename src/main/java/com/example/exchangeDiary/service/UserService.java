package com.example.exchangeDiary.service;

import javax.servlet.http.HttpSession;

import com.example.exchangeDiary.dto.UserInfoDto;
import com.example.exchangeDiary.dto.UserSignupReqDto;

public interface UserService {

	public UserInfoDto loginCheck(UserInfoDto dto, HttpSession session);

	public int registerUser(UserSignupReqDto dto);

}
