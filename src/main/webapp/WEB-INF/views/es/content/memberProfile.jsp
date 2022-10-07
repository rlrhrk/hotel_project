<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>${title }</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#"><i
					class="fa fa-dashboard"></i>MEMBER</a></li>
			<li class="breadcrumb-item"><a href="#">전체 회원 조회</a></li>
			<li class="breadcrumb-item active">${title }</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-lg-3 col-12">
				<!-- Profile Image -->
				<div class="box bg-inverse bg-dark bg-hexagons-white">
					<div class="box-body box-profile">
						<img
							class="profile-user-img rounded-circle img-fluid mx-auto d-block"
							src="../admin_resource/images/5.jpg" alt="User profile picture" />
						<h3 class="profile-username text-center">${dto.memberName }</h3>
						<div class="row social-states">
							
						</div>
						<div class="row">
							<div class="col-12">
								<div class="profile-user-info">
									<p>이메일 주소</p>
									<h6 class="margin-bottom">${dto.email }</h6>
									<p>전화번호</p>
									<h6 class="margin-bottom">${dto.tel }</h6>
									<p>주소</p>
									<h6 class="margin-bottom">${dto.address }</h6>
									
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
			<div class="col-lg-9 col-12">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs tabstyle">
						<li><a class="active" href="#activity" data-toggle="tab">1:1 문의
								내역</a></li>
						<li><a href="#settings" data-toggle="tab">회원 정보 수정</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane" id="timeline">
							<li><i class="fa fa-clock-o bg-gray"></i></li>
						</div>
						<!-- /.tab-pane -->
						<div class="active tab-pane" id="activity">
							<!-- Post -->
							<c:if test="${requestScope.qna[0].qnano == null}">
							<p class="text-sm text-orange">
								<i class="fa fa-comments-o margin-r-5"></i>
								등록된 문의 내역이 없습니다</p>
							</c:if>
							<c:forEach var="qna" items="${requestScope.qna }">
							<div class="top-line">
							<c:if test="${qna.qnaresponse == null }">
								<p class="text-sm text-orange">
								<i class="fa fa-comments-o margin-r-5"></i>
								답변 대기 중</p>
							</c:if>
							<c:if test="${qna.qnaresponse != null }">
								<p class="text-sm text-success">
								<i class="fa fa-comments-o margin-r-5"></i>
									답변 완료</p>
							</c:if>
							</div>
							<div class="post">
								<div class="activitytimeline">
									<p class="text-yellow hover-warning">문의자</p>
									<p class="tsize">${dto.memberName }<p>
									<p class="text-yellow hover-warning">문의일</p>
									<p class="tsize">${qna.qnadate }<p>
								</div>
								<!-- /.user-block -->
								<div class="activitytimeline">
									<p class="text-yellow hover-warning">문의내용</p>
									<p class="tsize">${qna.qnacontent }</p>
									<hr>
									<c:if test="${qna.qnaresponse != null }">
									<p class="text-yellow hover-warning">답변내용</p>
									<p class="tsize">${qna.qnaresponse }</p>
									<hr>
									</c:if>
									<ul class="list-inline">
										<li></li>
										
										<c:if test="${qna.qnaresponse != null }">
										<li class="pull-right">
											<button id="delete-btn" type="button" class="btn delete btn-md" style="margin-left: 10px;">
											답변 삭제</button></li>
										<li class="pull-right">
											<button id="update-btn" type="button" class="btn btn-warning btn-md" style="margin-left: 10px;">
											답변 수정</button></li>
										</c:if>
									</ul>
									<c:if test="${qna.qnaresponse == null }">
									<form action="updateQnaResponse.do" class="form-horizontal form-element">
										<div class="form-group row no-gutters">
											<div class="col-sm-9">
												<input name="response" class="form-control input-sm" placeholder="답변을 입력하세요" style="padding-left: 10px;" />
												<input name="qnano" type="hidden" value="${qna.qnano }">
												<input name="email" type="hidden" value="${qna.email }">
											</div>
											<div class="col-sm-3">
												<button type="submit"
													class="btn btn-warning btn-lg" style="margin-left: 10px;">
													등록</button>
											</div>
										</div>
									</form>
									</c:if>
									<form id="updatefrm" action="updateQnaResponse.do" class="form-horizontal form-element disnone" >
									<br>
										<div class="form-group row no-gutters">
											<div class="col-sm-9">
												<input name="response" class="form-control input-sm" placeholder="수정할 답변을 입력하세요" style="padding-left: 10px;" />
												<input name="qnano" type="hidden" value="${qna.qnano }">
												<input name="email" type="hidden" value="${qna.email }">
											</div>
											<div class="col-sm-3">
												<button type="submit"
													class="btn btn-warning btn-lg" style="margin-left: 10px;">
													수정하기</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							</c:forEach>
							<table>
								<tr>
									<td colspan="7">
										<div class="page_bar">
											<c:if test="${pagging.previousPageGroup }">
												<a href="memberProfile.do?pageNo=${pagging.startPageOfPageGroup - 1 }&email=${dto.email}">◀</a>
											</c:if>
											<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
											end="${pagging.endPageOfPageGroup}">
												<a href="memberProfile.do?pageNo=${i }&email=${dto.email}">${ i}</a>
											</c:forEach>
										
											<c:if test="${pagging.nextPageGroup }">
												<a href="memberProfile.do?pageNo=${pagging.endPageOfPageGroup + 1 }&email=${dto.email}">▶</a>
											</c:if>
										</div>
								</tr>
							</table>
							<!-- /.post -->
						</div>
						<!-- /.tab-pane -->
						<div class="tab-pane" id="settings">
						<form action="memberUpdate.do" method="post">
							<div class="box-body"></div>
				                <div class="row">
				                  <div class="col-12">
				                    <div class="form-group row"><label class="col-sm-2 col-form-label">이메일</label>
				                      <div class="col-sm-5"><input class="form-control" readonly="readonly" type="text" value="${dto.email }" name="email" placeholder="이메일"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label">비밀번호</label>
				                      <div class="col-sm-5"><input class="form-control" type="password" value="${dto.password }" name="password" placeholder="비밀번호"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label">이름</label>
				                      <div class="col-sm-5"><input class="form-control" type="text" value="${dto.memberName }" name="memberName" placeholder="이름"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label">생일</label>
				                      <div class="col-sm-5"><input class="form-control" type="date" value="${dto.birth }" name="birth" placeholder="이메일"></div>
				                    </div>
				                    	<div class="form-group row"><label class="col-sm-2 col-form-label">성별</label>
				                    	<div class="col-sm-5">
				                    	<select class="form-control select2 w-p100" name="gender">
				                    		<c:if test="${dto.gender == 'F' }">
				                    		<option value="M">남성</option>
				                    		<option value="F" selected="selected">여성</option>
				                    		<option value="X">기타</option>
				                    		</c:if>
				                    		<c:if test="${dto.gender == 'M' }">
				                    		<option value="M" selected="selected">남성</option>
				                    		<option value="F">여성</option>
				                    		<option value="X">기타</option>
				                    		</c:if>
				                    	</select>
				                    	</div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label">전화번호</label>
				                      <div class="col-sm-5"><input class="form-control" type="text" value="${dto.tel }" name="tel" placeholder="전화번호"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label">주소</label>
				                      <div class="col-sm-5">
				                      			<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" 
				                      			value="${requestScope.addr[0] }">
    											<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
    											<span id="guide" style="color:#999;display:none;"></span>            
    											<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" 
    											value="${requestScope.addr[1] }">
												<input class="form-control" type="text" name="addr3" id="addr3"
													placeholder="멤버 상세 주소 입력"
													value="${requestScope.addr[2] }">
				                    </div>
				                    </div>
				                    
				                    <div class="form-group row"><label class="col-sm-2 col-form-label"></label>
				                      <div class="col-sm-10"><button type="submit" class="btn btn-warning btn-lg">수정하기</button></div>
				                    </div>
				                  </div><!-- /.col -->
				                </div><!-- /.row -->
			              	</div>
						</form>
							
										
											
										
							
						</div>
						<!-- /.tab-pane -->
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- /.nav-tabs-custom -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<style>
.tab-pane table {
	font-size: 18px;
}

