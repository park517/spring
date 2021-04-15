package com.example.starter.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.starter.dao.ArticleDao;
import com.example.starter.dto.Article;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	ArticleDao articleDao;
	
	
	public List<Article> getList() {
		List<Article> list = articleDao.getList();

		return list;
	}
}
