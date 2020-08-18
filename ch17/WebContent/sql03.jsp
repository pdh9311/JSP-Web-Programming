<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<form action="sql03_process.jsp" method="post">
		<p> 아이디 : <input type="text" name="id"	/>
		<p> 비밀번호 : <input type="password" name="pw" />
		<p> 수정할 이름 : <input type="text" name="name" />
		<p> <input type="submit" value="전송" />
	</form>
</body>
</html>