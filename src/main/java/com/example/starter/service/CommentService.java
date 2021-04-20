package com.example.starter.service;

import java.util.List;

import com.example.starter.dto.CommentDto;

public interface CommentService {
	public int addComment(CommentDto commentDto);
	public List<CommentDto> getComment(long aid);
}
