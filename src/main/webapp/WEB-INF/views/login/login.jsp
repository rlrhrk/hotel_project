<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="login_wrap">
	<div class="title">${title }</div>
	<div class="login_area">
		<div class="input_area">
			<div><input id="email" type="text" placeholder="아이디 (이메일)" /></div>
			<div><input id="password" type="password" placeholder="비밀번호" /></div>
		</div>
		<div class="link_wrap">
			<a href="/find-id-view">아이디(이메일) 찾기</a> <span>|</span> <a href="/find-pass-view">비밀번호 찾기</a>
		</div>
		<div class="btn_area">
			<button id="login_btn">로그인</button>
		</div>
	</div>
</div>

<script src="js/login/login.js"></script>
<script src="js/header.js"></script>