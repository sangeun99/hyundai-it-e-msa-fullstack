<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="color: white;">top</h1>
<%
	// request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
	out.println(msg);
%>
</body>
</html>