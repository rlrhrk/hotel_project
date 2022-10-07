$(function() {
	// 로그인 버튼 클릭
	$(document).on('click', '#login_btn', function(e) {
		let inputs = {'email':'아이디(이메일)', 'password':'비밀번호'};
		let data = {};
		$.each(inputs, (i, v) => {
			if (!$(`#${i}`).val()) {
				alert(`${v}를 입력해주세요.`);
				$(`#${i}`).focus();
				return false;
			}
			
			data[i] = $(`#${i}`).val();
		});
		
		$.ajax({
			type: 'POST',
			url: '/accessToken',
			data: data,
			success: function(data) {
				if (!!data) {
					let date = new Date();
				  	date.setDate(date.getDate() + 1);
				  	console.log(data.name);
				  	console.log(data.accessToken);
				  	makeCookie('accessToken', data.accessToken, date);
				  	makeCookie('name', data.name, date);
					console.log(getCookie('accessToken'));
					alert('로그인 되었습니다.');
					location.href = '/';
				}
			}
		});
	});

});