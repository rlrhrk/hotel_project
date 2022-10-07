<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 예약</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/icofont.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/meanmenu.min.css">
<link rel="stylesheet" href="/css/responsive.css">
</head>
<style>
.col-xs-12 {
	width: 180px;
}

.col-good-12 {
	width: 220px;
}

.law {
	padding-left: 200px;
}
.wishlist-btn{
	padding: 11px 18px;
	margin-left : 5px;
    background: #af9a7d;
    color: #fff;
    display: inline-block;
    margin-top: 10px;
}
</style>
<script>
	$(function(){
		$("#search").click(function(){
			var d = $("#searchForm").serialize();
			$.ajax({
				url : "search.do",
				data : d,
				dataType: "json",
				success:function(r){
					var tag = '';
					for(i=0;i<r.length;i++){
						tag += '<div class="col-md-4 col-sm-6"><div class="room-list-inner">';
						tag += '<div class="room-list-img"><img src="'+r[i].roomimage+'">';
						tag += '<div class="room-list-img-overlay">';
						tag += '<a href="#">"'+r[i].price+'"</a></div></div>';
						tag += '<div class="room-list-text"><h4>'+r[i].hotelName+'</h4><h2><a href="#">"'+r[i].roomType+'"</a>';
						tag += '<span class="room-rating"><i class="icofont-ui-rating"></i>';
						tag += '<i class="icofont-ui-rating"></i><i class="icofont-ui-rating"></i>';
						tag += '<i class="icofont-ui-rate-blank"></i><i class="icofont-ui-rate-blank"></i></span></h2>';
						tag += '<input type="hidden" name="roomNo" value="'+r[i].roomNo+'">';
						tag += '<input type="hidden" name="hotelNo" value="'+r[i].hotelNo+'">';
						tag += '<p>"'+r[i].roomsimplemanual+'"</p><a class="booking-btn" id="booking-btn">예약하기</a>';
						tag += '<a class="wishlist-btn">찜하기</a></div></div></div></div>';
					}
					console.log(d);
					$(".search_result").html(tag);
					$(".booking-btn").click(function(){
						var h = $(this).parent().find("input[name=roomNo]").val();
						if(${sessionScope.login} == false) {
							alert("로그인이 필요합니다.");
							location.href = "/login";
						}else{
							location.href = "/bookingView.do?roomNo=" + h;
							console.log(h);
						}
					});
					$(".wishlist-btn").click(function(){
						var h = $(this).parent().find("input[name=roomNo]").val();
						h += "&hotelNo=";
						h += $(this).parent().find("input[name=hotelNo]").val();
						if(${sessionScope.login} == false) {
							alert("로그인이 필요합니다.");
							location.href = "/login";
						}else{
							location.href = "/insertWishlist.do?roomNo="+h;
							console.log(h);
						}
					});
				}
			});
		});
		$(".booking-btn").click(function(){
			var h = $(this).parent().find("input[name=roomNo]").val();
			if(${sessionScope.login} == false) {
				alert("로그인이 필요합니다.");
				location.href = "/login";
			}else{
				location.href = "/bookingView.do?roomNo=" + h;
				console.log(h);
			}
		});
		$(".wishlist-btn").click(function(){
			var h = $(this).parent().find("input[name=roomNo]").val();
			h += "&hotelNo=";
			h += $(this).parent().find("input[name=hotelNo]").val();
			console.log(h);
			if(${sessionScope.login} == false) {
				alert("로그인이 필요합니다.");
				location.href = "/login";
			}else{
				location.href = "/insertWishlist.do?roomNo=" + h;
				console.log(h);
			}
		});
	});
</script>
<body>
	<jsp:include page="../template/header.jsp"></jsp:include>
	<jsp:include page="../template/slider.jsp"></jsp:include>
	<div class="booking-sec">
		<div class="container">
			<div class="row law">
				<form id="searchForm">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						<div class="single-field">
							<select name="hotelNo">
								<c:forEach var="hotel" items="${requestScope.hotel }">
									<option value="${hotel.hotelNo }">${hotel.hotelName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						<div class="single-field calendar-icon">
							<input type="text" name="checkIn" id="arrival-date" size="30"
								placeholder="Check In" class="calendar-icon">
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						<div class="single-field calendar-icon">
							<input type="text" name="checkOut" id="outgoing-date" size="30"
								placeholder="Check Out">
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-good-12">
						<div class="single-field" id="searchRoom">
							<input id="search" type="button" value="예약 가능 객실 검색" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Booking Section End -->
	<!-- Room List Section Start -->
	<div class="room-list-sec bg-gray pt-100 pb-70">
		<div class="container">
			<!-- Section Title Start -->
			<div class="row">
				<div class="col-md-6">
					<div class="sec-title">
						<h1>
							<span class="title_border"></span>객실
						</h1>
						<p>객실소개</p>
					</div>
				</div>
			</div>
			<!-- Section Title End -->
			<div class="row">
				<!-- Single Room Start -->
				<div class="search_result">
				</div>
				<!-- Single Room End -->

			</div>
		</div>
		</div>
	<!-- Event Details Section Start -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
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