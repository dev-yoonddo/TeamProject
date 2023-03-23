<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@300&family=Jua&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script defer src="js/scriptForm.js" type="text/javascript"></script>
<script defer src="option/jquery/jquery.min.js"></script>
<script defer src="https://kit.fontawesome.com/f95555e5d8.js" crossorigin="anonymous"></script>

<style>
section{
	font-family: 'Nanum Gothic', sans-serif;
	display: flex;
	padding: 100px;
}
#divClock {
	font-size: 20px;
	color: black;
	background-color: white;
}
.complete-box{
	padding: 0;
	margin: 0 auto;
}

.information {
	background-color: #ffffff;
	padding: 20px;
	margin: 0;
	border-radius: 16px;
	border-style: solid;
	border-width: 1px;
	border-color: #b4b4b4;
	width: 400px;
	height: 400px;
}
.card{
	border-style: none;
	
}
.tag {
	display: inline-block;
	background-color: #FFD5B4;
	color: #FF7D56;
	font-weight: bold;
	font-size: 12pt;
	padding: 7px 10px;
	line-height: 1;
	border-radius: 7px;    
}

.title {
	font-size: 25pt;
	font-weight: bolder;
	color: #505050;
	line-height: 1.2;
	margin-top: 10px;
}

.info {
	color: grey;
	margin-top: 5px;
	font-size: 10pt;
}

.button {
	line-height: 1;
	background-color: #ffffff;
	border: 3px solid #FF9473;
	color: #FF9473;
	padding: 15px;
	border-radius: 7px;
	font-weight: 500;
	display: flex;
	align-items: center;
	justify-content: space-between;
	
}
.button:hover{
	background-color: #FF9473;
	color: #ffffff;
}
  
  



</style>
</head>


<body onload="showClock()">

<!-- header start-->
<header id="header" >
	<% 
	// 세션값 가져오기
	String id = (String) session.getAttribute("userID"); // Object 타입이므로 다운캐스팅
	%>
	<nav class="navmenu">
		<div class="navmenu-left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" onclick="location.href='sessionMain.jsp'" width="250px" height="70px" style="align-items: center;">
		</div>
		
		<div class="navmenu-right">	
			<ul class="login">
				<li style="font-size: 10pt; color: red;"><%=id %> 님이<br>로그인하였습니다.&nbsp;&nbsp;</li>
				<li class="btn1" onclick="location.href='sessionLogout.jsp'">로그아웃</li>
			</ul>
		</div>
	</nav>
	<div class="category">
		<ul class="category-list">
			<!-- <li class="active"><a href="mainPage.jsp">메인</a></li> -->
			<li class="btn2" onclick="location.href='sessionMain.jsp'">메인</li>
			<li class="btn2" onclick="location.href='orderPage.jsp'">주문하기</li>
			<li class="btn2" onclick="location.href='sessionMain.jsp'">매장찾기</li>
			<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>			
		</ul>
		<hr>
	</div>

</header>
<!-- header end -->

<section>
	<div class="complete-box">
	<!-- 주문완료 메세지 -->
	<div class="information">
		<div class="card">
		    <span class="tag">
		    	<i class="fa-solid fa-check"></i> complete
		    </span>
		    <div align=center style="padding-bottom: 20px">
		    <h2 class="title" style="color: #FF7F50;">주문 요청이<br>완료되었습니다!</h2><hr style="width:350px;">
		    <h2 class="title">30분 뒤 방문해주세요</h2>
		    <p id="divClock" class="clock"></p>
		    <p class="info">다른 문의를 원하시면 매장으로 전화주세요</p>
		    </div>
		    <button class="button" onclick="location.href='sessionMain.jsp'">
		      <span>메인으로 돌아가기</span>
		      <i class="fa-solid fa-arrow-right"></i>
		    </button>
		</div>
 	</div>
	</div>
</section>

<!-- footer start-->
<footer><hr>
	<!-- 가게 정보 -->
	<div class="inform">
		<div class="container" style="padding: 0;">
			<div>
				<ul class="footerLogo">
				<li><input type="image" src="./images/smilepizza.PNG" alt="로고" width="150px" height="45px"></li>
				<li>1588-2222</li>
				</ul>
				<ul style="font-size: 10pt; width: 950px; padding: 0; margin: 0;">
	      		<li class="m-0 text">06223 서울특별시 강남구 역삼로1004길 (역삼동, 대박타워) ㈜티티푸드 대표이사 : 정윤서 | 사업자 등록번호: 222-22-22222｜통신판매업신고: 강남 1004호</li>
	      		<li class="m-0 text">｜개인정보 보호책임자 : 정윤서 | 문의 : Webmaster@Happyflower.co.kr | Copyright ⓒ Happyflower’s Pizza. All rights reserved.</li>
	      		<li class="m-0 text">㈜티티푸드의 사전 서면동의 없이 사이트(PC, 모바일)의 일체의 정보, 콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</liz>
	    		</ul>
    		</div>
    	</div>
   	</div>	
</footer>
<!-- footer end-->	
<script>
	function showClock() {
		var currentDate = new Date();
		var divClock = document.getElementById("divClock");
		if (currentDate.getHours() > 12) { //현재의 시가 12보다 크다면
			var msg = "현재시간  오후 " + (currentDate.getHours() - 12) + "시";
		}//오후 를 출력하고 현재 시 에서 12를 빼고 출력. 
		else {
			var msg = "현재시간  오전 " + currentDate.getHours() + "시";
		}//아니라면 그대로 출력하지만 앞에 오전을 붙여준다.
		msg += currentDate.getMinutes() + "분";
		msg += currentDate.getSeconds() + "초";

		divClock.innerText = msg;
		setTimeout(showClock, 1000); //1초마다 갱신
	}
</script>
</body>
</html>