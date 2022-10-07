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
			<h1>전체 객실 관리</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admin.do"><i
						class="fa fa-dashboard"></i>Main</a></li>
				<li class="breadcrumb-item"><a href="#">객실 관리</a></li>
				<li class="breadcrumb-item active"><a href="selectAllHotel.do">전체
						객실 관리</a></li>
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
											<th class="text-center">Room No</th>
											<th class="text-center">From Hotel</th>
											<th class="text-center">Name/Type</th>
											<th class="text-center">Price</th>
											<th class="text-center">Room Image</th>
											<th class="text-center">Simple Manual</th>
											<th class="text-center">Detail Manual</th>
											<th class="text-center"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="r" items="${requestScope.list }">
											<tr>
												<td class="text-center">${r.roomNo }</td>
												<td class="text-center">${r.hotelName}<br>(${r.hotelNo })</td>
												<td class="text-center htl"><a
													href="updateRoomView.do?roomNo=${r.roomNo }"
													class="text-yellow hover-warning">${r.roomType}</a></td>
												<td class="text-center">${r.price}</td>
												<td class="text-center image"><img class="room_image" src="${r.roomImage}" alt="객실 메인 이미지"></td>
												<td class="text-center manual">${r.roomSimpleManual}</td>
												<td class="text-center manual">${r.roomDetailManual}</td>
												<td class="text-center">
													<a href="updateRoomView.do?roomNo=${r.roomNo }"
													class="btn btn-warning btn-sm mx-auto">수정하기</a>
													<a href="#"
													class="btn delete btn-sm mx-auto delete-room">삭제하기</a>
													</td>
											</tr>
											<tr>
												<td class="text-center"><p style="margin-top: 27px;">Room Option</p></td>
												<td class="text-center" colspan="6">
												<c:forEach var="o" items="${r.optionlist }">
												<div class="icon-container">
												<img class="icon_image" src="${o.optionPath}" alt="옵션 아이콘">
												<input type="hidden" name="optionName" value="${o.optionName}">
												<p class="text-yellow hover-warning">${o.optionName}</p>
												</div>
												</c:forEach>
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