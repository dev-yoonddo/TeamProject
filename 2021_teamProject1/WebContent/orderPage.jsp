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
<meta name="viewport" content="width-device-width" , initial-scale="1" charset="UTF-8">
<title>피자가게</title>
	
<link rel="icon" href="./images/logo-favicon.png">
<link rel="stylesheet" href="css/mainPage.css?after">
<link rel="stylesheet" href="css/orderPage.css?after">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script defer src="option/jquery/jquery.min.js"></script>
<script defer src="js/scriptForm.js" type="text/javascript"></script>
<script defer src="js/order.js" type="text/javascript"></script>
<style>
.btn-tp span{
	font-size: 10pt;
	width: 80px;
	height: 30px;
	padding: 5px;
	margin: 0;
}
#btn-rq span{
	font-size: 13pt;
	width: 100px;
	height: 40px;
	padding: 5px;
	margin: 0;
	align-items: center;
}
.form-check-input{
	accent-color: red;
}
</style>
</head>
<body>

<!-- header start-->
<header id="header" >

	<% 
	// 세션값 가져오기
	String id = (String) session.getAttribute("userID"); // Object 타입이므로 다운캐스팅
	%>
	
	<!-- haeder 위 -->
	<nav class="navmenu">
		<div class="navmenu-left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" onclick="location.href='sessionMain.jsp'" width="250px" height="70px" style="align-items: center;">
		</div>
		<!-- orderPage는 로그인 했을때만 접속 가능하기 때문에 로그인완료 메세지와 로그아웃 버튼 삽입 -->
		<div class="navmenu-right">	
			<ul class="login">
				<li style="font-size: 10pt; color: red;"><%=id %> 님<br>안녕하세요&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li class="btn1" onclick="location.href='sessionLogout.jsp'">로그아웃</li>
			</ul>
		</div>
	</nav>
	<!-- header 아래 -->
	<div class="category">
		<ul class="category-list">
			<!-- sessionMain과 같은 카테고리 삽입 -->
			<li class="btn2" onclick="location.href='sessionMain.jsp'">메인</li>
			<li class="btn2" onclick="location.href='orderPage.jsp'">주문하기</li>
			<li class="btn2" onclick="location.href='sessionMain.jsp'">매장찾기</li>
			<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>			
		</ul>
		<hr>
	</div>
</header>
<br>
	<!-- header end-->


