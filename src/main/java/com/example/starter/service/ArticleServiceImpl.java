package com.example.starter.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.starter.dao.ArticleDao;
import com.example.starter.dto.Article;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	ArticleDao articleDao;
	
	@Override
	public List<Article> getList() {
		List<Article> list = articleDao.getList();

		return list;
	}
	@Override
	public Article getOne(long id) {
		Article article = articleDao.getOne(id);
		return article;
	}


	@Override
	public long add(Map<String, Object> param) {
		articleDao.add(param);
		
		return CUtil.getAsLong(param.get("id"));
	}
	
	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		articleDao.delete(id);
	}
	
	@Override
	public void modify(Map<String, Object> param) {
		articleDao.modify(param);
		
	}
	@Override
	public void hitUp(long id) {
		articleDao.hitUp(id);
	}
}
