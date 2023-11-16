<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="/webdev/kitty.png">
<title>게시물 글쓰기</title>
</head>
<body>
<form name="myform" method="post" action="insertAction">
<table>
   <caption>게시물 글쓰기</caption>
<tr>
   <th>제목</th>
   <td><input type="text" name="title" autofocus required /></td>
</tr>
<tr>
   <th>이름</th>
   <td><input type="text" name="name" required /></td>
</tr>
<tr>
   <th>비밀번호</th>
   <td><input type="password" name="password" required /></td>
</tr>
<tr>
   <th>내용</th>
   <td><textarea name="content" rows="5" cols="40"></textarea></td>
</tr>
<tr>
   <td colspan="2" align="center">
      <input type="submit" value="완료" />
   </td>
</tr>
</table>
</form>
</body>
</html>