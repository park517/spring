package com.example.starter.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.starter.dao.MemberDao;
import com.example.starter.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	public Map<String, Object> checkLoginIdDup(String userId) {
		int count = memberDao.getLoginIdDupCount(userId);
		
		String resultCode = "";
		String msg = "";
		
		if ( count == 0 ) {
			resultCode = "S-1";
			msg = "사용가능한 로그인 ID 입니다.";
		}
		else {
			resultCode = "F-1";
			msg = "이미 사용중인 로그인 ID 입니다.";
		}
		
		Map<String, Object> rs = new HashMap<String, Object>();
		rs.put("resultCode", resultCode);
		rs.put("msg", msg);
		
		return rs;
	}
	
	@Override
	public Map<String, Object> register(Map<String, Object> param) {
		memberDao.register(param);
		String newId = (String)param.get("userId");

		String resultCode = "";
		String msg = "";

		if ( newId ==null ) {
			resultCode = "F-1";
			msg = "회원가입에 실패했습니다.";
		}
		else {
			resultCode = "S-1";
			msg = "회원가입 되었습니다.";
		}

		Map<String, Object> rs = new HashMap<String, Object>();
		rs.put("resultCode", resultCode);
		rs.put("msg", msg);
		rs.put("newId", newId);

		return rs;
	}

	@Override
	public Member getMember(String id ,String password) {
		Member member = memberDao.getMember(id,password);
		return member;
	}
}