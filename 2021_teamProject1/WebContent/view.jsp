<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html>
<html>
<head>
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
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int boardID = 0;
	if(request.getParameter("boardID") != null){
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	if(boardID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'customerPage.jsp'");
		script.println("</script>");
	}
	BoardVO board = new BoardDAO().getBoardVO(boardID);
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
				<li style="font-size: 10pt; color: red;"><%=userID %> 님이<br>로그인하였습니다.&nbsp;&nbsp;</li>
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
			<div class="row"><br>
			<h4 style="font-weight: bold; color: #646464;">문의 글</h4><br><br>
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #464646; text-align: center;">문의한 글 보기</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td" style="width:20%;">글 제목</td>
								<td colspan="2"><%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
							</tr>
							<tr>
								<td class="td">작성자</td>
								<td colspan="2"><%= board.getUserID() %></td>
							</tr>
							<tr>
								<td class="td">작성일자</td>
								<td colspan="2"><%= board.getBoardDate().substring(0 ,11) + board.getBoardDate().substring(11, 13) + "시" + board.getBoardDate().substring(14, 16) + "분" %></td>
							</tr>
							<tr>
								<td class="td">내용</td>
								<!-- 특수문자 처리 -->
								<td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
							</tr>
						</tbody>
					</table>
				</div>
				<button type="button" class="btn-black" onclick="location.href='customerPage.jsp'"><span>목록</span></button>
				
				<%
					if(userID != null && userID.equals(board.getUserID())){  //작성자 본인이 쓴 글일때
				%>
					<button type="button" class="btn-black" onclick="location.href='update.jsp?boardID=<%= boardID%>'"><span>수정</span></button>
					<button type="button" class="btn-black" id="btn-del" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='deleteAction.jsp?boardID=<%= boardID%>'}"><span>삭제</span></button>
				<%	
					}
				%>
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