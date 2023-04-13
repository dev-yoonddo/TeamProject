<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentVO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<style>
.inquiry{
	height: auto;
}
.cmt-view{
	padding-top: 100px;
}
#cmt-btn{
	width: 80px;
	
}
.cmt-write{
	padding-top: 30px;
}
</style>
<body>
<%
//userID 가져오기
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
int cmtID = 0;
if(request.getParameter("cmtID")!=null)
	cmtID = Integer.parseInt(request.getParameter("cmtID"));
//boardID 가져오기
int boardID = 0;
if(request.getParameter("boardID") != null){
	boardID = Integer.parseInt(request.getParameter("boardID"));
}

//글이 유효하다면 1이상의 숫자가 반환되기 때문에 boardID == 0일때  글이 유효하지 않다는 알림창 띄우기
if(boardID == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글입니다.')");
	script.println("location.href = 'customerPage.jsp'");
	script.println("</script>");
}

BoardVO board = new BoardDAO().getBoardVO(boardID);
CommentVO comment = new CommentDAO().getCommentVO(cmtID);
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
		<!-- 비로그인 -->
		<%
			if(userID == null){
		%>	
		<ul class="login">
			<li class="btn1" onclick="location.href='loginPage.jsp'">로그인&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<li class="btn1" onclick="location.href='joinPage.jsp'">회원가입<li>
		</ul>
		
		<!-- 로그인 -->
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
		<!-- 비로그인 -->
		<%
			if(userID == null){
		%>	
		<li class="btn2" onclick="location.href='mainPage.jsp'">메인</li>
		<li class="btn2" onclick="loginOK()">주문하기</li>
		<li class="btn2" onclick="location.href='mainPage.jsp'">매장찾기</li>
		<li class="btn2" onclick="location.href='customerPage.jsp'">고객센터</li>
		
		<!-- 로그인 -->
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
<!-- header -->

<!-- section -->
<section>
	<div class="board-container">
		<div class="inquiry">
			<div class="row"><br>
				<h4 style="font-weight: bold; color: #646464;">문의 글</h4><br><br>
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
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
				if(userID != null){
					if(userID.equals("admin")){
			%>
			
						<button type="button" class="btn-black" id="cmt-write-btn" onclick="cmtAction()"><span>답변쓰기</span></button>
					
			<%
					}else if(userID.equals(board.getUserID())){
			%>
						<button type="button" class="btn-black" onclick="location.href='update.jsp?boardID=<%= boardID%>'"><span>수정</span></button>
						<button type="button" class="btn-black" id="btn-del" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='deleteAction.jsp?boardID=<%= boardID%>'}"><span>삭제</span></button>
						<button type="button" class="btn-black" id="cmt-write-btn" onclick="cmtAction()"><span>답변쓰기</span></button>
			<% 
					}
				}
			%>
			</div>
			<div class="cmt-view">
	         	<div class="row">
	         		<h5 style="font-size: 15pt; color: #646464; float: left;">답변<br></h5><hr style="width: 1000px;">
	                <%
	                   CommentDAO cmtDAO = new CommentDAO();
	                   ArrayList<CommentVO> list = cmtDAO.getList(boardID);
	                   for(int i=0; i<list.size(); i++){
	                %>
	               	<table class="table table-striped" style="table-layout: fixed;">
	               		<tr style="">
	               			<td align="left"><%= list.get(i).getUserID() %></td>
	               			<td align="right"><%= list.get(i).getCmtDate().substring(0,11)+list.get(i).getCmtDate().substring(11,13)+"시"+list.get(i).getCmtDate().substring(14,16)+"분" %></td>
	               		</tr>
	               	</table>
	               	<table style="margin-bottom: 20px;">
	               		<tr>
	               			<td><%= list.get(i).getCmtContent() %></td>
	               		</tr>
		           	</table>
            			<%
            				if(userID != null && userID.equals(list.get(i).getUserID())){
            			%>
         				<div style="float: right;">
            			<button type="button" class="btn-black" id="cmt-btn" onclick="if(confirm('답글을 삭제하시겠습니까?')){location.href='commentDeleteAction.jsp?boardID=<%= boardID%>&cmtID=<%=list.get(i).getCmtID() %>'}"><span>삭제</span></button>
            			</div>
            			<%
            				}
            			%>
	                  <%
	                     }
	                  %>
	         	</div>  
	      	</div>
			<!-- 답변쓰기 버튼을 눌렀을 때만 답변쓰기 섹션이 나타나도록 설정 -->
			<div id="cmt-write" style="display: none;">
		      <div class="row">
		          <form method="post" action="commentAction.jsp?boardID=<%= boardID %>">
			          <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
			             <tbody>
			                <tr>
			                   <td align="left"><%=userID %></td>
			                </tr>
			                <tr>
			                   <td><input type="text" class="form-control" placeholder="답변 쓰기" name="cmtContent" maxlength="300"></td>
			                </tr>
			             </tbody>
			          </table>
			      <button type="submit" class="btn-black" id="cmt-btn"><span>완료</span></button>
			      </form>
		      </div>
		   </div>
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
<!-- footer -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	
</body>
</html>