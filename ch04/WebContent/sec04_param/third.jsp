<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Third Page</title>
</head>
<body>
	<h3>Third Page</h3>
	<%
		String encodeVal = request.getParameter("nextPage");
		String decodeVal = URLDecoder.decode(encodeVal,"UTF-8");
		out.print(decodeVal);
	%> <br/>
	- <%= request.getParameter("pageNum") %> - 
</body>
</html>