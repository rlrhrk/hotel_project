<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	.member_delete{
		margin-top:10px;
		margin-left: 10px;
	}
	.member-detail{
		margin-top:10px;
	}
	.btn-array{
		text-align: right;
		justify-content: right;
	}
	.box-body{
		width: 1000px;
	}
</style>

</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>${title }</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i
						class="fa fa-dashboard"></i>MEMBER</a></li>
				<li class="breadcrumb-item"><a href="#">회원 관리</a></li>
				<li class="breadcrumb-item active">${title }</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="box">
						<div class="box-body">
							<div class="table-responsive">
								<table id="example5" class="table table-hover">
									<thead class="d-none">
										<tr>
											<th>&nbsp;</th>
											<th>&nbsp;</th>
											<th>&nbsp;</th>
											<th>&nbsp;</th>
											<th>&nbsp;</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${requestScope.list }">
											<tr>
												<td class="w-60"><a
													class="avatar avatar-lg status-success" href="#"><img
														src="../admin_resource/images/avatar/1.jpg" alt="..." /></a>
												</td>
												<td class="w-300">
													<p class="mb-0">
														<a href="memberProfile.do?email=${member.email }"><strong>${member.memberName }</strong></a>
														<small class="sidetitle" name="sidetitle">${member.email }</small>
													</p>
													<p class="mb-0">tel) ${member.tel }</p>
												</td>
												<td>
													<nav class="nav mt-1 btn-array">
														<a href="memberProfile.do?email=${member.email }" class="member-detail btn btn-warning btn-sm text-white">회원 상세 보기</a>
														<a class="member_delete btn delete btn-sm text-white">계정 정보 삭제</a>
													</nav>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<script>
	$(function(){
		$('.member_delete').click(function(){
			if(!confirm("정말로 해당 회원 정보를 삭제하시겠습니까?"))
				return;
			var d = 'email='+$(this).parent().parent().parent().find("small.sidetitle").text();
			console.log(d);
			$.ajax({
				url:"memberDelete.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("회원 정보 삭제 완료");
					else 
						alert("회원 정보 삭제 실패");
					location.reload();
				}
			});
		});
		});
</script>
</body>
</html>