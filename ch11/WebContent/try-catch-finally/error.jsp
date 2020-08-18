<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 잘못된 데이터가 입력되었습니다.
	<p> num1 : <%= request.getParameter("num1") %>
	<p> num2 : <%= request.getParameter("num2") %>
</body>
</html>