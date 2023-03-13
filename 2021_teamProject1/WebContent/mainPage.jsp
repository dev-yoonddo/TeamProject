<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<meta charset="UTF-8">

<title>피자가게</title>
	<link rel="icon" href="./images/logo-favicon.png">
	<link rel="stylesheet" href="css/mainPage.css?after">
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="js/scriptForm.js"type="text/javascript"></script>

	<!-- map -->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
        <script>
            L_NO_TOUCH = false;
            L_DISABLE_3D = false;
        </script>
    
    <style>html, body {width: 100%;height: 100%;margin: 0;padding: 0;}</style>
    <style>#map {position:absolute;top:0;bottom:0;right:0;left:0;}</style>
    <script src="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/python-visualization/folium/folium/templates/leaflet.awesome.rotate.min.css"/>   
    <!-- map -->

	<style>
		
	</style>
	
</head>
<body>
		
	<!-- header start-->
	<header id="header" >

	<nav class="navmenu">
		<div class="navmenu-left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" width="250px" height="70px" style="align-items: center;">
		</div>
		
		<div class="navmenu-right">	
			<ul class="login">
				<li class="btn1-login"><button type="button" class="btn btn-outline-gray" id="btn1" onclick="location.href='loginForm.jsp'">로그인</button>&nbsp;</li>
				<li class="btn1-join"><button type="button" class="btn btn-outline-gray" id="btn1" onclick="location.href='registerPage.jsp'">회원가입</button></li>
			</ul>
		</div>
	</nav>
	<div class="category">
		<ul class="category-list">
			<!-- <li class="active"><a href="mainPage.jsp">메인</a></li> -->
			<li class="btn2" onclick="location.href='#'">메인</li>
			<li class="btn2" onclick="loginOK()">주문하기</li>
			<li class="btn2" onclick="location.href='eventPage.jsp'">이벤트</li>
			<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>			
		</ul>
		<hr>
	</div>

	</header>

	<!-- header end-->
	
	<!-- section start-->
	<section>
	
		<!-- 플로팅 배너 -->
		<div class="floatingBanner">
	    	<a href="/event/viewHtml?seq=1225&amp;gubun=E0200">
	        	<img src="images/floatBN.png">
	        </a>
	        <button class="btn-close"></button>
	    </div>
	    
		<!-- 메인화면 슬라이드 -->
        
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel" align="center" style="width: 1530px; height: 500px;">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="./images/main2.png" alt="First slide">
            </div>
            
            <div class="carousel-item">
              <img class="d-block img-fluid" src="./images/main1.jpg" alt="Second slide">
            </div>
        </div>
       
		<!-- 메인화면 버튼 섹션 -->
		<div class="btn-main" >
			<!-- 주문하기 -->
			<div class="btn-item" id="order" onclick="loginOK()">
				<div>
					<i class="fa-solid fa-store fa-2x" style="font-size: 60pt;"></i>
					<div style="display: flex;">
						<div style="text-align: center;">
							<h1>주문하기</h1>
							<p>지금 바로 주문하세요!</p>
						</div>&nbsp;
						<i class="fa-solid fa-circle-arrow-right" style="font-size: 30pt; margin-top: 18px;"></i>
					</div>
				</div>
			</div><br><br><br>
			<!-- 회원 가입하기 -->
			<div class="btn-item" id="join" onclick="location.href='registerPage.jsp'" style="outline-color: blue;">
				<div>
					<i class="fa-solid fa-user-plus fa-2x" style="font-size: 60pt;"></i>
					<div style="display: flex;">
						<div style="text-align: center;">
							<h1>신규가입</h1>
							<p>신규가입시 음료무료!</p>
						</div>&nbsp;
						<i class="fa-solid fa-circle-arrow-right" style="font-size: 30pt; margin-top: 18px;"></i>
					</div>
				</div>
			</div>
			<!-- 문의하기 -->
			<div class="btn-item" id="inquiry" onclick="loginOK()" style="outline-color: green;">
				<div>
					<i class="fa-solid fa-comments fa-2x" style="font-size: 60pt;"></i>
					<div style="display: flex;">
						<div style="text-align: center;">
							<h1>문의하기</h1>
							<p>무엇이든 문의하세요</p>
						</div>&nbsp;
						<i class="fa-solid fa-circle-arrow-right" style="font-size: 30pt; margin-top: 18px;"></i>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 지도삽입 -->
		<div class="map-section">
			<div class="map">
			<div class="folium-map" id="map_481df0d1cbfe4f409885780076872d2a" ></div>
			</div>
			<div class="map-inform">
				<p>위치 찾기</p>
				<!-- 콤보 상자에서 어떤 option 요소가 선택(변경)되면 실행되는 이벤트는 onchange 이벤트이다.-->
				<div class="si-do-select">
				<select id="si-do" style="width: 150px; height: 35px" onchange="sidoCheck()">
					<option selected>시/도</option>
					<option value="01">서울</option>
					<option value="02">인천</option>
					<option value="03">경기</option>
				</select>
				</div>
				
				<div class="gu-gun-select">
					<div class="gu-gun-select">
						<select id="gu-gun" style="width: 150px; height: 35px">
						<option value="">구/군</option>
						<option value="0111">강남구</option>
						<option value="0110">강동구</option>
						<option value="0117">강북구</option>
						<option value="0124">강서구</option>
						<option value="0120">관악구</option>
						<option value="0118">광진구</option>
						<option value="0121">구로구</option>
						<option value="0122">금천구</option>
						<option value="0115">노원구</option>
						<option value="0108">도봉구</option>
						<option value="0106">동대문구</option>
						<option value="0123">동작구</option>
						<option value="0104">마포구</option>
						<option value="0103">서대문구</option>
						<option value="0113">서초구</option>
						<option value="0109">성동구</option>
						<option value="0112">성북구</option>
						<option value="0114">송파구</option>
						<option value="0125">양천구</option>
						<option value="0119">영등포구</option>
						<option value="0116">용산구</option>
						<option value="0105">은평구</option>
						<option value="0102">종로구</option>
						<option value="0101">중구</option>
						<option value="0107">중랑구</option>
						
						<option value="0202">계양구</option>
						<option value="0204">남동구</option>
						<option value="0203">미추홀구</option>
						<option value="0206">부평구</option>
						<option value="0207">서구</option>
						<option value="0208">연수구</option>
						<option value="0210">중구</option>
						
						<option value="0301">고양시</option>
						<option value="0302">과천시</option>
						<option value="0303">광명시</option>
						<option value="0304">광주시</option>
						<option value="0305">구리시</option>
						<option value="0306">군포시</option>
						<option value="0307">김포시</option>
						<option value="0308">남양주시</option>
						<option value="0309">동두천시</option>
						<option value="0310">부천시</option>
						<option value="0311">성남시</option>
						<option value="0312">수원시</option>
						<option value="0313">시흥시</option>
						<option value="0314">안산시</option>
						<option value="0315">안성시</option>
						<option value="0316">안양시</option>
						<option value="0327">양주시</option>
						<option value="0317">양평군</option>
						<option value="0318">여주군</option>
						<option value="0318">여주시</option>
						<option value="0320">오산시</option>
						<option value="0321">용인시</option>
						<option value="0322">의왕시</option>
						<option value="0323">의정부시</option>
						<option value="0324">이천시</option>
						<option value="0325">파주시</option>
						<option value="0328">평택시</option>
						<option value="0329">포천시</option>
						<option value="0330">하남시</option>
						<option value="0331">화성시</option>
						</select>
					</div>
				</div>			
			</div>
		</div>
	</section>
	<!-- section end-->
	
	
	
	
	
	<!-- footer start-->
	<footer>
    	<div class="download-app">
    		<div class="app-box">
	    		<p>DOWNLOAD APP</p>
	    		<div style="display: flex; justify-content: center;">
	    		<div>
			    	<a href="https://itunes.apple.com/kr/app/"><i id="app" class="fa-brands fa-apple"></i></a>&nbsp;&nbsp;&nbsp;
			    	<a href="https://play.google.com/store/apps/"><i id="app" class="fa-brands fa-google-play"></i></a>
		    	</div>
		    	</div>
	    	</div>
	   
	    	<div class="animated-text">
			  <div class="track">
			    <div class="content" id="content">&nbsp;지금 앱을 다운로드 하면 여러가지 할인 혜택을 받으실 수 있습니다.
			    내가 좋아하는 재료로 나만의 피자를 만들어 보세요 ! If you download the app now, you can enjoy various discounts.
				Make your own pizza with your favorite ingredients!</div>
			  </div>
			</div>
    	</div>
		
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
	
	
	<script src="option/jquery/jquery.min.js"></script>
  	<script src="option/bootstrap/js/bootstrap.bundle.min.js"></script>
  	
  	<!-- floating banner script -->
  	<script>
	    $('.floatingBanner .btn-close').on('click', function(){
	        $(this).parents('.floatingBanner').hide();
	    });
	</script>
  	<!-- map script -->
  	<script>    
    
            var map_481df0d1cbfe4f409885780076872d2a = L.map(
                "map_481df0d1cbfe4f409885780076872d2a",
                {
                    center: [37.49999404577967, 127.03552168205158],
                    crs: L.CRS.EPSG3857,
                    zoom: 17,
                    zoomControl: true,
                    preferCanvas: false,
                }
            );

        
            var tile_layer_78f4264a19e64aab83b57e84f5a5f7c3 = L.tileLayer(
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                {"attribution": "Data by \u0026copy; \u003ca href=\"http://openstreetmap.org\"\u003eOpenStreetMap\u003c/a\u003e, under \u003ca href=\"http://www.openstreetmap.org/copyright\"\u003eODbL\u003c/a\u003e.", "detectRetina": false, "maxNativeZoom": 18, "maxZoom": 18, "minZoom": 0, "noWrap": false, "opacity": 1, "subdomains": "abc", "tms": false}
            ).addTo(map_481df0d1cbfe4f409885780076872d2a);
        
    
            var marker_29516eae4bc74c5495711d6b6f66ad6d = L.marker(
                [37.49999404577967, 127.03552168205158],
                {}
            ).addTo(map_481df0d1cbfe4f409885780076872d2a);
        
    
            var icon_d625e7ce6a4241df836553729811f26a = L.AwesomeMarkers.icon(
                {"extraClasses": "fa-rotate-0", "icon": "star", "iconColor": "white", "markerColor": "pink", "prefix": "glyphicon"}
            );
            marker_29516eae4bc74c5495711d6b6f66ad6d.setIcon(icon_d625e7ce6a4241df836553729811f26a);
        
    
        var popup_8432c7b80a1c40828405b6ee597c6d63 = L.popup({"maxWidth": 100});

        
            var html_8a7a7cbe05f24d40a333a24b2410a5fc = $(`<div id="html_8a7a7cbe05f24d40a333a24b2410a5fc" style="width: 100.0%; height: 100.0%;">웃음꽃피자</div>`)[0];
            popup_8432c7b80a1c40828405b6ee597c6d63.setContent(html_8a7a7cbe05f24d40a333a24b2410a5fc);
        

        marker_29516eae4bc74c5495711d6b6f66ad6d.bindPopup(popup_8432c7b80a1c40828405b6ee597c6d63)
        ;

        
    
    
            var circle_marker_82f83dc5b5ee47ef8274af526034881d = L.circleMarker(
                [37.49999404577967, 127.03552168205158],
                {"bubblingMouseEvents": true, "color": "#B93CE8", "dashArray": null, "dashOffset": null, "fill": true, "fillColor": "#0DFB78", "fillOpacity": 0.2, "fillRule": "evenodd", "lineCap": "round", "lineJoin": "round", "opacity": 1.0, "radius": 100, "stroke": true, "weight": 3}
            ).addTo(map_481df0d1cbfe4f409885780076872d2a);
        
    
        var popup_f40c632e484948cdb6a81cc9b8bb0955 = L.popup({"maxWidth": 100});

        
            var html_7894441ef83943c6bbc40f4ff9d7af0d = $(`<div id="html_7894441ef83943c6bbc40f4ff9d7af0d" style="width: 100.0%; height: 100.0%;">웃음꽃피자</div>`)[0];
            popup_f40c632e484948cdb6a81cc9b8bb0955.setContent(html_7894441ef83943c6bbc40f4ff9d7af0d);
        

        circle_marker_82f83dc5b5ee47ef8274af526034881d.bindPopup(popup_f40c632e484948cdb6a81cc9b8bb0955)
        ; 
</script>

<script src="https://kit.fontawesome.com/f95555e5d8.js" crossorigin="anonymous"></script>

</body>
</html>