$(function() {
	let accessToken = getCookie('accessToken');
	if (!!accessToken) {
		loginHeader();
	} else {
		logoutHeader();
	}
	
	$(document).on('click', '#logout_btn', function(e) {
		let accessToken = getCookie('accessToken');
		$.ajax({
			type: 'DELETE',
			url: '/accessToken',
			data: {'accessToken': accessToken},
			success: function(data) {
				if (data.result === 'true') {
					alert('로그아웃 되었습니다.');
					logoutHeader();
					location.href = '/';
				}
			}
		});
	});
});

function loginHeader() {
	let name = getCookie('name');
	$('#mypage_btn').text(`${name} 님`);
	$('.header_btn_area.logout').hide();
	$('.header_btn_area.login').show();
}

function logoutHeader() {
	let now = new Date();
	makeCookie('accessToken', '', now);
	makeCookie('name', '', now);
	$('.header_btn_area.logout').show();
	$('.header_btn_area.login').hide();
}

function makeCookie(cookie_name, value, date) {
	document.cookie = `${cookie_name}=${value};expires=${date.toUTCString()}`;
}

function getCookie(cookie_name) {
  var x, y;
  var val = document.cookie.split(';');

  for (var i = 0; i < val.length; i++) {
    x = val[i].substr(0, val[i].indexOf('='));
    y = val[i].substr(val[i].indexOf('=') + 1);
    x = x.replace(/^\s+|\s+$/g, '');
    if (x == cookie_name) {
      return unescape(y);
    }
  }
}