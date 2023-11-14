<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>예약 접수</title>
	<style>
		ul {
			list-style: none;
		}

		li {
			line-height: 50px;
		}

		label {
			width: 60px;
			float: left;
		}
	</style>
</head>
<body>
	<h1>예약 정보</h1>
	<form action="process-1.jsp" method="get">
		<ul>
			<li>
				<label for="r-name">이 름</label>
				<input type="text" id="r-name" name="name" autofocus required>
			</li>
			<li>
				<label for="r-phone">휴대폰</label>
				<input type="tel" id="r-phone" name="phone" required>
			</li>
			<li>
				<label for="r-email">이메일</label>
				<input type="email" id="r-email" name="email" required>
			</li>
			<li>
				<input type="submit" value="예약하기">
			</li>
		</ul>
	</form>
</body>
</html>