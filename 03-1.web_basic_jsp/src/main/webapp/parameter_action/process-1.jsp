<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reserv" class="beans.Reservation" scope="page" />
<jsp:setProperty property="*" name="reserv" />
<%--
	beans.Reservation reserv = new beans.Reservation();
	reserv.setName(request.getParameter("name"));
	reserv.setPhone(request.getParameter("phone"));
	reserv.setEmail(request.getParameter("email"));
 --%>
<%--
	String name = request.getParameter("r-name");
	String phone = request.getParameter("r-phone");
	String email = request.getParameter("r-email");
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
</head>
<body>
name : <%= reserv.getName() %> <br/>
phone : <%= reserv.getPhone() %> <br/>
email : <%= reserv.getEmail() %> <br/>
</body>
</html>