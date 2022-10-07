package com.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
	
	@RequestMapping("/qna-form")
	public String form(Model model) {
		model.addAttribute("title", "1:1문의 작성");
		model.addAttribute("page", "qna/form");

		return "layout/template";
	}
	
	@RequestMapping("/qna-list")
	public String list(Model model) {
		model.addAttribute("title", "1:1문의 리스트");
		model.addAttribute("page", "qna/list");

		return "layout/template";
	}
}








