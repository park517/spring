package com.example.starter.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {

	private long aid;
	private String mid;
	private String title;
	private String contents;
	private String regDate;
	private int hit;
	private String fileRealName;
	private String fileName;

	
}
