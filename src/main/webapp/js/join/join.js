$(function() {
	// 회원가입 버튼 클릭
	$(document).on('click', '#join_btn', function(e) {
		let inputs = ['email', 'password', 'name', 'gender', 'birth', 'tel', 'address'];
		let data = {};
		
		// 유효성 체크
		if (!validation(inputs)) {
			return false;
		}
		
		$.ajax({
			type: 'POST',
			url: '/members',
			data: data,
			success: function(data) {
				if (!!data && data.result === 'true') {
					alert('회원가입이 정상적으로 완료되었습니다.');
					location.href = '/login';
				}
			}
		});
	});
});

let validation = (inputs) => {
	let valid = true;
	if ($('#password').val() !== $('#passwordConfirm').val()) {
		alert('비밀번호가 일치하지 않습니다.');
		valid = false;
		return false;
	}
	
	$.each(inputs, (i, v) => {
		let $target = $(`#${v}`);
		if ($target.attr('type') === 'radio') {
			if (!$(`[name=${$target.attr('name')}]:checked`).val()) {
				alert(`입력항목을 확인해주세요 : 성별`);
				$target.focus();
				valid = false;
				return false;
			}
			
		} else {
			if ($target.val() === '') {
				alert(`입력항목을 확인해주세요 : ${$target.attr('placeholder')}`);
				$target.focus();
				valid = false;
				return false;
			}
		}
	});
	
	return valid;
}