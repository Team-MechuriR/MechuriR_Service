package com.example.exchangeDiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.exchangeDiary.dto.*;
import com.example.exchangeDiary.service.UserService;

public class UserController {

	private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    
    // 로그인
    @PostMapping("/user/login")
    public ResponseEntity<UserInfoDto> loginCheck(@RequestBody UserInfoDto dto, HttpSession session) {
    	System.out.println("UserController - loginCheck");
    	UserInfoDto userInfo = userService.loginCheck(dto, session);
    	System.out.println(userInfo.getUserId() + "  login");
    	if (userInfo.getUserName() == null) { // 로그인 실패 시
    		 return ResponseEntity.notFound().build();
    	}
    	return new ResponseEntity<>(userInfo, HttpStatus.OK);
    }

    // 회원 가입
    @PostMapping("/user/signup")
    public ResponseEntity<Void> registerUser(UserSignupReqDto dto) {
    	System.out.println("UserController - registerUser");
    	int result = userService.registerUser(dto);
        return ResponseEntity.status(HttpStatus.CREATED).build();

    }
}
