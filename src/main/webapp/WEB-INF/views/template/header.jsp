<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<!-- Header Start -->
	<header>
		<!-- Main Bar Start -->
		<div class="hd-sec">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row nav-menu-bar">
							<!-- Logo Start -->
							<div class="col-md-3 col-sm-3 col-xs-8">
								<div class="logo">
									<a href="/"><img src="img/logo1.png" alt="" /></a>
								</div>
							</div>
							<!-- Logo End -->
							<!-- Main Menu Start -->
							<div class="mobile-nav-menu"></div>
							<div class="col-md-7 col-sm-6 nav-menu">
								<div class="menu">
									<nav id="main-menu" class="main-menu">
										<ul>
											<li class="active"><a href="hotelDetailView.do">호텔소개</a>
											<ul>
													<li><a href="hotelDetailView.do">호텔지점소개</a></li>
													<li><a href="roomDetailView.do">객실정보</a></li>
												</ul></li>
											<li><a href="diningView.do">다이닝</a>
											</li>
											<li><a href="searchRoom.do">예약하기</a>
											</li>
											<li><a href="wishlist.do">위시리스트</a></li>
											<li><a href="inquiry-form">문의하기</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<!-- Main Menu End -->
							<!-- Main Apply Button Start -->
							<div class="col-md-2 col-sm-3 applay-button-area">
							<%
						boolean flag = false;
						if(session.getAttribute("login") != null) {
							flag = (boolean)session.getAttribute("login");							
						}
						if(flag){
						%>
						<a href="mypage"><p>${sessionScope.email }님 환영합니다.</p></a>
						<c:if test="${sessionScope.email == 'test' }">
							<div class="applay-button">
								<a id="logout_btn"><span class="lnr lnr-phone-handset"></span>로그아웃</a>
							</div>
						</c:if>
						<c:if test="${sessionScope.email != 'test' }">
							<div class="applay-button">
								<a id="logout_btn"><span class="lnr lnr-phone-handset"></span>로그아웃</a>
							</div>
						</c:if>
						<%
						} else {
						%>
						<div class="applay-button">
							<a href="/login"><span class="lnr lnr-phone-handset"></span>로그인</a>
						</div>
						<%
						}
						%>
								
							</div>
							<!-- Main Apply Button End -->
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Main Bar End -->
	</header>
	<!-- Header End -->
	<script src="js/header.js"></script>
</body>
</html>