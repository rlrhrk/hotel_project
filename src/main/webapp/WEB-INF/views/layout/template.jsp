<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="icon" type="image/png" href="img/favicon.png">
<!-- Apple Touch Icons -->
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57"
	href="img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="img/apple-touch-icon-144x144.png"> 
<link rel="apple-touch-icon" sizes="152x152"
	href="img/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="img/apple-touch-icon-180x180.png">
<!-- Stylesheets Start -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/icofont.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/meanmenu.min.css">
<link rel="stylesheet" href="css/responsive.css">
<!-- <script type="text/javascript">
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
</script> -->
</head>
<body>
	<jsp:include page="../template/header.jsp" />
	<jsp:include page="../template/slider.jsp" />
	<div id="body_content">
		<jsp:include page="../${page }.jsp" />
	</div>
	<jsp:include page="../template/footer.jsp" />
	
	
	<!-- Scripts Js Start -->
	<script src="js/jquery-latest.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/owl.animate.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.meanmenu.min.js"></script>
	<script src="js/jquery.countdown.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script
		src="http://ditu.google.cn/maps/api/js?key=AIzaSyAJdanixi2Nzt7V-XXzo22neY4Eso8DXCQ"></script>
	<script src="js/custom.js"></script>
	<!-- Scripts Js End -->
</body>
</html>