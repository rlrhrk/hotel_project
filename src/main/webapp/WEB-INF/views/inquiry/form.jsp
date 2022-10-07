<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="input_wrap">
	<div class="title">${title }</div>
	<div class="login_area">
		<div class="input_area">
			<div><input id="title" class="form_data" type="text" placeholder="제목" /></div>
			<div><textarea id="content" class="form_data" placeholder="내용"></textarea></div>
		</div>
		<div class="btn_area">
			<button id="register_btn">등록</button>
		</div>
	</div>
</div>


<script src="js/inquiry/form.js"></script>