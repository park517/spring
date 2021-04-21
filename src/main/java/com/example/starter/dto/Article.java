package com.example.starter.dto;

import com.example.starter.pageing.CommonDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article extends CommonDto{

	private long aid;
	private String mid;
	private String title;
	private String contents;
	private String regDate;
	private int hit;
}
