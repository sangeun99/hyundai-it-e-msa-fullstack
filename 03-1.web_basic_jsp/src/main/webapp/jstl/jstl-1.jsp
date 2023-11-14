<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 실습</title>
</head>
<body>
<c:set var="i" value="10" />
<c:out value="${ i }"/>
${ 10 + 5 } <br/>
<hr />
\${ 10 + 5 } = ${ 10 + 5 }<br/>
\${ 10 - 5 } = ${ 10 - 5 }<br/>
\${ 10 * 5 } = ${ 10 * 5 }<br/>
\${ 10 / 5 } = ${ 10 / 5 }<br/>
\${ 10 % 5 } = ${ 10 % 5 }<br/>
\${ 10 mod 5 } = ${ 10 mod 5 }<br/>
<hr />
\${ 10 > 5 } = ${ 10 > 5 }<br/>
\${ 10 < 5 } = ${ 10 < 5 }<br/>
\${ 10 >= 5 } = ${ 10 >= 5 }<br/>
\${ 10 <= 5 } = ${ 10 <= 5 }<br/>
\${ 10 == 5 } = ${ 10 == 5 }<br/>
\${ 10 != 5 } = ${ 10 != 5 }<br/>
</body>
</html>