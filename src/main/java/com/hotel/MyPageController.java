package com.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		model.addAttribute("title", "마이페이지");
		model.addAttribute("page", "mypage/mypage");

		return "layout/template";
	}
}








