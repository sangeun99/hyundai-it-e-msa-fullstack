<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String field = request.getParameter("field");
	String[] hobbies = request.getParameterValues("hobby");
	String gendertype = request.getParameter("gender");
	String gender = "";
	if (gendertype == "1") {		
		gender = "남성";
	}
	else {
		gender = "여성";
	}
	String motive = request.getParameter("motive");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사 지원 정보</title>
</head>
<body>
<h4>이름</h4>
<%= name %>
<h4>전화번호</h4>
<%= phone %>
<h4>분야</h4>
<%= field %>
<h4>취미</h4>
<%
	for (int x = 0; x < hobbies.length; x++) {
		out.println(hobbies[x]);
	}
%>
<h4>성별</h4>
<%= gender %>
<h4>지원동기</h4>
<%= motive %>
</body>
</html>