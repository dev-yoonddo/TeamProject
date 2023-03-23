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
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 부트스트랩 참조 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> 

<title>게시판</title>
</head>
<style>

</style>
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
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		BoardVO board = new BoardDAO().getBoardVO(boardID);
		%>
	
		<nav class="navbar navbar-default"> <!-- 네비게이션 -->
				<div class="navbar-header"> <!-- 네비게이션 상단 -->
						<!-- 네비게이션 상단 박스 영역 -->
						<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
								aria-expanded="flase">
								<!-- 이 버튼 세줄은 화면이 좁아지면 우측에 나타난다. -->
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								
						</button>
						<!--  상단 바에 제목이 나타나고 클릭하면 main으로 이동 -->
						<a class="navbar-brand" href="mainPage.jsp">나블나블</a>
				</div>
				<!-- 제목 이름 옆 메뉴 -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<!-- <li class="active"><a href="mainPage.jsp">메인</a></li> -->
							<li class="active"><a href="board.jsp">게시판</a></li>
							<li><a href="shop.jsp">쇼핑몰</a></li>
							<li><a href="visit.jsp">방명록</a></li>
						</ul>
						<!-- 로그인 하지 않았을 때 -->
						<%
							if(userID == null){
						%>		
						
						<!-- 헤더 우측 드랍다운 -->
						<ul class="nav navbar-nav navbar-right">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">접속하기<span class="caret"></span></a>
									<!-- 드랍다운 아이템 영역 -->
									<ul class="dropdown-menu">
										<li class="active"><a href="login.jsp">로그인</a></li>
										<li><a href="join.jsp">회원가입</a></li>
									</ul>
								</li>
						</ul>
							
							<!-- 로그인을 했을 때 -->
						<%	
							}else{
						%>
							<!-- 헤더 우측 드랍다운 -->
						<ul class="nav navbar-nav navbar-right">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">로그인중<span class="caret"></span></a>
									<!-- 드랍다운 아이템 영역 -->
									<ul class="dropdown-menu">
										<li><a href="logoutAction.jsp">로그아웃</a></li>
									</ul>
								</li>
						</ul>
						<% 
							}
						%>
				</div>
		</nav>
		
		<div class="board-container">
			<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="2"><%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%= board.getUserID() %></td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"><%= board.getBoardDate().substring(0 ,11) + board.getBoardDate().substring(11, 13) + "시" + board.getBoardDate().substring(14, 16) + "분" %></td>
							</tr>
							<tr>
								<td>내용</td>
								<!-- 특수문자 처리 -->
								<td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
									
							</tr>
						</tbody>
					</table>
					<a href="board.jsp" class="btn btn-primary">목록</a>  <!-- 목록으로 돌아가기 -->
					<%
						if(userID != null && userID.equals(board.getUserID())){  //작성자 본인이 쓴 글일때
					%>
							<a href="update.jsp?boardID=<%= boardID%>" class="btn btn-primary" >수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%= boardID%>" class="btn btn-primary" >삭제</a>
					<%	
						}
					%>
			</div>
		</div>
		<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>