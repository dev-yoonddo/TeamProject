<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<meta charset="UTF-8">

<title>피자가게</title>
	<link rel="icon" href="./images/logo-favicon.png">
	<link rel="stylesheet" href="mainPage.css?after">
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


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
    
            <meta name="viewport" content="width=device-width,
                initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- map -->

</head>

<body>
	<!-- header start-->
	<header>
	<% 
	// 세션값 가져오기
	String id = (String) session.getAttribute("userID"); // Object 타입이므로 다운캐스팅
	%>
	<nav class="navmenu">
		<div class="navmenu-left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" width="250px" height="70px" style="align-items: center;">
		</div>
		
		<div class="navmenu-right">	
			<ul class="login">
				<li style="font-size: 10pt;"><%=id %> 님이 로그인하였습니다.&nbsp&nbsp&nbsp&nbsp</li>
				<li ><button type="button" class="btn btn-outline-gray" id="btn" onclick="location.href='sessionLogout.jsp'">로그아웃</button></li>
			</ul>
		</div>
	</nav>
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
	    <script>
	    $('.floatingBanner .btn-close').on('click', function(){
	        $(this).parents('.floatingBanner').hide();
	    });
	    </script>
		<!-- 메인화면 슬라이드 -->
        
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel" align="center" style="width: 1600px; height: 500px;">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="./images/main2.png" alt="First slide">
            </div>
            
            <div class="carousel-item">
              <img class="d-block img-fluid" src="./images/main1.jpg" alt="Second slide">
            </div>
          </div><br>
       <script type="text/javascript" src="./js/loginOK.js"></script>
		<!-- 주문하기 버튼 -->
		<div class="orderBtn" align="center">
			<button style= "font-size: 2.0em;" type="button" class="btn btn-secondary btn-lg" mx="auto" onclick="location.href='orderPage.jsp'" >주문하기</button>
		</div>
	</section>
	<!-- section end-->


	<!-- footer start-->
	<footer>
		<!-- 지도삽입 -->
		<div class="map" align="center">
			<div class="folium-map" id="map_481df0d1cbfe4f409885780076872d2a" ></div>
		</div>
		
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
</body>
</html>