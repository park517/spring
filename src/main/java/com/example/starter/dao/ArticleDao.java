package com.example.starter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.starter.dto.Article;
@Mapper // 이렇게 해주면 ArticleDao의 구현체를 마이바티스가 대신 구현해준다.
public interface ArticleDao {
	public List<Article> getList();
	public Article getOne(long aid);
	public void add(Map<String, Object> param);
	public void delete(long aid);
	public void modify(Map<String, Object> param);
	public void hitUp(long aid);
}
