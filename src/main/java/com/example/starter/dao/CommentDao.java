package com.example.starter.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.starter.dto.CommentDto;

@Mapper
public interface CommentDao {
	public int addComment(CommentDto commentDto);
	public List<CommentDto> getComment(long aid);
}
