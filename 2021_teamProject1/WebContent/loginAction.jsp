<%@page import="java.io.PrintWriter"%>
<%@page import="com.koreait.Service.RegisterDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.koreait.Service.RegisterVO" scope="page"/>
<jsp:setProperty name="vo" property="userID" />
<jsp:setProperty name="vo" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userid");
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'mainPage.jsp'");
			script.println("</script>");
		}
		RegisterDAO dao = new RegisterDAO();
		int result = dao.login(vo.getUserID(), vo.getUserPassword());
		if(result == 1){
			session.setAttribute("userID", vo.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('" + vo.getUserName() + "님 안녕하세요')");
			script.println("location.href = 'mainPage.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>