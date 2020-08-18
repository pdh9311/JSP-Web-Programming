<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag param</title>
</head>
<body>
	<h3>First Page</h3>
	<jsp:forward page="second.jsp">
		<jsp:param value="<%=new Date() %>" name="date"/>
	</jsp:forward>
</body>
</html>