package com.example.starter.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.example.starter.dto.Article;

public interface ArticleService {
	public List<Article> getList();
	public Article getOne(long aid);
	public long add(Map<String, Object> param);
	public void delete(long aid);
	public void modify(Map<String, Object> param);
	public void hitUp(long aid);
	
	
}
