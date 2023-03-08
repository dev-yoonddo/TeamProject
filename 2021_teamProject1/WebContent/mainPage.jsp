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

	
</head>
<body>
		
	<!-- header start-->
	<header id="header" style="transform: translateY(0px);">
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
			<li class="btn2-pt"><div class="btn2" onclick="location.href='#'">메인</div></li>
			<li class="btn2-pt"><div class="btn2" onclick="location.href='orderPage.jsp'">주문하기</div></li>
			<li class="btn2-pt"><div class="btn2" onclick="location.href='eventPage.jsp'">이벤트</div></li>
			<li class="btn2-pt"><div class="btn2" onclick="location.href='customerPage.jsp'">고객센터</div></li>
			
		</ul>
		<hr>
	</div>
	</header>

	<!-- header end-->
	
	<!-- section start-->
	<section>
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
          </div><br>
       
		<!-- 주문하기 버튼 -->
		<div class="orderBtn">
			<div class="order" onclick="LoginOK()">주문하기</div>
		</div>
		
		<!-- 지도삽입 -->
		<div class="map" align="center">
			<div class="folium-map" id="map_481df0d1cbfe4f409885780076872d2a" ></div>
		</div>
	</section>
	<!-- section end-->
	
	
	
	
	
	<!-- footer start-->
	<footer>
		
		<!-- 가게 정보 -->
		<div class="location">
			<div class="container" style="color: white">
	      		<p class="m-0 text-center">06223 서울특별시 강남구 역삼로1004길 (역삼동, 대박타워) 웃음꽃㈜｜대표이사 : </p>
	      		<p class="m-0 text-center">사업자 등록번호: 222-22-22222｜통신판매업신고: 강남 1004호｜개인정보 보호책임자 : </p>
	      		<p class="m-0 text-center">문의 : Webmaster@Happyflower.co.kr</p>
	      		<p class="m-0 text-center">Copyright ⓒ Happyflower’s Pizza. All rights reserved.</p>
	      		<p class="m-0 text-center">웃음꽃㈜의 사전 서면동의 없이 웃음꽃피자 사이트(PC, 모바일)의 일체의 정보, 콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</p>
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