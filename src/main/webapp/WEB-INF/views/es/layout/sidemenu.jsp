<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="ulogo">
						<a href="index.html">
							<!-- logo for regular state and mobile devices -->
							<span><b>Crypto </b>Admin</span>
						</a>
					</div>
					<div class="image">
						<img src="../admin_resource/images/user2-160x160.jpg" class="rounded-circle"
							alt="User Image">
					</div>
					<div class="info">
						<p>Admin Template</p>
						<a href="" class="link" data-toggle="tooltip" title=""
							data-original-title="Settings"><i class="ion ion-gear-b"></i></a><a
							href="" class="link" data-toggle="tooltip" title=""
							data-original-title="Email"><i class="ion ion-android-mail"></i></a><a
							href="" class="link" data-toggle="tooltip" title=""
							data-original-title="Logout"><i class="ion ion-power"></i></a>
					</div>
				</div>
				<!-- sidebar menu -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="nav-devider"></li>
					<li class="active"><a href="admin.do"><i
							class="icon-home"></i><span>메인 페이지</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a></li>
					<li class="header nav-small-cap">HOTEL</li>
					<li class="treeview"><a href="#"><i class="fa fa-fw fa-hospital-o"></i><span>호텔 관리</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
							<li><a href="selectAllHotel.do">전체 지점 관리</a></li>
							<li><a href="insertHotelView.do">호텔 지점 등록</a></li>
						</ul></li>
					<li class="treeview"><a href="#"><i class="fa fa-hotel"></i><span>객실 관리</span><span class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
							<li><a href="selectAllRoom.do">전체 객실 관리</a></li>
							<li><a href="insertRoomView.do">객실 등록</a></li>
							<li><a href="setOptionView.do">옵션 관리</a></li>
						</ul></li>
					<li class="treeview"><a href="#"><i class="fa fa-cutlery"></i><span>식당 관리</span><span class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
							<li><a href="selectAllRestaurant.do">전체 식당 관리</a></li>
							<li><a href="insertRestaurantView.do">식당 등록</a></li>
						</ul></li>
					
										<li class="header nav-small-cap">MEMBER</li>
					<li class="treeview"><a href="#"><i class="fa fa-user-circle"></i><span>회원 관리</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
							<li><a href="selectAllMember.do">전체 회원 관리</a></li>
						</ul></li>
				</ul>
			</section>
		</aside>
</body>
</html>