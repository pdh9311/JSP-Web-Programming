<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 307 에러
	<p> 5초 후 임시로 페이지가 리다이렉트 됩니다.
	<%
		Thread.sleep(5000);
		response.sendRedirect("page.jsp");
	%>
</body>
</html>