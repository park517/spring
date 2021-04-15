package com.example.starter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller 
public class ArticleController {
	@RequestMapping("/article/list")
	public String showMain() {
		return "article/list";
	}
}