<!-- section start -->
<section>

	<!-- title -->
	<div class="title-box">
		<h2 style="font-weight: bold;">나만의 피자 만들기</h2>
		<br>
		<h5>#내가 좋아하는 재료만!</h5>
		<hr style="width: 1420px; height: 4px; color: red;">
	</div>
	<br>

	<!-- option -->
	<!-- 총금액을 확인하기위해 value에 가격을 넣어준다. -->
	<div class="menu-board">
		<div class="menu-board-inner" style="display: flex;">
			<div class="option">
				
				<!-- size -->
				<h3>사이즈 선택</h3>

				<hr style="width: 600px; height: 2px;">
				<div class="size">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios1" value="8000" onclick="sizePrice()">
						<label class="form-check-label"> Medium[35cm] (+8000) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios1" value="11000" checked="checked"
							onclick="sizePrice()"> <label class="form-check-label">
							Large[45cm] (+11000) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios1" value="15000" onclick="sizePrice()">
						<label class="form-check-label"> Family[55cm] (+15000) </label>
					</div>
				</div>
				<br> <br>

				<!-- dough -->
				<h3>도우 선택</h3>

				<hr style="width: 600px; height: 2px;">
				<div class="dough">
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios2" id="exampleRadios1" value="0"
							checked="checked" onclick="doughPrice()"> <label
							class="form-check-label"> 오리지널 도우 (+0) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios2" id="exampleRadios2" value="2000"
							onclick="doughPrice()"> <label class="form-check-label">
							슈퍼시드 도우 (+2000) <span class="badge bg-secondary">New</span>
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios2" id="exampleRadios3" value="option3"
							disabled> <label class="form-check-label">
							씬도우[품절] (+1500) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios2" id="exampleRadios4" value="2000"
							onclick="doughPrice()"> <label class="form-check-label">
							고구마 바이트 도우 (+2000) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios2" id="exampleRadios5" value="3000"
							onclick="doughPrice()"> <label class="form-check-label">
							치즈 바이트 도우 (+3000) </label>
					</div>
				</div>
				<br> <br>
				<!-- topping -->
				<h3>토핑 선택</h3>
				<hr style="width: 600px; height: 2px;">

				<div class="product" style="width: 600px;">
					<form action="basket.jsp" method="post">
						<select name="topping" class="form-select"
							aria-label="Default select example">
							<option value="양파50g">양파50g (+200)</option>
							<option value="올리브30g">올리브30g (+200)</option>
							<option value="피망50g">피망50g (+500)</option>
							<option value="브로콜리50g">브로콜리50g (+500)</option>
							<option value="양송이버섯50g">양송이버섯50g (+700)</option>
							<option value="포테이토70g">포테이토70g (+700)</option>
							<option value="파인애플 10조각">파인애플 10조각 (+700)</option>
							<option value="핫치킨80g">핫치킨80g (+1100)</option>
							<option value="리얼 불고기80g">리얼 불고기80g (+1400)</option>
							<option value="와규 큐브 스테이크 100g">와규 큐브 스테이크 100g (+3000)</option>
							<option value="포크80g">포크80g (+1100)</option>
							<option value="쉬림프 12마리">쉬림프 12마리 (+2500)</option>
							<option value="블랙 타이거 쉬림프 5마리">블랙 타이거 쉬림프 5마리 (+5500)</option>
							<option value="오징어50g">오징어50g (+700)</option>
							<option value="망고 하바네로 소스">망고 하바네로 소스 (+600)</option>
							<option value="고구마 소스">고구마 소스 (+500)</option>
						</select><br /> <input type="hidden" value="200" id="양파50g" /> <input
							type="hidden" value="200" id="올리브30g" /> <input type="hidden"
							value="500" id="피망50g" /> <input type="hidden" value="500"
							id="브로콜리50g" /> <input type="hidden" value="700" id="양송이버섯50g" />
						<input type="hidden" value="700" id="포테이토70g" /> <input
							type="hidden" value="700" id="파인애플 10조각" /> <input
							type="hidden" value="1100" id="핫치킨80g" /> <input type="hidden"
							value="1400" id="리얼 불고기80g" /> <input type="hidden"
							value="3000" id="와규 큐브 스테이크 100g" /> <input type="hidden"
							value="1100" id="포크80g" /> <input type="hidden" value="2500"
							id="쉬림프 12마리" /> <input type="hidden" value="5500"
							id="블랙 타이거 쉬림프 5마리" /> <input type="hidden" value="700"
							id="오징어50g" /> <input type="hidden" value="600" id="망고 하바네로 소스" />
						<input type="hidden" value="500" id="고구마 소스" />

						<div class="btns">
							<div class="btn-tp" id="plus">
								<button type="button" class="btn-black" onclick="plusTopping();"><span>추가</span></button>
								<!--정보를 넘겨준다.-->
							</div>
							
							<div class="btn-tp" id="reset">
								<button type="button" class="btn-black" onclick="resetTopping();"><span>초기화</span></button>
								<!--정보를 넘겨준다.-->
							</div>
						</div>
						<br>
					</form>
				</div>
				
				<!-- 추가,초기화 버튼과 연결해  선택된 토핑 목록 보여주기 -->
				<form>
					<h3>선택된 토핑 목록</h3>				
					<hr style="width: 600px; height: 2px;">
						<div class="topping-list">
							<span name="select-topping"></span>
						</div>
				</form><br><br>

				<!-- cheese -->
				<h3>치즈 선택</h3>
				<hr style="width: 600px; height: 2px;">
				<div class="cheese">
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios3" value="1500" onclick="cheesePrice()">
						<label class="form-check-label"> 모짜렐라 치즈 200g (-500) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios3" value="2000" onclick="cheesePrice()">
						<label class="form-check-label"> 고르곤 졸라 치즈 200g (+0) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios3" value="2000" onclick="cheesePrice()">
						<label class="form-check-label"> 체다 치즈 200g (+0) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios3" value="2500" onclick="cheesePrice()"
							disabled> <label class="form-check-label"> 까망베르
							치즈 200g (+500)[품절] </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios3" value="2500" onclick="cheesePrice()">
						<label class="form-check-label"> 리코타 치즈 200g (+500) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="exampleRadios3" value="5000" onclick="cheesePrice()">
						<label class="form-check-label" for="exampleRadios1"> 치즈
							SET [모짜렐라/고르곤졸라/리코타] 400g (+3000) </label>
					</div>
				</div>
				<br> <br>

				<!-- drink -->
				<h3>음료 선택</h3>
				<hr style="width: 600px; height: 2px;">
				<div class="drink" style="width: 600px;">
					<select class="form-select" name="beverage"
						onclick="beveragePrice()" aria-label="Default select example">
						<option selected="selected" value="0">음료를 선택하세요</option>
						<option value="1500">콜라 1.5l (+1500)</option>
						<option value="1500">사이다 1.5ml (+1500)</option>
						<option value="8000">생맥주 1000cc (+8000)</option>
					</select>

				</div>
			</div>
			<!-- 오른쪽 피자 이미지 -->
			<div class="image">
				<input type="image" class="pizzaimage" src="./images/shrimp.jpg" alt="error">
			</div>
		</div>
	</div>
</section>
<!-- section end -->

<!-- footer start -->
<footer>
	<hr>
	<!-- 총 금액과 주문완료 버튼 -->
	<div class="top" align="center" id="complete">
		<div>
			<span id="total">총금액: ￦</span> <span id="totalPrice"></span>
		</div>
		<button type="button" class="btn-black" id="btn-rq" onclick="orderAlert()"><span>주문요청</span></button>
	</div>
</footer>
<!-- footer end -->
</body>
</html>