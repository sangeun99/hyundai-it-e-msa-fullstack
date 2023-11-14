<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("r-name");
	String phone = request.getParameter("r-phone");
	String email = request.getParameter("r-email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
</head>
<body>
name : <%= name %> <br/>
phone : <%= phone %> <br/>
email : <%= email %> <br/>
</body>
</html>