package com.example.starter.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileDto {
	private Long fid;
	private Long aid;
	private String fileRealName;
	private String fileName;
	private String path;
}
