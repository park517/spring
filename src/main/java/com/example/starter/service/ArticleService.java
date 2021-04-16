package com.example.starter.service;

import java.util.List;
import java.util.Map;

import com.example.starter.dto.Article;

public interface ArticleService {
	public List<Article> getList();
	public Article getOne(long id);
	public long add(Map<String, Object> param);
	public void delete(long id);
	public void modify(Map<String, Object> param);
	public void hitUp(long id);
	
}
