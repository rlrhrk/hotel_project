<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
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
</head>
<body>
	<!-- header -->
	<jsp:include page="../template/header.jsp"></jsp:include>
	<div class="pagehding-sec">
		<div class="breadcrumb-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-heading">
						<h1>위시리스트</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Heading Section End -->
	<!-- Blog Section Start -->
		<%
			boolean flag = false;
			if(session.getAttribute("login") != null) {
				flag = (boolean)session.getAttribute("login");							
			}
			if(flag){
		%>
	<div class="blog-sec pt-100 pb-70">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
				<c:forEach var="wishlist" items="${requestScope.wishlist }">
					<div class="col-md-6 col-sm-6">
						<div class="sngl-blg">
							<div class="sngl-blg-img">
								<img src="${wishlist.roomimage }" alt="" />
							</div>
							<div class="sngl-blg-dsc">
								<ul>
									<li><i class="icofont-calendar"></i>1박</li>
									<li><i class="icofont-speech-comments"></i>${wishlist.price }</li>
								</ul>
								<h2 class="blg-title">
								<c:if test="${wishlist.hotelNo == 'H001'}" ><p>HO1TEL</p></c:if>
								<c:if test="${wishlist.hotelNo == 'H002'}" ><p>HO2TEL</p></c:if>
								<c:if test="${wishlist.hotelNo == 'H003'}" ><p>HO3TEL</p></c:if>
									<a href="#">${wishlist.roomType }</a>
								</h2>
								<p>${wishlist.roomsimplemanual }</p>
								<a href="bookingView.do?roomNo=${wishlist.roomNo }&hotelNo=${wishlist.hotelNo}" class="rdmoreBtn">예약하기<i
									class="icofont-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
				</c:forEach>	
				</div>
			</div>
		</div>
	</div>
		<%
			}else {
		%>
				<script>
					alert("로그인을 하셔야 이용할수 있습니다.");
					location.href="/login";
				</script>
		<%
		} 
		%>
	<!-- Blog Section End -->
	<!-- footer -->
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