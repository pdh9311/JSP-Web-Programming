<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 인증 성공 O
	<hr>
	<p> 사용자명 : <%= request.getRemoteUser() %>
	<p> 인증방법 : <%= request.getAuthType() %>
	<p> 인증한 사용자명이 "tomcat"에 속하는 사용자 인가요? 
		<%= request.isUserInRole("tomcat") %>
	<p> 인증한 사용자명이 "manager"에 속하는 사용자 인가요?
		<%= request.isUserInRole("manager") %>
	<p> 웹 브라우저의 요청 프로토콜? <%=request.getProtocol() %>
	<p> 웹 브라우저에서 https요청으로 request가 들어왔는가? <%=request.isSecure() %>
</body>
</html>