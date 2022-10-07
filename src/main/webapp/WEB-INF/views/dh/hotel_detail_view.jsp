<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c107017d3c78a41473933d3434b2865b"></script>
<style>
	.tab-container {
		display: flex;
		justify-content: center;
		padding: 150px 0px;
	}
	.tab-container ul{
		height: 30px;
		border-bottom: none;
	}
	.tab-container ul li {
		height: 30px;
	}
	.tab-container button {
		width: 200px;
		height: 30px;
	}
	.tab-content {
		display: flex;
		justify-content: center;
	}
	#map {
		margin: 50px auto;
	}
	.result {
		width: 600px;
		margin: 40px auto;
	}
	.hotelView-container {
		width: 1200px;
		margin: 0 auto;
		border: 1px solid black; 
		background-image: url(img/slider-1);
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".nav-link:eq(0)").addClass("active");
		$(".tab-pane:eq(0)").addClass("active");
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.559965,126.942345), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
		};
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.559965,126.942345); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null); 	
		$(".result").html("교통편설명");
		$(".nav-link").click(function(){
			var name = $(this).text();
			console.log(name);
			if(name == "TEST1호텔") {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.559965,126.942345), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
				};
			
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.559965,126.942345); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null); 
				$(".result").html("교통편설명");
			}else if(name == "TEST2호텔") {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.497897,127.027622), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
				};
			
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.497897,127.027622); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null); 
				$(".result").html("교통편설명");
			}else if(name == "TEST3호텔") {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.558271,126.925558), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
				};
			
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.558271,126.925558); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null); 
				$(".result").html("교통편설명");
			}
		});
		
	});
</script>
</head>
<body>
	<div class="hotelView-container">
	<!-- Nav tabs -->
	<div class="tab-container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
	<c:forEach var="hotel" items="${requestScope.hotellist }">
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="home-tab" data-bs-toggle="tab" data-bs-target="#${hotel.hotelNo }" type="button" role="tab" aria-controls="home" aria-selected="true">${hotel.hotelName }</button>
		  </li>
		 <!--  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">강남점</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="messages-tab" data-bs-toggle="tab" data-bs-target="#messages" type="button" role="tab" aria-controls="messages" aria-selected="false">홍대점</button>
		  </li> -->
	</c:forEach>
		</ul>
	</div>
	<!-- Tab panes -->
	<div class="tab-content">
	<!-- 신촌점 -->
	<c:forEach var="hotel" items="${requestScope.hotellist }">
	  <div class="tab-pane" id="${hotel.hotelNo }" role="tabpanel" aria-labelledby="home-tab">
	  	<div><p>지점명 : </p><p class="hotelname">${hotel.hotelName }</p></div>
	  	<div><img alt="" src="${hotel.hotelImage }"></div>
	  	<div><p>지점전화번호 : </p>${hotel.hotelTel }</div>
	  	<div><p>호텔 상세소개 : </p>${hotel.hotelDetailManual }</div>
	  	<div><p>주소 : </p>${hotel.hotelAddress }</div>
	  </div>
	</c:forEach>
	</div>
	<div id="map" style="width:800px;height:400px;"></div>
	<p class="result"></p>
	</div>
</body>
</html>