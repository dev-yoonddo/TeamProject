<%@page import="java.util.ArrayList"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>피자가게</title>
	<link rel="icon" href="./images/logo-favicon.png">
	<link href=https://www.google.com/webhp?hl=ko&sa=X&ved=0ahUKEwiu0fHoy4P0AhWxy4sBHT3IBdsQPAgI"orderPage.css" rel="stylesheet">
	<link href="orderPage.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>

<body>
<!--header start-->
<header>
	<div class="left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" width="330px" height="100px" onclick="location.href='mainPage.jsp'">
	</div>
</header>
<!-- header end -->
<hr>
<br>
<script type="text/javascript" src="./js/order.js"></script>

<!-- section start -->
<section>
	<!-- title -->
	<div class="title-box">
		<font size="7"><strong>나만의 피자 만들기</strong></font>
		<div class="hashtag">
		<font size="4">#내가 좋아하는 재료만!</font>
		</div>
		<hr width="1600px" size="7px">
	</div><br>
	
	<!-- option -->
	
	
	<div class="image">
			<input type="image" src="./images/shrimp.jpg" alt="error" width="900px" height="1250px" align="right">
		</div>	
		
	<div class="selectoption">
		<div class="option">
		
		<font size="5"><strong>사이즈 선택</strong></font>
		
		<hr width="600px" size="5px">
			<div class="size">
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="8000" onclick="sizePrice()">
				  <label class="form-check-label" for="exampleRadios1">
				  Medium[35cm] (+8000)
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="11000" checked="checked" onclick="sizePrice()">
				  <label class="form-check-label" for="exampleRadios1">
				  Large[45cm] (+11000)
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="15000" onclick="sizePrice()">
				  <label class="form-check-label" for="exampleRadios1">
				  Family[55cm] (+15000)
				  </label>
				</div>
			</div>
			<br><br>
				
				
		<font size="5"><strong>도우 선택</strong></font>
		
		<hr width="600px" size="5px">
			<div class="dough">
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios1" value="0" checked="checked" onclick="doughPrice()">
				  <label class="form-check-label" for="exampleRadios1">
				  오리지널 도우 (+0)
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios2" value="2000" onclick="doughPrice()">
				  <label class="form-check-label" for="exampleRadios2">
				    슈퍼시드 도우 (+2000)
				    <span class="badge bg-secondary">New</span>
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios3" value="option3" disabled>
				  <label class="form-check-label" for="exampleRadios3">
				    씬도우[품절] (+1500)
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios4" value="2000" onclick="doughPrice()">
				  <label class="form-check-label" for="exampleRadios4">
				    고구마 바이트 도우 (+2000)
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios5" value="3000" onclick="doughPrice()">
				  <label class="form-check-label" for="exampleRadios5">
				    치즈 바이트 도우 (+3000)
				  </label>
				</div>
			</div>
			<br><br>
		
		<font size="5"><strong>토핑 선택</strong></font>
			
				<form action="basket.jsp" method="post">
				<hr width="600px" size="5.5px"> 
				<div class="product" style="width: 600px;">
				<select name="product" class="form-select" aria-label="Default select example">
				<option value = "양파50g">양파50g (+200)</option>
				<option value = "올리브30g">올리브30g (+200)</option>
				<option value = "피망50g">피망50g (+500)</option>
				<option value = "브로콜리50g">브로콜리50g (+500)</option>
				<option value = "양송이버섯50g">양송이버섯50g (+700)</option>
				<option value = "포테이토70g">포테이토70g (+700)</option>
				<option value = "파인애플 10조각">파인애플 10조각 (+700)</option>
				<option value = "핫치킨80g">핫치킨80g (+1100)</option>				
				<option value = "리얼 불고기80g">리얼 불고기80g (+1400)</option>
				<option value = "와규 큐브 스테이크 100g">와규 큐브 스테이크 100g (+3000)</option>
				<option value = "포크80g">포크80g (+1100)</option>
				<option value = "쉬림프 12마리">쉬림프 12마리 (+2500)</option>
				<option value = "블랙 타이거 쉬림프 5마리">블랙 타이거 쉬림프 5마리 (+5500)</option>
				<option value = "오징어50g">오징어50g (+700)</option>
				<option value = "망고 하바네로 소스">망고 하바네로 소스 (+600)</option>
				<option value = "고구마 소스">고구마 소스 (+500)</option>
				</select><br/>
				<input type="hidden" value="200" id="양파50g"/>
				<input type="hidden" value="200" id="올리브30g"/>
				<input type="hidden" value="500" id="피망50g"/>
				<input type="hidden" value="500" id="브로콜리50g"/>
				<input type="hidden" value="700" id="양송이버섯50g"/>
				<input type="hidden" value="700" id="포테이토70g"/>
				<input type="hidden" value="700" id="파인애플 10조각"/>
				<input type="hidden" value="1100" id="핫치킨80g"/>
				<input type="hidden" value="1400" id="리얼 불고기80g"/>
				<input type="hidden" value="3000" id="와규 큐브 스테이크 100g"/>
				<input type="hidden" value="1100" id="포크80g"/>
				<input type="hidden" value="2500" id="쉬림프 12마리"/>
				<input type="hidden" value="5500" id="블랙 타이거 쉬림프 5마리"/>
				<input type="hidden" value="700" id="오징어50g"/>
				<input type="hidden" value="600" id="망고 하바네로 소스"/>
				<input type="hidden" value="500" id="고구마 소스"/>
				<div align="center">
				<input style="font-size: 1.3em" type="submit" value="추가" onclick="toppingPlus()"><!--정보를 넘겨준다.-->
				</div><br/>
				<div align="center">
				<input style="font-size: 1.3em" type="submit" value="초기화" onclick="resetTopping()"><!--정보를 넘겨준다.-->
				</div>
				<br>
				<br>
				</form>
				</div>
				
			<form>
			
			<div>
			
			<font size="5">선택된 토핑 목록</font>
			<hr style="border: outset 5px tomato;">
			    <%
			    ArrayList<String> list=null;
			    if(session.getAttribute("ArrayList")==null){
			       
			    }//ArrayList가 비어있으면 상품이 없습니다를 출력함.
			    else{
			    list=(ArrayList<String>)session.getAttribute("ArrayList");
			    }//아니면 ArrayList에 있는 내용을 출력해라
			    %>
				<span name="topping"></span>
			</div>
			</form>
				<hr><br/>
			
			
			
				<!-- cheese option -->
				<font size="5"><strong>치즈 선택</strong></font>
				<hr width="600px" size="5px">
				
				<div class="cheese" style="width: 600px;">
				  <label name="product" class="list-group-item">
				  	<input class="form-check-input" type="radio" name="exampleRadios3" id="exampleRadios1" value="1500" onclick="cheesePrice()">
				    모짜렐라 치즈 200g (+1500)
				  </label>
				   <label class="list-group-item">
				    <input class="form-check-input" type="radio" name="exampleRadios3" id="exampleRadios4" value="2000" onclick="cheesePrice()">
				    고르곤 졸라 치즈 200g (+2000)
				  </label>
				  <label class="list-group-item">
				    <input class="form-check-input" type="radio" name="exampleRadios3" id="exampleRadios2" value="2000" checked="checked" onclick="cheesePrice()">
				    체다 치즈 200g (+2000)
				    <span class="badge bg-secondary">New</span>
				  </label>
				  <label class="list-group-item">
				    <input class="form-check-input" type="radio" name="exampleRadios3" id="exampleRadios3" value="2500" disabled="disabled">
				    까망베르 치즈 200g (+2500)[품절] 
				  </label>
				  <label class="list-group-item">
				    <input class="form-check-input" type="radio" name="exampleRadios3" id="exampleRadios4" value="2500" onclick="cheesePrice()">
				    리코타 치즈 200g (+2500)
				  </label>
				  <label class="list-group-item">
				    <input class="form-check-input" type="radio" name="exampleRadios3" id="exampleRadios5" value="5000" onclick="cheesePrice()">
				    치즈 SET [모짜렐라/고르곤졸라/리코타] 400g (+5000)
				  </label>
				</div><br><br>
				
				<!-- drink option -->
				<font size="5"><strong>음료 선택</strong></font>
				<hr width="600px" size="5px">
				<div class="drink" style="width: 600px;">
					<select class="form-select" name="beverage" onclick="beveragePrice()" aria-label="Default select example">
					  <option selected="selected" value="0">음료를 선택하세요</option>
					  <option value="1500">콜라 1.5l (+1500)</option>
					  <option value="1500">사이다 1.5ml (+1500)</option>
					  <option value="8000">생맥주 1000cc (+8000)</option>
					</select>
					
				</div>
		</div>
		
</section>
<!-- section end -->

<!-- footer start -->
<footer><hr>

	<!-- 주문완료 버튼 -->
	<div class="top" align="center" id="complete">
		<div>
			&nbsp;&nbsp;<span id="total">총금액: ￦</span>&nbsp;
			<span id="totalPrice"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<button style="font-size: 2.3em" id="btn" type="button" class="btn btn-danger btn-lg" mx="auto" onclick="orderAlert()" >주문요청</button>
	</div>
</footer>
<!-- footer end -->
</body>
</html>