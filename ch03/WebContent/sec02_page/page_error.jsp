<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 현재 JSP페이지가 실행되는 동안 오류가 발생하면 특정 오류 페이지로 이동하는데 사용 --%>
<%@ page errorPage="errorPage.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page04</title>
</head>
<body>
	<%
		String str = null;
		out.println(str.toString());
	%>
</body>
</html>