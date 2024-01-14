package com.example.exchangeDiary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.exchangeDiary.serviceImpl.MateServiceImpl;
import com.example.exchangeDiary.dto.*;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/mate")
public class MateController {
	
	@Autowired
	private MateServiceImpl mateService;
	
	// 친구 목록 
	@GetMapping("/searchMate")
    public ResponseEntity<List<MateInfoDto>> getMateList(@RequestParam(value="userId") String userId) {
		System.out.println("MateController - getMateList : " + userId);
        return ResponseEntity.ok(mateService.getMateList(userId));
    }
	
	// 친구 신청
	@PostMapping("/requestMate")
	public ResponseEntity<Map<String, Object>> requestMate(@RequestBody reqMateDto reqInfo) {
    	System.out.println("MateController - requestMate");
    	int mate = mateService.requestMate(reqInfo);
    	Map<String, Object> result = new HashMap<>();
    	if (mate == 1) {
            return ResponseEntity.status(HttpStatus.CREATED).build();
    	} else if (mate == 2) {
    		result.put("msg", "이미 친구 상태입니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
    	} else if (mate == 1) {
    		result.put("msg", "이미 친구 요청 중입니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
    	} else {
    		result.put("msg", "친구 요청에 실패했습니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
    	}
	}
	
	// 친구 수락
	@PostMapping("/responseMate")
	public ResponseEntity<Void> responseMate(@RequestBody reqMateDto reqInfo) {
    	System.out.println("MateController - responseMate");
    	mateService.responseMate(reqInfo);
    	return ResponseEntity.status(HttpStatus.CREATED).build();
	}
	
	// 친구 거절
	@PostMapping("/rejectMate")
	public ResponseEntity<Void> rejectMate(@RequestBody reqMateDto reqInfo) {
    	System.out.println("MateController - rejectMate");
    	mateService.deleteMate(reqInfo);
    	return ResponseEntity.status(HttpStatus.CREATED).build();
	}
	
	
	// 친구 삭제
	@PostMapping("/deleteMate")
	public ResponseEntity<Void> deleteMate(@RequestBody reqMateDto reqInfo) {
    	System.out.println("MateController - deleteMate");
    	mateService.deleteMate(reqInfo);
    	return ResponseEntity.status(HttpStatus.CREATED).build();
	}
	
}