.tab-pane .table2 tr td {
	padding-bottom: 10px;
}

.tab-pane .table2 tr td input {
	border: 1px solid gray;
	border-top: none;
	border-left: none;
	border-right: none;
}

.button {
	margin-top: 20px;
	border: none;
	width: 150px;
	height: 50px;
}
.page_bar{
	position:relative;
	display:block;
	text-align: center;
	}
.page_bar a:link,.page_bar a:visited {
	color:black;
	text-decoration: none;
	font-size : 18px;
	margin-left: 10px;
	margin-right: 10px;
	}
.page_bar a:hover{
	font-weight: bold;
	color:red;
	}
.likeHate{
	cursor: pointer;
}
.tsize{
	font-size: 15px;
	margin-left: 10px;
}
.disnone{
    display: none;
}
.disblock{
	animation: fade-in 1s;
  	animation-fill-mode: forwards;
    display: block;
}
@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.top-line{
	padding-top: 15px;
	border-top: 3px solid #ffc107;
	padding-bottom: 20px;
	font-size: 17px;
}
hr{
	height: 1px;
	background-color: #ffc107;
	margin-top: 10px;
}
.text-sm {
    font-size: 19px;
}

</style>
<script>
	
	$('.likeHate').click(function(){
		style.color = 'blue';
	});
	
	$("#update-btn").click(function(){
			$('#updatefrm').toggleClass("disblock");
			$('#updatefrm').toggleClass("disnone");
			if($('#updatefrm').hasClass("disnone"))
			$(this).text("답변 수정");
			if(!$('#updatefrm').hasClass("disnone"))
			$(this).text("수정 취소");
	});
	
	$("#delete-btn").click(function(){
		var qnano = $("input[name='qnano']").val();
		var email = $("input[name='email']").val();
		console.log(qnano);
		console.log(email);
		location.replace("deleteQnaResponse.do?qnano="+qnano+"&email="+email);
	});
	
	
	
</script>