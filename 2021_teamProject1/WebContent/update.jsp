<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">

<title>TT PIZZA</title>
	<link rel="icon" href="./images/logo-favicon.png">
	<link rel="stylesheet" href="css/mainPage.css?after">
	<link rel="stylesheet" href="css/board.css?after">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script defer src="js/scriptForm.js"type="text/javascript"></script>
	<script defer src="option/jquery/jquery.min.js"></script>
  	<script defer src="option/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script defer src="https://kit.fontawesome.com/f95555e5d8.js" crossorigin="anonymous"></script>
</head>
<style>

</style>
<body>
		
	<%
				String userID = null;
				if(session.getAttribute("userID") != null){
					userID = (String) session.getAttribute("userID");
				}
				//글이 유효한지 검사
				int boardID = 0;
				if(request.getParameter("boardID") != null){
					boardID = Integer.parseInt(request.getParameter("boardID"));
					
				}
				BoardDTO board = new BoardDAO().getBoardVO(boardID);
				/*if(boardID == 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('유효하지 않은 글입니다.')");
					script.println("location.href = 'customerPage.jsp'");
					script.println("</script>");
				}
				if(!userID.equals(board.getUserID())){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('권한이 없습니다.')");
					script.println("location.href = 'customerPage.jsp'");
					script.println("</script>");
				}*/
			%>
	<!-- header start-->
	<header id="header" >
	<!-- header 위 -->
	<nav class="navmenu">
		<!-- 왼쪽 로고 -->
		<div class="navmenu-left">
			<input type="image" src="./images/smilepizza.PNG" alt="로고" width="250px" height="70px" style="align-items: center;">
		</div>
		<!-- 오른쪽 로그인/회원가입 버튼 -->
		<div class="navmenu-right">
			<%
				if(userID == null){
			%>	
			<ul class="login">
				<li class="btn1" onclick="location.href='loginPage.jsp'">로그인&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li class="btn1" onclick="location.href='joinPage.jsp'">회원가입<li>
			</ul>
			<%	
				}else{
			%>
			<ul class="login">
			<li style="font-size: 10pt; color: red;"><%=userID %> 님<br>안녕하세요&nbsp;&nbsp;&nbsp;&nbsp;</li>				
			<li class="btn1" onclick="location.href='sessionLogout.jsp'">로그아웃</li>
			</ul>
			<% 
				}
			%>
		</div>
	</nav>
	<!-- header 아래 -->
	<div class="category">
		<!-- 카테고리 -->
		<ul class="category-list">
			<%
				if(userID == null){
			%>	
			<li class="btn2" onclick="location.href='mainPage.jsp'">메인</li>
			<li class="btn2" onclick="loginOK()">주문하기</li>
			<li class="btn2" onclick="location.href='mainPage.jsp'">매장찾기</li>
			<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>			
			<%	
				}else{
			%>
			<li class="btn2" onclick="location.href='sessionMain.jsp'">메인</li>
			<li class="btn2" onclick="location.href='orderPage.jsp'">주문하기</li>
			<li class="btn2" onclick="location.href='sessionMain.jsp'">매장찾기</li>
			<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>			
			<% 
				}
			%>
		</ul>
		<hr><br>
	</div>
	</header>
	<!-- header end-->
	<section>
		<div class="board-container">
			<div class="row">
			<h4 style="font-weight: bold; color: #646464;">수정하기</h4><br><br>
				<form method="post" action="updateAction.jsp?boardID=<%= boardID %>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #464646; text-align: center; color: #ffffff;">게시판 글 수정</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50" value="<%= board.getBoardTitle() %>"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 350px;"><%= board.getBoardContent() %></textarea></td>
							</tr>
						</tbody>
					</table>
					<button type="submit" class="btn-black" value="글쓰기"><span>완료</span></button>
				</form>
			</div>
		</div>
	</section>
	<!-- footer start -->
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
		<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>