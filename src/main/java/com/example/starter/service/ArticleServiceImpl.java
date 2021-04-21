package com.example.starter.service;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import com.example.starter.dao.ArticleDao;
import com.example.starter.dao.FileDao;
import com.example.starter.dto.Article;
import com.example.starter.pageing.Criteria;
import com.example.starter.dto.FileDto;
import com.example.starter.pageing.PaginationInfo;

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
	public Article getOne(long aid) {
		Article article = articleDao.getOne(aid);
		return article;
	}


	@Override
	public long add(Map<String, Object> param) {
		articleDao.add(param);
		return CUtil.getAsLong(param.get("aid"));
	}
	
	@Override
	public void delete(long aid) {
		// TODO Auto-generated method stub
		articleDao.delete(aid);
	}
	
	@Override
	public void modify(Map<String, Object> param) {
		articleDao.modify(param);
		
	}
	@Override
	public void hitUp(long aid) {
		articleDao.hitUp(aid);
	}
	@Override
	public List<Article> selectArticleList(Article article) {
		List<Article> articleList = Collections.emptyList();
		
		int articleCount = articleDao.getTotalCount();
		PaginationInfo paginationInfo = new PaginationInfo(article);
		paginationInfo.setTotalRecordCount(articleCount);
		article.setPaginationInfo(paginationInfo);
		
		if(articleCount > 0 ) {
			articleList = articleDao.selectArticleList(article);
		}
		return articleList;
	}
	@Override
	public List<Article> searchArticleList(String type, String keyword) {
		
		return articleDao.searchArticleList(type, keyword);
	}
	@Override
	public int getCount(String type, String keyword) {
		
		return articleDao.getCount(type, keyword);
	}


}
