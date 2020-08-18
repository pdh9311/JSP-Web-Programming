<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag param</title>
</head>
<body>
	<h3>Second Page</h3>
	<%= request.getParameter("date") %> <br/>
	<jsp:include page="third.jsp">
		<jsp:param value='<%=URLEncoder.encode("세번째 페이지","UTF-8") %>' name="nextPage"/>
		<jsp:param value="3" name="pageNum"/>
	</jsp:include>
</body>
</html>