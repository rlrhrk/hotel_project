<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../admin_resource/images/favicon.ico">
<title>${title }</title>
<!-- Bootstrap 4.0-->
<link rel="stylesheet"
	href="../admin_resource/assets/vendor_components/bootstrap/dist/css/bootstrap.css">
<!--amcharts -->
<link href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	rel="stylesheet" type="text/css" />
<!-- Bootstrap-extend -->
<link rel="stylesheet" href="../admin_resource/css/bootstrap-extend.css">
<!-- theme style -->
<link rel="stylesheet" href="../admin_resource/css/master_style.css">
<!-- Crypto_Admin skins -->
<link rel="stylesheet" href="../admin_resource/css/skins/_all-skins.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]><script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script><script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style type="text/css">
	.test {
		border-left: 3px solid green;
	}
	body{
		min-width: 1800px;
		overflow: auto;
	}
	.delete{
		background-color: #ef5350;
		color: white;
	}
</style>
</head>
<body class="hold-transition skin-yellow sidebar-mini">
	<div class="wrapper">
		
		<!-- admin_header 영역 -->
		<jsp:include page="layout/header.jsp"/>
		
		<!-- admin_sidemenu 영역 -->
		<jsp:include page="layout/sidemenu.jsp"/>
		
		<!-- admin_content 영역 -->
		<jsp:include page="content/${page}"/>
		
		<!-- admin_footer 영역 -->
		<jsp:include page="layout/footer.jsp"/>
		
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 3 -->
	<script src="../admin_resource/assets/vendor_components/jquery/dist/jquery.js"></script>
	<!-- popper -->
	<script src="../admin_resource/assets/vendor_components/popper/dist/popper.min.js"></script>
	<!-- Bootstrap 4.0-->
	<script
		src="../admin_resource/assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>
	<!-- Slimscroll -->
	<script
		src="../admin_resource/assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	<!-- FastClick -->
	<script src="../admin_resource/assets/vendor_components/fastclick/lib/fastclick.js"></script>
	<!--amcharts charts -->
	<script src="http://www.amcharts.com/lib/3/amcharts.js"
		type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/gauge.js"
		type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/serial.js"
		type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/amstock.js"
		type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/pie.js"
		type="text/javascript"></script>
	<script
		src="http://www.amcharts.com/lib/3/plugins/animate/animate.min.js"
		type="text/javascript"></script>
	<script
		src="http://www.amcharts.com/lib/3/plugins/export/export.min.js"
		type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/themes/patterns.js"
		type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/themes/light.js"
		type="text/javascript"></script>
	<!-- webticker -->
	<script
		src="../admin_resource/assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>
	<!-- EChartJS JavaScript -->
	<script
		src="../admin_resource/assets/vendor_components/echarts-master/dist/echarts-en.min.js"></script>
	<script
		src="../admin_resource/assets/vendor_components/echarts-liquidfill-master/dist/echarts-liquidfill.min.js"></script>
	<!-- This is data table -->
	<script
		src="../admin_resource/assets/vendor_plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	<!-- Crypto_Admin App -->
	<script src="../admin_resource/js/template.js"></script>
	<!-- Crypto_Admin dashboard demo (This is only for demo purposes) -->
	<script src="../admin_resource/js/pages/dashboard.js"></script>
	<script src="../admin_resource/js/pages/dashboard-chart.js"></script>
	<!-- Crypto_Admin for demo purposes -->
	<script src="../admin_resource/js/demo.js"></script>
	<!-- 우편 번호 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- chart js -->
	<!-- <script src="../admin_resource/js/pages/widget-morris-charts.js"></script> -->
	
	<script type="text/javascript">
	$(function(){
		var title = '${title }';
		
		console.log(title);
		console.log(${m1count});
		
		$("ul[class='active']").removeClass("active");
		$("li[class='active']").removeClass("active");
		
		if(title == "메인 페이지"){
			$("a[href^='admin.do']").parent().addClass("active");
		}
		
		else if(title == "전체 지점 관리"){
			$("a[href^='selectAllHotel.do']").parent().addClass("active");
			$("a[href^='selectAllHotel.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "호텔 지점 등록"){
			$("a[href^='insertHotelView.do']").parent().addClass("active");
			$("a[href^='insertHotelView.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "전체 회원 관리"){
			$("a[href^='selectAllMember.do']").parent().addClass("active");
			$("a[href^='selectAllMember.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "회원 프로필"){
			$("a[href^='selectAllMember.do']").parent().addClass("active");
			$("a[href^='selectAllMember.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "전체 객실 관리"){
			$("a[href^='selectAllRoom.do']").parent().addClass("active");
			$("a[href^='selectAllRoom.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "객실 등록"){
			$("a[href^='insertRoomView.do']").parent().addClass("active");
			$("a[href^='insertRoomView.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "옵션 관리"){
			$("a[href^='setOptionView.do']").parent().addClass("active");
			$("a[href^='setOptionView.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "전체 식당 관리"){
			$("a[href^='selectAllRestaurant.do']").parent().addClass("active");
			$("a[href^='selectAllRestaurant.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "식당 수정"){
			$("a[href^='selectAllRestaurant.do']").parent().addClass("active");
			$("a[href^='selectAllRestaurant.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "식당 등록"){
			$("a[href^='insertRestaurantView.do']").parent().addClass("active");
			$("a[href^='insertRestaurantView.do']").parent().parent().parent().addClass("active");
		}
		
		/* 
		$(".htl").text($(".htl").text().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		 */
		$("input[type='tel']").val($("input[type='tel']").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		
		$("input[type='tel']").keyup(function(){
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
		
		$('.hotelfrm').submit(function (e) {
			if($("input[name='hotelNo']").val().length < 2)
		        $('input[name="hotelNo"]').addClass('false').removeClass('true');
		    else
		        $('input[name="hotelNo"]').addClass('true').removeClass('false');
			
			if($('input[name="hotelName"]').val().length < 2)
		        $('input[name="hotelName"]').addClass('false').removeClass('true');
		    else
		        $('input[name="hotelName"]').addClass('true').removeClass('false');
			
			if($('input[name="hotelTel"]').val().length != 13 && $('input[name="hotelTel"]').val().length != 15)
		        $('input[name="hotelTel"]').addClass('false').removeClass('true');
		    else
		        $('input[name="hotelTel"]').addClass('true').removeClass('false');
			
			if($('input[name="addr1"]').val().length < 2)
		        $('input[name="addr1"]').addClass('false').removeClass('true');
		    else
		        $('input[name="addr1"]').addClass('true').removeClass('false');
			
			if($('input[name="addr2"]').val().length < 2)
		        $('input[name="addr2"]').addClass('false').removeClass('true');
		    else
		        $('input[name="addr2"]').addClass('true').removeClass('false');
			
			if($('input[name="hotelImage"]').val().length < 2)
		        $('input[name="hotelImage"]').addClass('false').removeClass('true');
		    else
		        $('input[name="hotelImage"]').addClass('true').removeClass('false');
			
			if($('input[name="hotelSimpleManual"]').val().length < 2)
		        $('input[name="hotelSimpleManual"]').addClass('false').removeClass('true');
		    else
		        $('input[name="hotelSimpleManual"]').addClass('true').removeClass('false');
			
			if($('input[name="hotelDetailManual"]').val().length < 2)
		        $('input[name="hotelDetailManual"]').addClass('false').removeClass('true');
		    else
		        $('input[name="hotelDetailManual"]').addClass('true').removeClass('false');
			
			
		    if(!$("input[name='hotelNo']").hasClass('true')){
		        e.preventDefault();
		        alert('호텔 코드를 2자리 이상 입력하세요');
		    }
		    else if(!$('input[name="hotelName"]').hasClass('true')){
		        e.preventDefault();
		        alert('호텔명을 2자리 이상 입력하세요');
		    }
		    else if(!$('input[name="hotelTel"]').hasClass('true')){
		        e.preventDefault();
		        alert('호텔 전화 번호를 입력하세요(11~13자리)');
		    }
		    else if(!$('input[name="addr1"]').hasClass('true') || !$('input[name="addr2"]').hasClass('true')){
		        e.preventDefault();
		        alert('호텔 주소가 올바르지 않습니다');
		    }
		    else if(!$('input[name="hotelImage"]').hasClass('true')){
		        e.preventDefault();
		        alert('호텔 메인 이미지를 설정하세요');
		    }
		    else if(!$('input[name="hotelSimpleManual"]').hasClass('true')){
		        e.preventDefault();
		        alert('호텔 간단 소개문을 입력하세요');
		    }
		    else if(!$('input[name="hotelDetailManual"]').hasClass('true')){
		        e.preventDefault();
		        alert('호텔 상세 소개문을 입력하세요');
		    }
		    console.log(${result});
		    
		});
		
		
	});
	
	function execPostCode() {
		new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr2").value = roadAddr;
                document.getElementById("addr3").value = data.jibunAddress;

                var guideTextBox = document.getElementById("guide");
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
		
	}
	
	function testInsert() {
		$("input[name=hotelNo]").val("H00");
		$("input[name=hotelName]").val("신라 호텔");
		$("input[name=hotelTel]").val("01012341234");
		$("input[name=addr1]").val("서울시");
		$("input[name=addr2]").val("신촌");
		$("input[name=addr3]").val("코리아 아카데미");
		$("input[name=hotelSimpleManual]").val("stest");
		$("input[name=hotelDetailManual]").val("dtest");
		$("input[type='tel']").val( $("input[type='tel']").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	}
	
	$(".hotelfrm").submit(function(){
		var option = "";
		$("input:checked").each(function(){
			option += $(this).val() + "/";
		})
		console.log(option);
		$("input[name='optionName']").val(option);
	});
	
	$(document).on("click",".delete-btn",function(){
		if(!confirm("정말로 해당 옵션 정보를 삭제하시겠습니까?"))
			return;
		
    	var d = "optionName=" + $(this).parent().parent().find(".text-uppercase").html();
    		console.log(d);
    		
    	$.ajax({
			url:"deleteOption.do",
			data : d,
			success:function(r){
				if(r==1)
				location.replace("setOptionView.do");
			}
		});
    	
    });
	
	$(document).on("click",".delete-room",function(){
		if(!confirm("정말로 해당 객실을 삭제하시겠습니까?"))
			return;
		
    	var d = "roomNo=" + $(this).parent().parent().children().first().html();
    		console.log(d);
    		
    	$.ajax({
			url:"deleteRoom.do",
			data : d,
			success:function(r){
				if(r==1)
				location.replace("selectAllRoom.do");
			}
		});
    });
	
	$(document).on("click",".delete-restaurant",function(){
		if(!confirm("정말로 해당 객실을 삭제하시겠습니까?"))
			return;
		
    	var d = "roomNo=" + $(this).parent().parent().children().first().html();
    		console.log(d);
    		
    	$.ajax({
			url:"deleteRestaurant.do",
			data : d,
			success:function(r){
				if(r==1)
				location.replace("selectAllRestaurant.do");
			}
		});
    });
	
	
	  
</script>
	
	
</body>
</html>