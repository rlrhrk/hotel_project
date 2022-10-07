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
	<div class="wrapper"></div>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>호텔 지점 등록</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do"><i
							class="fa fa-dashboard"></i>Main</a></li>
					<li class="breadcrumb-item"><a href="#">호텔관리</a></li>
					<li class="breadcrumb-item active"><a href="insertHotelView.do">호텔 지점 등록</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
			<form class="hotelfrm" action="insertHotel.do" method="post" enctype="multipart/form-data">
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
											<label class="col-sm-2 col-form-label">Hotel No</label>
											<div class="col-sm-6">
												<input class="form-control" type="text" placeholder="호텔 코드 넘버 입력" name="hotelNo">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Name</label>
											<div class="col-sm-6">
												<input class="form-control" type="text" placeholder="호텔명 입력" name="hotelName">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Tel</label>
											<div class="col-sm-6">
												<input class="form-control phoneNumber" type="tel"
													placeholder="호텔 전화 번호 입력(- 제외 입력)" maxlength="13" name="hotelTel">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Address</label>
											<div class="col-sm-10">
												<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    											<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
    											<span id="guide" style="color:#999;display:none;"></span>            
    											<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
												<input class="form-control" type="text" name="addr3" id="addr3"
													placeholder="호텔 상세 주소 입력">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Main Image</label>
											<div class="col-sm-10">
												<input class="form-control" type="file"
													placeholder="호텔 메인 이미지 등록" accept="image/*" name="file">
												<input class="form-control" type="hidden" name="hotelImage"
												value="../admin_resource/images/">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Simple Manual</label>
											<div class="col-sm-10">
												<input class="form-control" type="text"
													placeholder="호텔 간단 소개 입력" name="hotelSimpleManual">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Detail Manual</label>
											<div class="col-sm-10">
												<input class="form-control" type="text"
													placeholder="호텔 상세 소개 입력" name="hotelDetailManual">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">
												<button type="button" class="btn btn-warning btn-lg mx-auto" onclick="testInsert();">더미 데이터 테스트</button>
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