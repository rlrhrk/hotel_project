package com.hotel;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hotel.model.LoginRequest;
import com.hotel.service.QnAService;

@RestController
public class QnaRestController {
	@Autowired
	QnAService qnaService;
	
	@PostMapping("/qnas")
	public HashMap<String, String> add(HttpServletRequest request, @ModelAttribute LoginRequest loginRequest, Model model) throws Exception {
		qnaService.insertQna();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "true");

		return map;
	}
}








