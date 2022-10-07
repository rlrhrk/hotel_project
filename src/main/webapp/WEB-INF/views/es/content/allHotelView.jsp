<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hotel_image{
		width: 300px;
	}
	.manual{
		max-width: 200px;
		max-height: 100px;
		overflow: hidden;
		overflow:hidden;
		white-space : nowrap;
		text-overflow: ellipsis;
	}
</style>

</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<h1>전체 지점 조회</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admin.do"><i
						class="fa fa-dashboard"></i>Main</a></li>
				<li class="breadcrumb-item"><a href="#">호텔 관리</a></li>
				<li class="breadcrumb-item active"><a href="selectAllHotel.do">전체
						호텔 조회</a></li>
			</ol>
		</section>
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="box box-solid bg-dark">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
							<div class="box-tools pull-right"></div>
						</div>
						<div class="box-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered no-margin">
									<thead>
										<tr>
											<th class="text-center">Hotel No</th>
											<th class="text-center">Name</th>
											<th class="text-center">Tel</th>
											<th class="text-center">Address</th>
											<th class="text-center">Main Image</th>
											<th class="text-center">Simple Manual</th>
											<th class="text-center">Detail Manual</th>
											<th class="text-center">All Room EA</th>
											<th class="text-center"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="h" items="${requestScope.list }">
											<tr>
												<td class="text-center">${h.hotelNo }</td>
												<td class="text-center"><a
													href="updateHotelView.do?hotelNo=${h.hotelNo }"
													class="text-yellow hover-warning">${h.hotelName }</a></td>
												<td class="text-center htl">${h.hotelTel}</td>
												<td class="text-center">${h.hotelAddress}</td>
												<td class="text-center"><img class="hotel_image" src="${h.hotelImage}" alt="호텔 메인 이미지"></td>
												<td class="text-center manual">${h.hotelSimpleManual}</td>
												<td class="text-center manual">${h.hotelDetailManual}</td>
												<td class="text-center">${h.hotelAllRoomEA }</td>
												<td class="text-center">
													<a href="updateHotelView.do?hotelNo=${h.hotelNo }"
													class="btn btn-warning btn-sm mx-auto">수정하기</a>
													<a href="deleteHotel.do?hotelNo=${h.hotelNo }"
													class="btn delete btn-sm mx-auto">삭제하기</a>
													</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>