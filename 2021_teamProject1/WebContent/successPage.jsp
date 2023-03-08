<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자가게</title>
	<link rel="icon" href="./images/logo-favicon.png">
	<link href=https://www.google.com/webhp?hl=ko&sa=X&ved=0ahUKEwiu0fHoy4P0AhWxy4sBHT3IBdsQPAgI"orderPage.css" rel="stylesheet">
	<link href="orderPage.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<style media="screen">
      #divClock{
        font-size: 30px;
        color: black;
        background-color: white;
    
      }
  </style>
  
    <script type="text/javascript">
      function showClock() {
          var currentDate = new Date();
          var divClock = document.getElementById("divClock");
          if (currentDate.getHours() > 12) { //현재의 시가 12보다 크다면
            var msg = "현재 시간 : 오후 "+(currentDate.getHours()-12)+"시";
          }//오후 를 출력하고 현재 시 에서 12를 빼고 출력. 
          else {
            var msg = "현재 시간 : 오전 "+currentDate.getHours()+"시";
          }//아니라면 그대로 출력하지만 앞에 오전을 붙여준다.
          msg+=currentDate.getMinutes()+"분";
          msg+=currentDate.getSeconds()+"초";

          divClock.innerText = msg;
          setTimeout(showClock,1000); //1초마다 갱신
      }
    </script>
</head>

<body onload="showClock()">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<header>
	<div class="left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" width="330px" height="100px" onclick="location.href='mainPage.jsp'">
	</div>
</header><hr>


<section>
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3" align="center">
			<form role="form">
			<fieldset>

			
			<div>
			<input type="image" src="./images/smilepizza.PNG" alt="" width="330px" height="100px">
			</div>
						
			<!-- time -->
			<h2>주문 요청이 완료되었습니다</h2><br/>
			<div id="divClock" class="clock">
			</div>
			<h2>20분뒤에 방문해주세요</h2>
			<font size="5"><strong>☞서울특별시 강남구 역삼로1004길☜</strong></font><br/><br/>
			
			<!-- time -->
			
			<div class="top"align="center">
				<button style= "font-size: 3.0em" type="button" class="btn btn-success btn-lg" mx="auto" onclick="location.href='sessionMain.jsp'" >홈으로</button>
			</div><br/>
					
			</fieldset>
		</form>
	</div>
	
</section>


</body>
</html>