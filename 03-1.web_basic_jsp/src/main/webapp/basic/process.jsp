<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Process</title>
</head>
<body>
<% // scriptlet
	String name = request.getParameter("name");
	out.println("<h1>그래, 난 " + name +". 포기를 모르는 남자지</h1>");
%>
<h1></h1>
</body>
</html>