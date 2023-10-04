package com.example.exchangeDiary.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.example.exchangeDiary.service.PostService;
import com.example.exchangeDiary.vo.*;

@RestController
@RequestMapping("/post/*")
public class PostController {

	// 편지 보내기
	@RequestMapping("sendPost.do")
	public ModelAndView sendPost(@ModelAttribute PostVo post, HttpSession session) {
		int srt = PostService.sendPost(post, session);
		ModelAndView model = new ModelAndView();
		if (srt != 1) {	// 보내기 성공 시
			model.setViewName("");
		} else {	// 보내기 실패 시
			model.setViewName("");
			model.addObject("message", "error");
		}
		return model;
	}
	
	// 쓴 편지 리스트
	@RequestMapping("sendPostList.do")
	public ModelAndView sendPostList(@ModelAttribute String userId, HttpSession session) {
		ArrayList<PostVo> postList = PostService.sendPostList(userId, session);
		ModelAndView model = new ModelAndView();
		if (postList != null) {
			model.setViewName("");
		} else {
			model.setViewName("");
			model.addObject("message", "error");
		}
		return model;
	}
	
	// 쓴 편지 리스트
	@RequestMapping("receivePostList.do")
	public ModelAndView receivePostList(@ModelAttribute String userId, HttpSession session) {
		ArrayList<PostVo> postList = PostService.receivePostList(userId, session);
		ModelAndView model = new ModelAndView();
		if (postList != null) {
			model.setViewName("");
		} else {
			model.setViewName("");
			model.addObject("message", "error");
		}
		return model;
	}
}
