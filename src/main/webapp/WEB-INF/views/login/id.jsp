<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		$("#find_btn").click(function(){
			console.log("dd");
			var d = "memberName=" + $("#memberName").val() + "&tel=" + $("#tel").val();
			console.log(d);
			$.ajax({
				url: "find-id",
				data: d,
				dataType: "json",
				success: function(r){
					console.log(r);
					var tag = "";
					tag += '<p>' + r[0].memberName + '님의 이메일</p><br>'
					tag += '<input type="text" name="email" value="'+ r[0].email +'" readonly>';
					tag += '<a href="/login">로그인</a>'
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
			<div><input type="text" name="memberName" id="memberName" placeholder="이름" /></div>
			<div><input type="text" name="tel" id="tel" placeholder="휴대폰번호는 -를 제외하고 입력해주세요" /></div>
			<div class="result"></div>
		</div>
		<div class="btn_area">
			<button id="find_btn">아이디 찾기</button>
		</div>
	</div>
</div>

<!-- <script src="js/login/find.js"></script> -->