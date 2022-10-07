<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.option-div{
		width: 800px;
		display: flex;
		flex-flow: row wrap;
	}
	.option-box{
		width: 100px;
	}
	.box box-body{
		display: inline-block;
	}
	.costom-box{
		background: #fff;
	    border-radius: 5px;
	    box-shadow: 0px 0px 5px 0px rgb(142 139 133 / 32%);
	    transition: .5s;
	    display: flex;
	    flex-direction: column;
	    width: 150px;
	    height: 150px;
	    max-width: 150px;
	    min-width: 150px;
	    margin: 10px;
	}
	.option-img{
		width: 60px;
	}
	
	
</style>

</head>
<body>
	<div class="wrapper"></div>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>옵션 설정</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do"><i
							class="fa fa-dashboard"></i>Main</a></li>
					<li class="breadcrumb-item"><a href="#">호텔관리</a></li>
					<li class="breadcrumb-item active"><a href="insertHotelView.do">호텔 지점 등록</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
			<form class="hotelfrm" action="setOption.do" method="post" enctype="multipart/form-data">
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
										<div class="col-xl-3 col-md-6 col-12">
    
											<label class="col-sm-2 col-form-label option-position">Option</label>
										<div class="form-group row">
												<div class="col-sm-10">
												<div class="option-div">
													<c:forEach var="o" items="${requestScope.alloptionlist }">
													<div class="box-body costom-box">
													      <h6><span class="text-uppercase">${o.optionName }</span><span class="float-right">
													      <a class="btn btn-xs btn-warning delete-btn" href="#">삭제</a></span></h6><br>
													      <div class="option-box">
													      	<img class="option-img" alt="옵션 이미지" src="${o.optionPath }">
													      </div>
													    </div>
													</c:forEach>
													</div>
												</div>
											</div>
										</div>
											<label class="col-sm-2 col-form-label" style="margin-bottom: 20px;">Add Option</label>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Name</label>
											<div class="col-sm-6">
												<input class="form-control" type="text" placeholder="옵션명 입력" name="option">
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Option Image</label>
											<div class="col-sm-6">
												<input class="form-control" type="file"
													placeholder="옵션 이미지 등록" accept="image/*" name="file">
												<input class="form-control" type="hidden" name="optionPath"
												value="../admin_resource/images/">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">
												<button type="submit" class="btn btn-warning btn-sm mx-auto">추가하기</button>
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