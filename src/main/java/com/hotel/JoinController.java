package com.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	
	@RequestMapping("/join")
	public String login(Model model) {
		model.addAttribute("title", "회원가입");
		model.addAttribute("page", "join/join");

		return "layout/template";
	}
}








