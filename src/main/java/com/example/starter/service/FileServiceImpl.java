package com.example.starter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.starter.dao.FileDao;
import com.example.starter.dao.MemberDao;
import com.example.starter.dto.FileDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	FileDao fileDao;
	@Override
	public int insertFile(List<FileDto> files) {
		
		return fileDao.insertFile(files);
	}

	@Override
	public List<FileDto> getFile(Long aid) {
		return fileDao.getFile(aid);
	}

}
