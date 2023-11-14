<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%--  page directive --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
</head>
<body>
<%
Calendar c = Calendar.getInstance();	

int year = c.get(Calendar.YEAR);
int month = c.get(Calendar.MONTH) + 1;
c.set(year, month-1, 1);
int week = c.get(Calendar.DAY_OF_WEEK);
System.out.println(week);

int endday = c.getActualMaximum(Calendar.DAY_OF_MONTH);
System.out.println(endday);

// 이전 달 구하기
int last_month = month - 1;
int last_month_year = year;
if (last_month < 0) {
	last_month = 12;
	last_month_year--;
}
c.set(last_month_year, last_month-1, 1);
int last_endday = c.getActualMaximum(Calendar.DAY_OF_MONTH);


// 다음 달 구하기
if (month < 12) {
	int next_month = month + 1;
}
else {
	int next_year = year + 1;
	int next_month = 1;
}
%>

<table>
	<caption><%= year%>, <%= month%></caption>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
<%
for (int w=1; w<week; w++) {
	out.print("<td></td>");
}
for (int d=1, w=week; d<=endday; d++, w++) {
	out.print("<td>" + d + "</td>");
	if (w % 7 == 0) {
		out.print("</tr>");
	}
}
%>
</table>
</body>
</html>