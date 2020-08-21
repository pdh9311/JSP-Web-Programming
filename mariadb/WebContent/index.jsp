<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>환영합니다.</h1>
	<form action="mariadb.jsp" method="post">
		<p> 이름 : <input type="text" name="name" />
		<p> 메모 : <textarea name="memo" cols="50"></textarea>
		<p> <input type="submit" value="저장" />
	</form>
	<p> <a href="/mariadb.jsp">마리아 디비</a>
</body>
</html>