<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="cookie01_process.jsp" method="post">
		<p> 아이디 : <input type="text" name="id" />
		<p> 비밀번호 : <input type="password" name="pw" />
		<p> <input type="submit" value="전송" />
	</form>
	<hr>
	<a href="getCookie.jsp">쿠키정보 가져오기</a>
	<br>
	<a href="removeCookie.jsp">쿠키 제거</a>
</body>
</html>