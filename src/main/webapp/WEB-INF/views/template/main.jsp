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
	<!-- Booking Section End -->
	
	<!-- Booking Section End -->
	<!-- Room List Section Start -->
	<div class="room-list-sec bg-gray pt-100 pb-70">
		<div class="container">
			<!-- Section Title Start -->
			<div class="row">
				<div class="col-md-6">
					<div class="sec-title">
						<h1>
							<span class="title_border"></span>객실.
						</h1>
						<p>객실소개</p>
					</div>
				</div>
			</div>
			<!-- Section Title End -->
			<div class="row">
				<!-- Single Room Start -->
				<c:forEach var="room" items="${requestScope.mainlist }">
				<input type="hidden" name="roomno" value="${room.roomNo }">
				<div class="col-md-4 col-sm-6">
					<div class="room-list-inner">
						<div class="room-list-img">
							<img src="${room.roomImage }" alt="" />
							<div class="room-list-img-overlay">
								<a href="#">${room.price }</a>
							</div>
						</div>
						<div class="room-list-text">
							<h4>${room.hotelName }</h4>
							<h2>
								<a href="#">${room.roomtype }</a><span class="room-rating"><i
									class="icofont-ui-rating"></i><i class="icofont-ui-rating"></i><i
									class="icofont-ui-rating"></i><i class="icofont-ui-rate-blank"></i><i
									class="icofont-ui-rate-blank"></i></span>
							</h2>
							<p>${room.roomSimpleManual }</p>
							<a href="bookingView.do?roomNo=${room.roomNo }&hotelNo=${room.hotelNo}" class="booking-btn">예약하기</a>
							<a href="insertWishlist.do?roomNo=${room.roomNo }&hotelNo=${room.hotelNo}" class="booking-btn">찜하기</a>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- Single Room End -->
				
			</div>
		</div>
	</div>
	<!-- Room List Section End -->
	<!-- Room Call To Action Section Start -->
	<div class="room-call-to-action-sec pt-100 pb-100">
		<div class="room-call-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-7">
					<div class="room-call-desc">
						<h1>이벤트 기간 예약 시</h1>
						<h1>
							<span class="border_left"></span>사은품을 증정해드립니다.
						</h1>
						<p>매번 사은품은 달라질 수 있습니다.</p>
					</div>
				</div>
				<div class="col-md-6 col-sm-5">
					<div class="room-discount">
						<h3 style="color:white;">이벤트 기간</h3>
						<h2 style="color:white;">10.01 ~ 10.31 </h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Room Call To Action Section End -->
	<!-- Service Section Start -->
	<div class="service-sec pt-100 pb-70">
		<div class="container">
			<!-- Section Title Start -->
			<div class="row">
				<div class="col-md-6">
					<div class="sec-title">
						<h1>
							<span class="title_border"></span> 편의 시설
						</h1>
						<p>고객님들의 편의를 위한 시설 내용입니다.</p>
					</div>
				</div>
			</div>
			<!-- Section Title End -->
			<div class="row">
				<!-- Single Service Start -->
				<div class="col-md-4 col-sm-6">
					<div class="service-inner">
						<h3>
							<a href="#"><span class="service-icon"><img
									src="img/icon/wifi.png" alt="" /></span><span class="service_border"></span>
									무료 와이파이</a>
						</h3>
						<p>저희 호텔은 와이파이를 무료로 제공해 고객님들의 편의를 최대화하고자 합니다.</p>
					</div>
				</div>
				<!-- Single Service End -->
				<!-- Single Service Start -->
				<div class="col-md-4 col-sm-6">
					<div class="service-inner">
						<h3>
							<a href="#"><span class="service-icon"><img
									src="img/icon/fruit.png" alt="" /></span><span class="service_border"></span>
									무료 조식</a>
						</h3>
						<p>09:00 부터 10:00 까지 카운터에 연락 주시어 조식 신청해주시면 방으로 직접 음식을 전달해드립니다.</p>
					</div>
				</div>
				<!-- Single Service End -->
				<!-- Single Service Start -->
				<div class="col-md-4 col-sm-6">
					<div class="service-inner">
						<h3>
							<a href="#"><span class="service-icon"><img
									src="img/icon/coffee.png" alt="" /></span><span class="service_border"></span>
								차/커피 메이커</a>
						</h3>
						<p>고객 님들이 이욯하시는 모든 객실에 차와 커피 메이커가 구비 되어 있으니 언제든지 향기로운 음료를 맛보세요.</p>
					</div>
				</div>
				<!-- Single Service End -->
				<!-- Single Service Start -->
				<div class="col-md-4 col-sm-6">
					<div class="service-inner">
						<h3>
							<a href="#"><span class="service-icon"><img
									src="img/icon/plalyground.png" alt="" /></span><span
								class="service_border"></span>어린이 놀이터</a>
						</h3>
						<p>아이와 함께한 가족들을 위해 아이들이 뛰어놀 수 있는 공간이 마련되어 있습니다.</p>
					</div>
				</div>
				<!-- Single Service End -->
				<!-- Single Service Start -->
				<div class="col-md-4 col-sm-6">
					<div class="service-inner">
						<h3>
							<a href="#"><span class="service-icon"><img
									src="img/icon/taxi.png" alt="" /></span><span class="service_border"></span>
								픽업 서비스</a>
						</h3>
						<p>인근 지역에 산책 나가거나 돌아오기 불편할 때 연락주세요. 픽업 해드립니다.</p>
					</div>
				</div>
				<!-- Single Service End -->
				<!-- Single Service Start -->
				<div class="col-md-4 col-sm-6">
					<div class="service-inner">
						<h3>
							<a href="#"><span class="service-icon"><img
									src="img/icon/waiter.png" alt="" /></span><span class="service_border"></span>
								항시 대기 서비스</a>
						</h3>
						<p>저희 직원들은 각자 담당 룸이 배치되어 있으며 24시간 대기중이니 위급한 상황이나 필요한 것이 있을 시에 언제든지 연락주세요.</p>
					</div>
				</div>
				<!-- Single Service End -->
			</div>
		</div>
	</div>
	<!-- Service Section End -->
	<!-- About V2 Section Start -->
	<div class="about-v2-sec pt-100 pb-100">
		<div class="about-v2-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-7">
					<div class="about-v2-desc">
						<h1>저희의 호텔을 </h1>
						<h1>
							<span class="border_left"></span>영상으로 만나보세요.
						</h1>
					</div>
				</div>
				<div class="col-md-6 col-sm-5">
					<div class="video-inner">
						<div class="vedio-button">
							<a href="https://youtu.be/VqyDvsaoEpw"
								class="mfp-iframe vedio-play"><i class="fa fa-play"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About V2 Section End -->
	<!-- Room Gallary Section Start -->
	<div class="room-gallary-v2-sec pt-100 pb-70">
		<div class="container">
			<!-- Section Title Start -->
			
			<!-- Section Title End -->
			
			
				
				</div>
			</div>
		</div>
	</div>
	<!-- Room Gallary Section End -->
</body>
</html>