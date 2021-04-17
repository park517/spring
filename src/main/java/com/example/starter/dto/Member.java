package com.example.starter.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String mid;
	private String password;
	private String name;
	private String email;
	private String tel;
	private String regDate;
}
