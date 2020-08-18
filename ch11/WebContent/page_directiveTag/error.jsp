<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 오류가 발생하였습니다.
	
	<!-- page 디렉티브 태그의 isErrorPage 속성을 사용하면 exception 내장 객체를 사용할 수 있다. -->
	<p> 예외 유형 : <%= exception.toString() %>
	<p> 오류 메시지 : <%= exception.getMessage() %>
	<p> getClass().getName() : <%=exception.getClass().getName() %>
</body>
</html>