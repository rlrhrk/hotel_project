<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dining</title>
<meta name="keywords" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="tab/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="tab/css/style.css">
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="tab/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="tab/css/custom.css">
<style type="text/css">
.resbooking-bt {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.resbooking-bt:hover {
	background: #fff;
	color: #1AAB8A;
}

.resbooking-bt:before, .resbooking-bt:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.resbooking-bt:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.resbooking-bt:hover:before, .resbooking-bt:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.restaurantType {
	width: 150px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
	
	
	
	function loginCheck(){
		var bookingDate = $("input[name=bookingDate]").val();
		var hotelNo = $("select[name=hotelNo]").val();
		var restaurantType = $("select[name=restaurantType]").val();
		var mealType = $("select[name=mealType]").val();
		var personCount = $("select[name=personCount]").val();
		var email = '<%=(String)session.getAttribute("email")%>';
		if(email === ""){
		alert("???????????? ???????????????");
		return false;
		}
		else if (bookingDate == ""){
		alert("????????? ???????????????");
		return false;
		}
		else if (hotelNo == ""){
		alert("????????? ???????????????");
		return false;
		}
		else alert("????????? ??????????????????")
		/* else{
		document.getElementById("booking-restaurant").innerHTML= '<div class="booking-restaurant"><div class="container"><div class="row"><form action="resbooking.do" id="resbooking" ><div id="restaurantPriceInput"></div><div id="restaurantNoInput"></div><div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><div class="single-field calendar-icon"><input type="text" id="arrival-date" name="bookingDate" size="30"placeholder="????????????" class="calendar-icon" value="1"/></div></div><div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><div class="single-field"><div class="select-arrow"><select name="hotelNo"><option value="(null)">????????????</option><c:forEach var="hotel" items="${requestScope.hotellist }"><option value="${hotel.hotelName }">${hotel.hotelName }</option></c:forEach></select></div></div></div><div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><div class="single-field"><div class="select-arrow"><select name="restaurantType" onchange="sendRestaurantPrice()"><option value="5">????????????</option><option value="??????????????????">??????????????????</option><option value="??????????????????">??????????????????</option><option value="??????????????????">??????????????????</option></select></div></div></div><div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><div class="single-field"><div class="select-arrow"><select name="mealType"><option value="(null)">????????????</option><option value="??????">??????</option><option value="??????">??????</option><option value="??????">??????</option></select></div></div></div><div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><div class="single-field"><div class="select-arrow"><select name="personCount"><option value="(null)">?????????</option><option value="1">1???</option><option value="2">2???</option><option value="3">3???</option><option value="4">4???</option><option value="5">5???</option></select></div></div></div><div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><div class="single-field"><input type="hidden" name="email" value="${sessionScope.email }"><input type="submit" value="????????????" onclick="alert("????????? ?????????????????????")"/></div></div></form></div></div></div>';
		} */
	};
	
	
</script>
</head>
<body>
	<!-- Room List Section Start -->
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="menu-box">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="heading-title text-center">
								<h2>????????????</h2>
								<p>???????????? ???????????? ???????????? ????????? ????????? ????????? ????????? ????????? ???????????? ???????????????</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="special-menu text-center">
								<div class="button-group filter-button-group">
									<button class="active" data-filter="*">????????????</button>
									<c:forEach var="hotel" items="${requestScope.hotellist }">
										<button data-filter=".${hotel.hotelName }">${hotel.hotelName }</button>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

						<div id="booking-restaurant"></div>
					<div class="booking-restaurant">
						<div class="container">
							<div class="row">
								<form action="resbooking.do" id="resbooking" >
									<div id="restaurantPriceInput"></div>
									<div id="restaurantNoInput"></div>
									<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
										<div class="single-field calendar-icon">
											<input type="text" id="arrival-date" name="bookingDate" size="30"
												placeholder="????????????" class="calendar-icon" value="1"/>
										</div>
										
									</div>
									<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
										<div class="single-field">
											<div class="select-arrow">
												<select name="hotelNo" id="hotelNo">
													<option value="(null)">????????????</option>
												<c:forEach var="hotel" items="${requestScope.hotellist }">
														<option value="${hotel.hotelNo }">${hotel.hotelName }</option>													
												</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
										<div class="single-field">
											<div class="select-arrow restaurantType">
												<select>
													<option>????????????</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
										<div class="single-field">
											<div class="select-arrow">
												<select name="mealType">
													<option value="(null)">????????????</option>
													<option value="??????">??????</option>
													<option value="??????">??????</option>
													<option value="??????">??????</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
										<div class="single-field">
											<div class="select-arrow">
												<select name="personCount">
													<option value="(null)">?????????</option>
													<option value="1">1???</option>
													<option value="2">2???</option>
													<option value="3">3???</option>
													<option value="4">4???</option>
													<option value="5">5???</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
										<div class="single-field">
											<input type="hidden" name="email" value="${sessionScope.email }">
											<input type="submit" value="????????????" onclick="loginCheck()"/> 
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

					<div class="row special-list">
						<c:forEach var="restaurant"
							items="${requestScope.restaurantlist }">
							<div
								class="col-lg-6 col-md-6 special-grid ${restaurant.hotelName }">
								<div class="gallery-single fix">
									<img src="${restaurant.restaurantImagepath }" class="img-fluid"
										alt="Image">
									<div class="why-text">
										<h5>${restaurant.restaurantNo }</h5>
										<h5>${restaurant.hotelName }</h5>
										<h5>${restaurant.restaurantType }</h5>
										<h5>??????:${restaurant.restaurantPrice }</h5>
										<button class="resbooking-bt" id="resbooking-bt">
											????????????</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- ALL JS FILES -->
	<script src="tab/js/jquery-3.2.1.min.js"></script>
	<script src="tab/js/popper.min.js"></script>
	<script src="tab/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="tab/js/jquery.superslides.min.js"></script>
	<script src="tab/js/images-loded.min.js"></script>
	<script src="tab/js/isotope.min.js"></script>
	<script src="tab/js/baguetteBox.min.js"></script>
	<script src="tab/js/form-validator.min.js"></script>
	<script src="tab/js/contact-form-script.js"></script>
	<script src="tab/js/custom.js"></script>
	<script type="text/javascript">
	$("#hotelNo").click(function(){
		var d = "hotelNo=" + $("#hotelNo").val();
		console.log('asd');
		console.log(d);			
		$.ajax({
			url: "selectRestaurantType.do",
			data: d,
			dataType: "json",
			success: function(r){
				var tag = "<select name='restaurantNo'><option>????????????</option>";
				for(var i=0;i<r.length;i++) {
					tag += "<option value='"+r[i].restaurantNo+"'>"+r[i].restaurantType+"</option>"
				}
				tag += "</select>"
				$(".restaurantType").html(tag);
			}
		});
		
	});
	</script>
</body>
</html>