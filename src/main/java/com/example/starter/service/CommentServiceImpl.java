package com.example.starter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.starter.dao.CommentDao;
import com.example.starter.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	
	@Override
	public int addComment(CommentDto commentDto) {
		commentDao.addComment(commentDto);
		return 0;
	}

	@Override
	public List<CommentDto> getComment(long aid) {
		return commentDao.getComment(aid);
	}

	@Override
	public void deleteComment(long sid) {
		commentDao.deleteComment(sid);
		
	}

	@Override
	public void updateComment(long sid , String scontents) {
		commentDao.updateComment(sid,scontents);
		
	}
	

}
