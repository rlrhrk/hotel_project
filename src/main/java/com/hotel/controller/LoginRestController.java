package com.hotel.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hotel.dto.MemberDTO;
import com.hotel.model.JoinRequest;
import com.hotel.model.LoginRequest;
import com.hotel.model.LogoutRequest;
import com.hotel.service.MemberService;

@RestController
public class LoginRestController {
	@Autowired
	MemberService memberService;
	
	@PostMapping("/accessToken")
	public HashMap<String, String> access(HttpServletRequest request, @ModelAttribute LoginRequest loginRequest, Model model) throws Exception {
		MemberDTO matchMember = memberService.matchMember(loginRequest);
		if (matchMember == null) {
			throw new Exception("login fail");
		}
		
		// 로그인하면 액세스 토큰 발급
		Random random = new Random();
		String accessToken =  random.ints(97, 122)
									.limit(10)
									.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
									.toString();
		
		HttpSession session = request.getSession();
		session.setAttribute(accessToken, loginRequest.getEmail());
		// 로그인 유효시간 설정 (60 * 60 * 3) = 3시간
		session.setMaxInactiveInterval(60 * 60 * 3);
		if(accessToken != null) {
			session.setAttribute("login", true);
			session.setAttribute("dto", matchMember);
			session.setAttribute("email", loginRequest.getEmail());
		} else {
			session.setAttribute("login", false);
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("accessToken", accessToken);
		map.put("name", matchMember.getEmail());
		// map.put("name", matchMember.getMemberName());

		return map;
	}
	
	@DeleteMapping("/accessToken")
	public HashMap<String, String> logout(HttpServletRequest request, @ModelAttribute LogoutRequest logoutRequest, Model model) {
		String result = "true";
		try {
			HttpSession session = request.getSession();
			session.removeAttribute(logoutRequest.getAccessToken());
			session.setAttribute("login", false);
//			session.invalidate();
		} catch(Exception e) {
			result = "false";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", result);

		return map;
	}

	
	@PostMapping("/members")
	public HashMap<String, String> join(HttpServletRequest request, @ModelAttribute JoinRequest joinRequest, Model model) {
		String result = "true";
		try {
//			memberService.insertMember(joinRequest);
		} catch(Exception e) {
			result = "false";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", result);

		return map;
	}
}








