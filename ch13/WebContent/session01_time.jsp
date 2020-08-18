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
		out.print("---------- 세션 유효 시간 변경 전 ----------<br>");
		int time = session.getMaxInactiveInterval()/60;
		out.print("세션 유효 시간 : " + time + "분");		// 세션 유효시간 기본값이 1800초(30분)이다.
		
		out.print("<hr>");
		
		out.print("---------- 세션 유효 시간 변경 후 ----------<br>");
		session.setMaxInactiveInterval(60*60);
		time = session.getMaxInactiveInterval()/60;
		out.print("세션 유효 시간 : " + time + "분");
		
		
		
	%>
</body>
</html>