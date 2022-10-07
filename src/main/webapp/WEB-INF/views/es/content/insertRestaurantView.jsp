<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	[type=checkbox].filled-in:not(:checked)+label:after{
		border: 2px solid #d2d6de;
	}
	[type=checkbox].filled-in:checked+label:after{
		top: 1px;
	}
	[type=checkbox]+label:before, [type=checkbox]:not(.filled-in)+label:after{
		margin-top: 3px;
	}
	[type=checkbox].filled-in:not(:checked)+label:after{
		top: 1px;
	}
	.option > div{
		display: inline-block;
		width: 200px;
		padding-left: 0px;
		padding-right: 21px;
	}
	.option > div > input{
	 	width: 200px;
	}
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
					<li class="breadcrumb-item active"><a href="#">식당 등록</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
			<form class="Restaurantfrm" action="insertRestaurant.do" method="post" enctype="multipart/form-data">
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
												<input class="form-control" type="text" placeholder="식당 코드 넘버 입력" name="restaurantNo" 
												>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">From Hotel</label>
											<div class="col-sm-6">
												<div class="form-group">
													<select class="form-control select2 w-p100" name="hotelNo">
													<c:forEach var="h" items="${requestScope.hotellist }">
								                        <option value="${h.hotelNo },${h.hotelName }">${h.hotelName }(${h.hotelNo })</option>
							                      	</c:forEach>
							                      	</select></div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Type</label>
											<div class="col-sm-6">
												<div class="form-group">
													<select class="form-control select2 w-p100" name="restaurantTypeNo">
													<c:forEach var="t" items="${requestScope.typelist }">
								                        <option value="${t.restaurantTypeNo }">${t.restaurantType }(${t.restaurantTypeNo })</option>
							                      	</c:forEach>
							                      	</select></div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Price (￦)</label>
											<div class="col-sm-10">
												<input class="form-control" type="text"
													placeholder="식당 가격 입력" name=restaurantPrice
													>
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
													>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">
												<button type="submit" class="btn btn-warning btn-lg mx-auto">등록하기</button>
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
		
<script type="text/javascript">
	
</script>
		
</body>
</html>