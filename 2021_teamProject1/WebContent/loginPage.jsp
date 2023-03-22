<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TT PIZZA</title>
	<link rel="icon" href="./images/logo-favicon.png">
	<link href="css/mainPage.css" rel="stylesheet">
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script defer src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<script defer src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script defer src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
</head>


<!-- login/register style -->
<style type="text/css">


.login-section{
	padding: 0;
	margin: 0;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 50px;
	padding-bottom: 150px;
}
.login-form{
	padding: 0;
	margin: 0;
	width: 400px;
}
.btn-black{
	padding: 0;
	margin: 0;
	width: 190px;
}
</style>




</head>
<body>
<!-- header start-->
<header id="header" >
	<!-- header 위 -->
	<nav class="navmenu">
		<!-- 왼쪽 로고 -->
		<div class="navmenu-left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" onclick="location.href='mainPage.jsp'"width="250px" height="70px" style="align-items: center;">
		</div>
		<!-- 오른쪽 로그인/회원가입 버튼 -->
		<div class="navmenu-right">	
			<ul class="login">
			</ul>
		</div>
	</nav>
	<!-- header 아래 -->
	<div class="category">
		<!-- 카테고리 -->
		<ul class="category-list">
			<li class="btn2" onclick="location.href='mainPage.jsp'">메인</li>
			<li class="btn2" onclick="loginOK()">주문하기</li>
			<li class="btn2" onclick="location.href='mainPage.jsp'">매장찾기</li>
			<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>			
		</ul>
		<hr>
	</div>
</header>

<!-- section -->
<section>
<div class="login-section">
	<div class="login-form">
		<h3>로그인</h3><br>
		<form role="form" action="loginAction.jsp" method="post">
		  <div class="mb-3">
		    <input type="text" name="userID" id="userID" class="form-control input-lg" placeholder="아이디 입력">
		  </div>
		  <div class="mb-3">
		    <input type="password" name="userPassword" id="userPassword" class="form-control input-lg" placeholder="비밀번호 입력">
		  </div>
		  <div class="btn-join" align="center">
			<button type="submit" class="btn-black" ><span>확인</span></button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn-black" onclick="location.href='joinPage.jsp'"><span>회원가입</span></button>
		</div>
		</form>
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
 
 
<!-- login script -->
<script type="text/javascript">

$(function(){
    $('.button-checkbox').each(function(){
		var $widget = $(this),
			$button = $widget.find('button'),
			$checkbox = $widget.find('input:checkbox'),
			color = $button.data('color'),
			settings = {
					on: {
						icon: 'glyphicon glyphicon-check'
					},
					off: {
						icon: 'glyphicon glyphicon-unchecked'
					}
			};

		$button.on('click', function () {
			$checkbox.prop('checked', !$checkbox.is(':checked'));
			$checkbox.triggerHandler('change');
			updateDisplay();
		});

		$checkbox.on('change', function () {
			updateDisplay();
		});

		function updateDisplay() {
			var isChecked = $checkbox.is(':checked');
			// Set the button's state
			$button.data('state', (isChecked) ? "on" : "off");

			// Set the button's icon
			$button.find('.state-icon')
				.removeClass()
				.addClass('state-icon ' + settings[$button.data('state')].icon);

			// Update the button's color
			if (isChecked) {
				$button
					.removeClass('btn-default')
					.addClass('btn-' + color + ' active');
			}
			else
			{
				$button
					.removeClass('btn-' + color + ' active')
					.addClass('btn-default');
			}
		}
		function init() {
			updateDisplay();
			// Inject the icon if applicable
			if ($button.find('.state-icon').length == 0) {
				$button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
			}
		}
		init();
	});
});
</script>
</body>
</html>

















