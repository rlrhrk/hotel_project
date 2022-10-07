<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="input_wrap">
	<div class="title">${title }</div>
	<div class="login_area">
		<div class="input_area">
			<div><input id="email" type="text" placeholder="이메일" /></div>
			<div><input id="password" type="password" placeholder="비밀번호" /></div>
			<div><input id="passwordConfirm" type="password_confirm" placeholder="비밀번호 확인" /></div>
			<div><input id="name" type="text" placeholder="이름" /></div>
			<div class="left gender_wrap">
				<label>남</label><input type="radio" name="gender" id="gender" value="m" />
				<label>여</label><input type="radio" name="gender" id="gender" value="w" />
			</div>
			<div><input id="birth" type="date" placeholder="생년월일" /></div>
			<div><input id="tel" type="text" placeholder="전화번호" /></div>
			<div><input id="address" type="text" placeholder="주소" /></div>
		</div>
		<div class="btn_area">
			<button id="join_btn">회원가입</button>
		</div>
	</div>
</div>


<script src="js/join/join.js"></script>