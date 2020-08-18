<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();	// 로그인 인증을 할 때 웹 브라우저에 저장된 모든 사용자를 삭제
		response.sendRedirect("../addProduct.jsp");
	%>
</body>
</html>