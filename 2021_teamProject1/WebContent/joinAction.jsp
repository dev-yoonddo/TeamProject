<%@page import="java.io.PrintWriter"%>
<%@page import="com.koreait.Service.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.koreait.Service.RegisterVO" scope="page" />
<jsp:setProperty name="vo" property="userID" />
<jsp:setProperty name="vo" property="userPassword" />
<jsp:setProperty name="vo" property="userName" />
<jsp:setProperty name="vo" property="userBirth" />
<jsp:setProperty name="vo" property="userPhone" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userId");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'mainPage.jsp'");
		script.println("</script>");
	}
			if(vo.getUserID() == null || vo.getUserPassword() == null || vo.getUserName() == null ||
			vo.getUserBirth() == null || vo.getUserPhone() == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>"); 
		}else {
			RegisterDAO registerDAO = new RegisterDAO();
			int result = registerDAO.join(vo);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='mainPage.jsp'");
				script.println("</script>");
			}
		}

	%>
</body>
</html>