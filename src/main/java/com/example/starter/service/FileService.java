package com.example.starter.service;

import com.example.starter.dto.FileDto;

public interface FileService {
	public int insertFile(FileDto file);
	public FileDto getFile(Long aid);
}
