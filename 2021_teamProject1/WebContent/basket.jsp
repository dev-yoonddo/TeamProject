<%@page import="javax.websocket.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Insert title here</title>
</head>
<body>
<form>
    <% 
    String productname = request.getParameter("product");
    //productname 에 product의 값을 넣어줌
    ArrayList<String> productlist = (ArrayList<String>)session.getAttribute("ArrayList");
    //ArrayList타입 참조변수에 productlist를 넣어줌
    if(productlist==null){ //만약 productlist가 널값이면
       productlist = new ArrayList<String>(); //ArrayList를 만들어줌
    }
       productlist.add(productname); //productlist에 값을 넣어준다.
    session.setAttribute("ArrayList", productlist); //ArrayList 세션에 productlist를 넣어줌 
   
    
  
    out.println("<script>history.back();</script>");%> <!--이전화면으로 돌아감-->
    </form>
</body>
</html>





