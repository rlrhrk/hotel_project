<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.room_image{
		width: 300px;
	}
	.icon_image{
		width: 40px;
		margin-bottom: 5px;
	}
	.icon-container{
		display: inline-block;
		text-align: center;
		margin-right: 30px;
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
			<h1>전체 식당 관리</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admin.do"><i
						class="fa fa-dashboard"></i>Main</a></li>
				<li class="breadcrumb-item"><a href="#">식당 관리</a></li>
				<li class="breadcrumb-item active"><a href="selectAllHotel.do">전체
						식당 관리</a></li>
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
											<th class="text-center">Restaurant No</th>
											<th class="text-center">From Hotel</th>
											<th class="text-center">Type</th>
											<th class="text-center">Price (￦)</th>
											<th class="text-center">Image</th>
											<th class="text-center">Manual</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="r" items="${requestScope.list }">
											<tr>
												<td class="text-center text-yellow">${r.restaurantNo }</td>
												<td class="text-center">${r.hotelName}<br>(${r.hotelNo })</td>
												<td class="text-center htl">${r.restaurantType}</td>
												<td class="text-center">${r.restaurantPrice}</td>
												<td class="text-center"><img class="room_image" src="${r.restaurantImagepath}" alt="식당 메인 이미지"></td>
												<td class="text-center manual">${r.restaurantManual}</td>
												<td class="text-center">
													<a href="updateRestaurantView.do?restaurantNo=${r.restaurantNo }"
													class="btn btn-warning btn-sm mx-auto">수정하기</a>
													<a href="#"
													class="btn btn-sm mx-auto delete-restaurant delete">삭제하기</a>
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