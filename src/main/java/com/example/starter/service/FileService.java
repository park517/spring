package com.example.starter.service;

import java.util.List;

import com.example.starter.dto.FileDto;

public interface FileService {
	public int insertFile(List<FileDto> files);
	public List<FileDto> getFile(Long aid);
}
