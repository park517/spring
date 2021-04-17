package com.example.starter.service;

import java.util.Map;

import com.example.starter.dto.Member;

public interface MemberService {
	public Map<String, Object> checkLoginIdDup(String userId);
	public Map<String, Object> register(Map<String, Object> param);
	public Member getMember(String id , String password);
}
