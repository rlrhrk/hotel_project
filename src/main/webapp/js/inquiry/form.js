$(function() {
	// 문의 작성 클릭
	$(document).on('click', '#register_btn', function(e) {
		let data = {};
		
		$('.form_data').each((i, v) => {
			if (!$(v).val()) {
				alert(`입력항목을 확인해주세요 : ${$(v).attr('placeholder')}`);
				return false;
			}
			
			data[$(v).attr('id')] = $(v).val();
		});
		
		$.ajax({
			type: 'POST',
			url: '/inquirys',
			data: data,
			success: function(data) {
				if (!!data && data.result === 'true') {
					alert('1:1문의가 정상적으로 등록되었습니다.');
					location.href = '/inquiry-list';
				}
			}
		});
	});
});