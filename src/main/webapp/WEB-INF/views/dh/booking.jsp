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
<script type="text/javascript">
	$(function() {
		var price = parseInt($('#defaultprice').text());
		var total = $('input[name="total"]').val();

		$('input[name="price"]').val(price);

		$(".btn_down").click(function() {
			if (total == 1) {
				alert("최소인원보다 적은 인원은 설정할 수 없습니다.");
				return;
			}
			total = $('input[name="total"]').val() - 1;
			var plus = (total - 2) * 20000;
			console.log(price);
			$('input[name="total"]').val(total);
			if (total == 2)
				$('input[name="price"]').val(price);
			if (total > 2) {
				$('input[name="price"]').val(price + plus);
			}

		});

		$(".btn_up").click(function() {
			total = parseInt($('input[name="total"]').val()) + 1;
			var plus = (total - 2) * 20000;
			console.log(plus);
			$('input[name="total"]').val(total);
			if (total > 2) {
				$('input[name="price"]').val(price + plus);
			}

		});
	});
</script>
</head>
<body>
	<jsp:include page="../template/header.jsp"></jsp:include>
	<!-- Preloader Start -->
	<div id="preloader">
		<div id="preloader-status"></div>
	</div>
	<!-- Preloader End -->
	<!-- Page Heading Section Start -->
	<div class="pagehding-sec">
		<div class="breadcrumb-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-heading">
						<h1>객실 예약</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Heading Section End -->
	<!-- Blog Details Section Start -->

	<div class="blog-details-sec pt-100 pb-70">
		<div class="container">
			<div class="row">
				<c:forEach var="booking" items="${requestScope.roomlist }">
					<div class="col-md-8">
						<div class="blog-details-desc">
							<div class="blog-details-meta">
								<img src="${booking.roomimage }" alt="" />
								<ul>
									<li>1박요금</li>
									<li id="defaultprice">${booking.price }</li>
								</ul>
							</div>
							<h2>${booking.roomType }</h2>
							<p>객실 옵션부분</p>

							<div class="comment-title">
								<h2>${booking.roomsimplemanual }</h2>
							</div>
							<div class="commenter-sec">
								<div class="single-commenter">
									<div class="media">

										<div class="media-body">
											<div class="commenter-info">
												<h4>
													${booking.roomType } <span class="replay-button"></span>
												</h4>
												<p>${booking.roomdetailmanual }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Comment Input Section Start-->

						<!-- Comment Input Section End-->
					</div>
					<div class="col-md-4">
						<div class="sidebar">
							<div>
								<form action="booking.do">
									<input type="hidden" name="email"
										value="${sessionScope.email }">
									<h3>예약정보</h3>
									<h4>날짜선택</h4>
									<!-- <input type="text" name="checkInOut" style="width: 200px;">
								<script>
									$('input[name="checkInOut"]').daterangepicker();
								</script> -->
									<jsp:include page="dateform.jsp"></jsp:include>
									<hr>
									<label>${booking.hotelName }</label><br> <label>${booking.roomType }</label>
									<input type="hidden" name="roomNo" value="${booking.roomNo }">
									<h4>인원</h4>
									<button type="button" class="btn_down" style="width: 30px;">-</button>
									<input type="number" name="total" value="2" readonly="readonly"
										style="width: 40px; text-align: right; border: 1px solid black;">
									<button type="button" class="btn_up" style="width: 30px;">+</button>
									<br> <input type="text" name="price" value=""
										style="width: 250px;" readonly><br>
									<button type="submit" style="margin-top: 10px;">예약하기</button>
								</form>
							</div>
						</div>
					</div>

				</c:forEach>
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