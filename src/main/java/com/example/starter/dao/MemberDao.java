package com.example.starter.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.starter.dto.Member;

@Mapper
public interface MemberDao {
	
	public int getLoginIdDupCount(String userId);
	public void register(Map<String, Object> param);
	public Member getMember(String id ,String password);
}
