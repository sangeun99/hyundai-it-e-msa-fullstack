<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 선언문</title>
<style type="text/css">
body {
	margin: 0;
}

table {
	width: 1180px;
}

#top {
   height:150px; 
   background-color:yellow;
}

#menu {
   width:250px; 
   background-color:red; 
   height:450px
}

#content {
   background-color:green;
}
</style>
</head>
<body>
<%
   String msg = "안녕하세요~";
%>
<table>
<tr>
   <td colspan="2" id="top"><%@include file="top.jsp" %></td>
</tr>
<tr>
   <td id="menu"><%@include file="menu.jsp" %></td>
   <td id="content"><%@include file="content.jsp" %></td>
</tr>
</table>
</body>
</html>