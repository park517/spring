package com.example.starter.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.starter.dto.Article;
import com.example.starter.service.ArticleService;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j //이걸 해야 log.info(.._) 가 가능 , 디버깅 용도
public class ArticleController {
	@Autowired
	ArticleService articleService;
	
	
	// 게시물 리스트 가져오기
	@RequestMapping("/article/list")
	public String showList(Model model) {
		List<Article> list = articleService.getList();
		model.addAttribute("list",list);
		model.addAttribute("totalCount",list.size());
		log.info("list : "+list);
		return "article/list";
	}
	
	// id에 맞는 게시물 가져오기
	@RequestMapping("/article/detail")
	public String showDetail(Model model , long id) {
		
		Article article = articleService.getOne(id);
		articleService.hitUp(id);
		model.addAttribute("article", article);

		return "article/detail";
	}
	
	// 게시물 추가하기
	@RequestMapping("/article/add")
	public String showAdd() {
		return "article/add";
	}
	
	@RequestMapping("/article/doAdd")
	@ResponseBody
	public String doAdd(@RequestParam Map<String , Object> param) {
		//Rquest는 오브젝트 타입이므로 키는 form의 name object는 그의 value 값이다
		long newId = articleService.add(param);
		String msg = newId+ "번 게시물이 추가되었습니다";
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('"+msg+"');");
		sb.append("location.replace('./detail?id="+newId+"');");
		sb.insert(0, "<script>");
		sb.append("</script>");
		
		return sb.toString();
	}
	
	// 게시물 삭제하기
	@RequestMapping("/article/doDelete")
	@ResponseBody
	public String doDelete(long id) {
		articleService.delete(id);

		String msg = id + "번 게시물이 삭제되었습니다.";

		StringBuilder sb = new StringBuilder();

		sb.append("alert('" + msg + "');");
		sb.append("location.replace('./list');");

		sb.insert(0, "<script>");
		sb.append("</script>");

		return sb.toString();
	}
	
	// 게시물 수정 페이지 이동
	@RequestMapping("/article/modify")
	public String modify(Model model , long id) {
		Article article = articleService.getOne(id);
		model.addAttribute("article",article);
		return "article/modify";
	}

	// 게시물 수정
	
	@RequestMapping("/article/doModify")
	@ResponseBody
	public String doModify(@RequestParam Map<String, Object> param, long id) {
		articleService.modify(param);

		String msg = id + "번 게시물이 수정되었습니다.";

		StringBuilder sb = new StringBuilder();

		sb.append("alert('" + msg + "');");
		sb.append("location.replace('./detail?id=" + id + "');");

		sb.insert(0, "<script>");
		sb.append("</script>");

		return sb.toString();
	}
	
}
