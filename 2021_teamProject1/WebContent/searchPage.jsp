<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
<script defer src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script defer src="js/bootstrap.js"></script>

<style>
a{
	text-decoration: none;
	color: #646464;
}
a:hover{
	text-decoration: none;
 	color: #000000;
}
#prev , #next{
	width: 50px;
	float: left;
}
#cmt-btn{
	width: 80px;
}
</style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//주어진 userID에 연결된 속성값을 얻어낸다.
			userID = (String) session.getAttribute("userID");
		}
		if (request.getParameter("searchField") == "0" || request.getParameter("searchText") == null
				|| request.getParameter("searchField").equals("0")
				|| request.getParameter("searchText").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//현재 페이지가 몇번째 페이지 인가
		int pageNumber = 1;//기본적으로 1페이지
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

	%>
<!-- header -->
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
		<hr>
	</div>
</header>
<!-- header -->

<!-- section -->
<section>
	<div class="board-container">
		<div class="row-2">
			<form method="post" name="search" action="searchPage.jsp">
				<table class="search-tb" style="float: right;">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="boardTitle">제목</option>
								<option value="userID">아이디</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn-black" id="cmt-btn"><span>검색</span></button></td>
					</tr>
				</table>
			</form>
		<h4 style="font-weight: bold; color: #646464;">문의목록</h4><br>
		</div>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 3px solid #ffffff; ">
				<thead>
					<tr>
						<th style="background-color: #464646; text-align: center;">번호</th>
						<th style="background-color: #464646; text-align: center;">제목</th>
						<th style="background-color: #464646; text-align: center;">작성자</th>
						<th style="background-color: #464646; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<% //customerPage의 객체 이름과 같아야한다.
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<BoardVO> list = boardDAO.getSearch(request.getParameter("searchField"),
								request.getParameter("searchText"));
						if (list.size() == 0) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('검색결과가 없습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="background-color: #ffffff"><%= list.get(i).getBoardID() %></td>
						<td><a href="view.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBoardDate().substring(0 ,11) + list.get(i).getBoardDate().substring(11, 13) + "시" + list.get(i).getBoardDate().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<%
			if(pageNumber != 1) {
		%>
			<button type="button" id="prev" class="btn-black" onclick="location.href='customerPage.jsp?pageNumber=<%=pageNumber - 1%>'"><span>&lt;</span></button>
			
		<% 
			} if(boardDAO.nextPage(pageNumber + 1)){ 
		%>
			<button type="button" id="next" class="btn-black" onclick="location.href='customerPage.jsp?pageNumber=<%=pageNumber + 1%>'"><span>&gt;</span></button>
						
		<%
			}
		%>	
	
		<% 
			if( userID != null ){
		%>
			<button type="button" class="btn-black" id="write" onclick="location.href='write.jsp'"><span>글쓰기</span></button>
		<% 
			}
		%>
	</div>
</section>
<!-- section -->

<!-- footer -->
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
</body>
</html>