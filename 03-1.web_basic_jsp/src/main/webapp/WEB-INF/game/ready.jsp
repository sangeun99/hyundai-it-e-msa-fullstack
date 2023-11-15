<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 페이지</title>
</head>
<body>
<form action="result" method="post">
	<h1>가위, 바위, 보</h1>
	<select name="you">
		<option value="1">가위</option>
		<option value="2">바위</option>
		<option value="3">보</option>
	</select>
	<button type="submit">확인</button>
</form>
</body>
</html>