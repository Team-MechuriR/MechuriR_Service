package com.example.exchangeDiary.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

import javax.inject.Inject;

import com.example.exchangeDiary.dto.*;

@Repository
public class MateDao {

	@Inject
	SqlSession sqlSession;
	
	public List<MateInfoDto> getMateList(String userId) {
		List<MateInfoDto> mateList = sqlSession.selectList("mate.getMateList", userId);
		return mateList;
	}
	
	public MateDto isAlreadyMate(reqMateDto reqInfo) {
		List<MateDto> mate = sqlSession.selectList("mate.isMate", reqInfo);
		if (mate.size() != 0) {
			return mate.get(0);
		} else {
			return null;
		}
	}
	
	public int requestMate(reqMateDto reqInfo) {
		return sqlSession.insert("mate.requestMate", reqInfo);
	}

	public int responseMate(reqMateDto reqInfo) {
		return sqlSession.update("mate.responseMate", reqInfo);
	}

	public int deleteMate(reqMateDto reqInfo) {
		return sqlSession.delete("mate.deleteMate", reqInfo);
	}

}
