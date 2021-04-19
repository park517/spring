package com.example.starter.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.starter.dto.FileDto;

@Mapper
public interface FileDao {
	public int insertFile(FileDto file);
	public FileDto getFile(long aid);
}
