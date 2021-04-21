package com.example.starter.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.example.starter.dto.Article;
import com.example.starter.pageing.Criteria;

public interface ArticleService {

	public Article getOne(long aid);
	public long add(Map<String, Object> param);
	public void delete(long aid);
	public void modify(Map<String, Object> param);
	public void hitUp(long aid);

	// 페이징 추가 부분
	public List<Article> getList();
	public List<Article> selectArticleList(Article article);
}
