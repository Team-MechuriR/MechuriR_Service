package com.example.exchangeDiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.exchangeDiary.dto.*;
import com.example.exchangeDiary.serviceImpl.UserServiceImpl;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class UserController {

	@Autowired
	private UserServiceImpl userService;
    
    // 로그인
    @PostMapping("/login")
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
    @PostMapping("/signup")
    public ResponseEntity<Void> registerUser(UserSignupReqDto dto) {
    	System.out.println("UserController - registerUser");
    	int result = userService.registerUser(dto);
        return ResponseEntity.status(HttpStatus.CREATED).build();

    }
}
