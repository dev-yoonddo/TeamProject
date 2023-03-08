<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자가게</title>
	<link rel="icon" href="./images/logo-favicon.png">
	<link href="mainPage.css" rel="stylesheet">
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>

<!-- login/register style -->
<style type="text/css">

.colorgraph {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #ef1e1e, #ef1e1e 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #535d40, #535d40 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #000000, #000000 12.5%, #000000 12.5%, #000000 25%, #000000 25%, #000000 37.5%, #000000 37.5%, #000000 50%, #000000 50%, #000000 62.5%, #000000 62.5%, #000000 75%, #000000 75%, #000000 87.5%, #000000 87.5%, #000000);
  background-image: linear-gradient(to right, #000000, #000000 12.5%, #000000 12.5%, #000000 25%, #000000 25%, #000000 37.5%, #000000 37.5%, #000000 50%, #000000 50%, #000000 62.5%, #000000 62.5%, #000000 75%, #000000 75%, #000000 87.5%, #000000 87.5%, #000000);
}

</style>

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

</head>
<body>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<header>
	<div class="left">
			<input type="image" src="./images/flowerlogo.png" alt="로고" width="330px" height="100px" onclick="location.href='mainPage.jsp'">
	</div>
</header>
<section>
<div class="container"><!-- 하나의 영역 생성 -->
    <div class="col-xs-24 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3"><!-- 영역 크기 -->
		<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스이다. -->
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align: center;">로그인 화면</h3>
				<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
				
			</form>
		</div>
	</div>
</div>
</section>

 <!-- Footer -->
  <br/><br/><br/><br/><br/><br/>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">06223 서울특별시 강남구 역삼로25길 35(역삼동, 청오큐브타워) 청오디피케이㈜｜대표이사 : 오광현</p>
      <p class="m-0 text-center text-white">사업자 등록번호: 220-81-03371｜통신판매업신고: 강남 5064호｜개인정보 보호책임자 : 이명윤</p>
      <p class="m-0 text-center text-white">문의 : webmaster@dominos.co.kr</p>
      <p class="m-0 text-center text-white">Copyright ⓒ Domino’s Pizza. All rights reserved.</p>
      <p class="m-0 text-center text-white">청오디피케이㈜의 사전 서면동의 없이 도미노피자 사이트(PC, 모바일, 앱)의 일체의 정보, 콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</p>
    </div>
  </footer>
  
</body>
</html>

















