package com.example.exchangeDiary.service;

import java.util.List;

import com.example.exchangeDiary.dto.*;

public interface MateService {
	
	public List<MateInfoDto> getMateList(String userId);
	
	public int requestMate(reqMateDto reqInfo);
	
	public int responseMate(reqMateDto reqInfo);
	
	public int deleteMate(reqMateDto reqInfo);
}
