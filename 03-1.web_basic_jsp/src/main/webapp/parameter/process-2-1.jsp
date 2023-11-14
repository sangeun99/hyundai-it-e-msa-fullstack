<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String[]> paramMap = request.getParameterMap();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사 지원 정보 - parameterMap 이용</title>
</head>
<body>
<table>
<%
	for (String key: paramMap.keySet()) {
		String[] values = paramMap.get(key);
		for (String v: values) {
			out.println("<tr>");
			out.println("<td>" + key + "</td>");
			out.println("<td>" + v + "</td>");
			out.println("</tr>");
		}
	}
%>
</table>
</body>
</html>