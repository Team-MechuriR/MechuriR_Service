package com.example.exchangeDiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.exchangeDiary.service.MateService;
import com.example.exchangeDiary.vo.MateVo;

@RestController
@RequestMapping("/mate/*")
public class MateController {
	
	// 친구 신청
	@RequestMapping("requestMate.do")
	public ModelAndView requestMate(@ModelAttribute MateVo mate, HttpSession session) {
		int srt = MateService.requestMate(mate, session);
		ModelAndView model = new ModelAndView();
		if (srt != 1) {	// 신청 성공 시
			model.setViewName("");
		} else {	// 신청 실패 시
			model.setViewName("");
			model.addObject("message", "error");
		}
		return model;
	}

	// 친구 신청
	@RequestMapping("responseMate.do")
	public ModelAndView responseMate(@ModelAttribute MateVo mate, HttpSession session) {
		int srt = MateService.responseMate(mate, session);
		ModelAndView model = new ModelAndView();
		if (srt != 1) {	// 수락 성공 시
			model.setViewName("");
		} else {	// 수락 실패 시
			model.setViewName("");
			model.addObject("message", "error");
		}
		return model;
	}
	
	// 친구 신청
	@RequestMapping("deleteMate.do")
	public ModelAndView deleteMate(@ModelAttribute String userId, @ModelAttribute String mateId, HttpSession session) {
		int srt = MateService.deleteMate(userId, mateId, session);
		ModelAndView model = new ModelAndView();
		if (srt != 1) {	// 삭제 성공 시
			model.setViewName("");
		} else {	// 삭제 실패 시
			model.setViewName("");
			model.addObject("message", "error");
		}
		return model;
	}
}
