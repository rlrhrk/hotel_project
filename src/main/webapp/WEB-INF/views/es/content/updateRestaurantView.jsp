<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>

</head>
<body>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>식당 정보 수정</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do"><i
							class="fa fa-dashboard"></i>Main</a></li>
					<li class="breadcrumb-item"><a href="#">식당 관리</a></li>
					<li class="breadcrumb-item active"><a href="#">식당 정보 수정</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
			<form class="Restaurantfrm" action="updateRestaurant.do" method="post" enctype="multipart/form-data">
				<div class="row">
					<!-- /.col -->
					<div class="col-xl-8 col-lg-7">
						<div class="box box-solid bg-black">
							<div class="box-header with-border">
								<h3 class="box-title"></h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<div class="col-12">
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Restaurant No</label>
											<div class="col-sm-6">
												<input class="form-control" type="text" placeholder="식당 코드 넘버 입력" name="restaurantNo" readonly="readonly"
												value="${requestScope.dto.restaurantNo }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">From Hotel</label>
											<div class="col-sm-6">
												<div class="form-group">
													<select class="form-control select2 w-p100" name="hotelNo">
													<c:set var="hotelNo" value="${requestScope.dto.hotelNo }"></c:set>
													<c:forEach var="h" items="${requestScope.hotellist }">
														<c:choose>
															<c:when test="${h.hotelNo eq hotelNo}">
								                        		<option selected="selected" value="${h.hotelNo },${h.hotelName }">${h.hotelName }(${h.hotelNo })</option>
															</c:when>
															<c:otherwise>
								                        		<option value="${h.hotelNo },${h.hotelName }">${h.hotelName }(${h.hotelNo })</option>
															</c:otherwise>
														</c:choose>
							                      	</c:forEach>
							                      	</select></div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Type</label>
											<div class="col-sm-6">
												<div class="form-group">
													<select class="form-control select2 w-p100" name="restaurantTypeNo">
													<c:set var="restaurantTypeNo" value="${requestScope.dto.restaurantTypeNo }"></c:set>
													<c:forEach var="t" items="${requestScope.typelist }">
														<c:choose>
															<c:when test="${t.restaurantTypeNo eq restaurantTypeNo}">
								                        		<option selected="selected" value="${t.restaurantTypeNo }">${t.restaurantType }(${t.restaurantTypeNo })</option>
															</c:when>
															<c:otherwise>
								                        		<option value="${t.restaurantTypeNo }">${t.restaurantType }(${t.restaurantTypeNo })</option>
															</c:otherwise>
														</c:choose>
							                      	</c:forEach>
							                      	</select></div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Price (￦)</label>
											<div class="col-sm-10">
												<input class="form-control" type="text"
													placeholder="식당 가격 입력" name=restaurantPrice
													value="${requestScope.dto.restaurantPrice }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Image</label>
											<div class="col-sm-10">
												<input class="form-control" type="file"
													placeholder="식당 메인 이미지 등록" accept="image/*" name="file">
												<input class="form-control" type="hidden" name="restaurantImagepath"
												value="../admin_resource/images/">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Manual</label>
											<div class="col-sm-10">
												<input class="form-control" type="text"
													placeholder="식당 소개 입력" name="restaurantManual"
													value="${requestScope.dto.restaurantManual }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">
												<button type="submit" class="btn btn-warning btn-lg mx-auto">수정하기</button>
											</div>
										</div>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				</form>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
<!-- 우편 번호 주소 API -->
<script type="text/javascript">

</script>
		
</body>
</html>