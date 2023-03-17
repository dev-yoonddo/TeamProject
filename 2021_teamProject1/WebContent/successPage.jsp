<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page import="user.UserDAO"%>

<!DOCTYPE html>
<html>
<head>
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" , initial-scale="1">
<meta charset="UTF-8">

<title>피자가게</title>
<link rel="icon" href="./images/logo-favicon.png">
<link rel="stylesheet" href="css/mainPage.css?after">
<link rel="stylesheet" href="css/orderPage.css?after">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<script src="js/scriptForm.js" type="text/javascript"></script>
<script src="./js/order.js" type="text/javascript"></script>
<script type="text/javascript">
	function showClock() {
		var currentDate = new Date();
		var divClock = document.getElementById("divClock");
		if (currentDate.getHours() > 12) { //현재의 시가 12보다 크다면
			var msg = "현재 시간 : 오후 " + (currentDate.getHours() - 12) + "시";
		}//오후 를 출력하고 현재 시 에서 12를 빼고 출력. 
		else {
			var msg = "현재 시간 : 오전 " + currentDate.getHours() + "시";
		}//아니라면 그대로 출력하지만 앞에 오전을 붙여준다.
		msg += currentDate.getMinutes() + "분";
		msg += currentDate.getSeconds() + "초";

		divClock.innerText = msg;
		setTimeout(showClock, 1000); //1초마다 갱신
	}
</script>
<style media="screen">
#divClock {
	font-size: 30px;
	color: black;
	background-color: white;
}
</style>
</head>
<body onload="showClock()">

	<!-- header start-->
	<header id="header">
		<%
			// 세션값 가져오기
			String id = (String) session.getAttribute("userID"); // Object 타입이므로 다운캐스팅
		%>
		<nav class="navmenu">
			<div class="navmenu-left">
				<input type="image" src="./images/smilepizza.PNG" alt="로고" onclick="location.href='sessionMain.jsp'"
					width="250px" height="70px" style="align-items: center;">
			</div>

			<div class="navmenu-right">
				<ul class="login">
					<li style="font-size: 10pt;"><%=id%>님이<br>로그인하였습니다.&nbsp;&nbsp;</li>
					<li class="btn1-logout"><button type="button"
							class="btn btn-outline-gray" id="btn1"
							onclick="location.href='sessionLogout.jsp'">로그아웃</button>&nbsp;</li>
				</ul>
			</div>
		</nav>
		<div class="category">
			<ul class="category-list">
				<!-- <li class="active"><a href="mainPage.jsp">메인</a></li> -->
				<li class="btn2" onclick="location.href='#'">메인</li>
				<li class="btn2" onclick="location.href='orderPage.jsp'">주문하기</li>
				<li class="btn2" onclick="location.href='eventPage.jsp'">이벤트</li>
				<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>
			</ul>
			<hr>
		</div>

	</header>
	<!-- header end -->

	<section>
		<div class="order-message">
				<!-- message -->
				<div class="message">
					<h2>주문 요청이 완료되었습니다</h2>
					<br>
					<div id="divClock" class="clock"></div>
					<h2>20분뒤에 방문해주세요</h2>
					<font size="5"><strong>☞서울특별시 강남구 역삼로1004길☜</strong></font><br />
					<br>
				</div>
				<!-- time -->

				<div class="top" align="center">
					<button type="button" class="btn btn-danger btn-sm" mx="auto" style="font-size: 15pt;" 
							onclick="location.href='sessionMain.jsp'">메인으로</button>
				</div>
				<br>
		</div>
	</section>


</body>
</html>