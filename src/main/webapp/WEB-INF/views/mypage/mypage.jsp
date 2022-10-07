<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="input_wrap">
	<div class="title">${title }</div>
	<div class="mypage_area">
		<div class="btn_area no-margin-top">
			<button class="mypage_btn" id="like_btn">찜</button>
			<button class="mypage_btn" id="inquiry_write_btn">1:1 문의하기</button>
			<button class="mypage_btn" id="inquiry_btn">1:1 문의내역</button>
			<button class="mypage_btn" id="review_btn">리뷰내역</button>
			<button class="mypage_btn" id="find-id_btn">아이디찾기</button>
			<button class="mypage_btn" id="find-pass_btn">비밀번호찾기</button>
			<button class="mypage_btn" id="updateMeber_btn">회원정보수정</button>
		</div>
	</div>
</div>

<script>
	$(() => {
		$(document).on('click', '#like_btn', function(e) {
			alert('찜');
		});
		
		$(document).on('click', '#inquiry_write_btn', function(e) {
			location.href = '/inquiry-form';
		});
		
		$(document).on('click', '#inquiry_btn', function(e) {
			location.href = '/inquiry-list';
		});
		
		$(document).on('click', '#review_btn', function(e) {
			alert('리뷰내역');
		});
		
		$(document).on('click', '#find-id_btn', function(e) {
			location.replace("find-id-view");
			alert('아이디찾기');
		});
		
		$(document).on('click', '#find-pass_btn', function(e) {
			location.replace("find-pass-view");
			alert('비밀번호찾기');
		});
		
		$(document).on('click', '#updateMember_btn', function(e) {
			location.replace("updateMember-view");
			alert('회원정보수정');
		});
	});
</script>