<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#findpass_btn").click(function(){
			var d = "email=" + $("#email").val() + "&memberName=" + $("#memberName").val() + "&tel=" + $("#tel").val();
			console.log(d);
			$.ajax({
				url: "find-pass",
				data: d,
				dataType: "json",
				success: function(r){
					var tag = "";
					tag += '<p>새 비밀번호 변경</p><br>'
					tag += '<form action="updatePasswd.do" method="post"><input type="text" name="email" value="'+ r[0].email +'"><br>';
					tag += '<input type="password" name="password" placeholder="새 비밀번호 입력"><br>';
					tag += '<input type="password" name="password_chk" placeholder="비밀번호 확인"><br>';
					tag += '<div class="btn_area"><button type="submit">비밀번호 변경</button></div></form>';
					$(".result").html(tag);
				}
			})
		})
	});
</script>
<div class="input_wrap">
	<div class="title">${title }</div>
	<div class="semi_title">가입정보를 입력하시면 아이디를 확인하실 수 있습니다.</div>
	<div class="login_area">
		<div class="input_area">
			<div><input type="text" name="email" id="email" placeholder="아이디(이메일)" /></div>
			<div><input type="text" name="memberName" id="memberName" placeholder="이름" /></div>
			<div><input type="text" name="tel" id="tel" placeholder="휴대폰번호는 -를 제외하고 입력하세요" /></div>
			<div class="result"></div>
		</div>
		<div class="btn_area">
			<button id="findpass_btn">비밀번호 찾기</button>
		</div>
	</div>
</div>

<!-- <script src="js/login/find.js"></script> -->