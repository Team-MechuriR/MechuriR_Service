package com.example.exchangeDiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.exchangeDiary.service.LoginService;
import com.example.exchangeDiary.vo.UserVo;

@RestController
@RequestMapping("/member/*")
public class LoginController {

	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("edit.do")
	public String edit() {
		return "member/edit";
	}
	
	// 로그인
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute UserVo user, HttpSession session) {
		String userId = LoginService.loginCheck(user, session);
		ModelAndView model = new ModelAndView();
		if (userId != null) {	// 로그인 성공 시
			model.setViewName("home");
		} else {	// 로그인 실패 시
			model.setViewName("member/login");
			model.addObject("message", "error");
		}
		return model;
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView model) {
		LoginService.logout(session); 
		model.setViewName("member/login"); 
		model.addObject("message", "logout");
		return model;
	}
	
	// 회원가입
	@RequestMapping("join.do")
	public ModelAndView joinUser(@ModelAttribute UserVo user, HttpSession session) {
		int srt = LoginService.joinUser(user, session);
		ModelAndView model = new ModelAndView();
		if (srt != 1) {	// 회원가입 성공 시
			model.setViewName("member/login");
		} else {	// 회원가입 실패 시
			model.setViewName("member/join");
			model.addObject("message", "error");
		}
		return model;
	}
	
	@RequestMapping("edit.do")
	public ModelAndView editUser(@ModelAttribute UserVo user, HttpSession session) {
		int srt = LoginService.editUser(user, session);
		ModelAndView model = new ModelAndView();
		if (srt != 1) {	// 회원수정 성공 시
			model.setViewName("member/login");
		} else {	// 회원수정 실패 시
			model.setViewName("member/join");
			model.addObject("message", "error");
		}
		return model;
	}
}
