package com.example.starter.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.example.starter.dto.FileDto;

public class FileUtil {

	public List<FileDto> setFiles(MultipartFile[] file,long newId) throws IllegalStateException, IOException {
		List<FileDto> files = new ArrayList<>();
		for(MultipartFile f : file) {
			FileDto fd = new FileDto();
		    String sourceFileName = f.getOriginalFilename(); 
		    String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
		    File destinationFile; 
		    String destinationFileName;
		    String fileUrl = "C:/BrowserSpace301/starter/src/main/webapp/WEB-INF/upload/";
	        do { 
	            destinationFileName =UUID.randomUUID().toString().replaceAll("-", "") + "." + sourceFileNameExtension; 
	            destinationFile = new File(fileUrl + destinationFileName); 
	        } while (destinationFile.exists()); 
	        
	        destinationFile.getParentFile().mkdirs(); 
	        f.transferTo(destinationFile);
	        fd.setAid(newId);
	        fd.setFileName(destinationFileName);
	        fd.setFileRealName(sourceFileName);
	        fd.setPath(fileUrl);
	        files.add(fd);
		}
		return files;
	}
}
