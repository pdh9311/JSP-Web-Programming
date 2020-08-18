<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response process</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("padohy") && pw.equals("1234")) {
			response.sendRedirect("login_success.jsp");
		}else {
			response.sendRedirect("login_false.jsp");
		}
	%>
</body>
</html>