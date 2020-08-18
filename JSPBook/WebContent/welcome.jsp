<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	<%! String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to Web Market!"; %>
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>
	<div class ="container">
		<div class="text-center">
			<h3>
				<%= tagline %>
			</h3>
			<%
				Date now = new Date();
				SimpleDateFormat format1 = new SimpleDateFormat("h:m:s a", new Locale("en","US"));
				out.print("현재 접속 시각: " + format1.format(now));
			%>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>