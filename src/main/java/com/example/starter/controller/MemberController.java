package com.example.starter.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.starter.dto.Member;
import com.example.starter.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping("/register")
	public String showRegister() {
		return "member/register";
	}
	
	
	@RequestMapping("/doRegister")
	public String doRegister(@RequestParam Map<String,Object> param ,Model model) {
		// 로그인 ID의 중복성 체크
		
		Map<String , Object> checkLoginId = memberService.checkLoginIdDup((String)param.get("userId"));
		if( ((String)checkLoginId.get("resultCode")).startsWith("F-")) {
			model.addAttribute("alertMsg",checkLoginId.get("msg"));
			model.addAttribute("historyBack",true);
			return "common/redirect";
		}
		
		Map<String, Object> RegisterRs = memberService.register(param);

		if ( ((String)RegisterRs.get("resultCode")).startsWith("F-") ) {
			model.addAttribute("alertMsg", RegisterRs.get("msg"));
			model.addAttribute("historyBack", true);
			return "common/redirect";
		}

		model.addAttribute("alertMsg", RegisterRs.get("msg"));
		model.addAttribute("historyBack",true);
		
		return "common/redirect";
		
	}
	
	@RequestMapping("/login")
	public String login (@RequestParam Map<String,Object> param , Model model ,HttpSession session ) {
		String id = (String)param.get("id");
		String password = (String)param.get("password");
		
		Member member = memberService.getMember(id,password);
		if(member == null) {
			model.addAttribute("alertMsg", "일치하는 회원이 존재하지 않습니다.");
			model.addAttribute("historyBack", true);
			return "common/redirect";
		}
		session.setAttribute("loginMember", member);
		
		model.addAttribute("alertMsg", "로그인 되었습니다.");
		model.addAttribute("historyBack",true);
		
		return "common/redirect";
	}
	
	@RequestMapping("/logout")
	public String logout(Model model ,HttpSession session) {
		session.removeAttribute("loginMember");
		model.addAttribute("alertMsg", "로그아웃 되었습니다.");
		model.addAttribute("historyBack",true);
		
		return "common/redirect";
	}
}
