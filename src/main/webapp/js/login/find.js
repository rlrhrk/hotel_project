$(function() {
	// 찾기 버튼 클릭
	$(document).on('click', '#find_btn', function(e) {
		let type = $(e.target).data('type');
		$('input').each((i, v) => {
			let $target = $(v);
			if (!$target.val()) {
				alert(`입력항목을 확인해주세요 : ${$target.attr('placeholder')}`);
				$target.focus();
				return false;
			}
		});
		
		window[`find_${type}`]();
		
	});
});

function find_id() {
	
}

function find_pw() {
}