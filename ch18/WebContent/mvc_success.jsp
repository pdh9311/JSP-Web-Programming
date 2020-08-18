<%@page import="model.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<p> 로그인 성공했습니다.
	<%
		LoginBean bean = (LoginBean) request.getAttribute("bean");
		out.print(bean.getId() + "님 환영합니다.");
	%>
</body>
</html>