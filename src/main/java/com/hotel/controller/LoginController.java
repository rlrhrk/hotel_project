package com.hotel.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.dto.MemberDTO;
import com.hotel.service.MemberService;

@Controller
public class LoginController {
	private String folder = "login/";
	MemberService memberservice;
	
	
	public LoginController(MemberService memberservice) {
		this.memberservice = memberservice;
	}

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("title", "로그인");
		model.addAttribute("page", makeFileName("login"));

		return "layout/template";
	}
	
	@RequestMapping("/find-id-view")
	public String findIdView(Model model) {
		model.addAttribute("title", "아이디 찾기");
		model.addAttribute("page", makeFileName("id"));

		return "layout/template";
	}
	
	@RequestMapping("find-id")
	public ResponseEntity<List<MemberDTO>> findId(String memberName, String tel) {
//		System.out.println(memberName + " " + tel);
		List<MemberDTO> memberlist = memberservice.selectMemberId(memberName, tel);
//		System.out.println(memberlist.toString());
		return ResponseEntity.ok(memberlist);
	}
	
	@RequestMapping("/find-pass-view")
	public String findPwView(Model model) {
		model.addAttribute("title", "비밀번호 찾기");
		model.addAttribute("page", makeFileName("pw"));

		return "layout/template";
	}
	
	@RequestMapping("find-pass") 
	public ResponseEntity<List<MemberDTO>> findPass(String email, String memberName, String tel) {
		System.out.println(email + memberName + tel);
		List<MemberDTO> memberlist = memberservice.selectMemberPass(email, memberName, tel);
		return ResponseEntity.ok(memberlist);
	}
	
	@RequestMapping("/updatePasswd.do")
	public String updatePasswd(String email, String password) {
		memberservice.updatePasswd(email, password);
		return "redirect:/login";
	}
	
	@RequestMapping("/updateMember-view")
	
	private String makeFileName(String fileName) {
		return folder + fileName;
	}
	
	
}








