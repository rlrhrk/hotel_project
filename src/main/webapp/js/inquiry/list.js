$(function() {
	// 문의 제목 클릭
	$(document).on('click', '.title_line', function(e) {
		let $parents = $(e.target).parents('.content_area');
		$parents.find('.content').toggle();
	});
	
	// 문의 작성 클릭
	$(document).on('click', '#inquiry_btn', function(e) {
		location.href = '/inquiry-form';
	});
});