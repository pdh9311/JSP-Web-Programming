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
		String id ;
		String pw ;
		out.print("-------------id 세션 삭제전-------------<br>");
		id = (String) session.getAttribute("id");
		pw = (String) session.getAttribute("pw");
		out.print("id : " + id + "<br>");
		out.print("pw : " + pw + "<hr>");
		
		session.removeAttribute("id");
		
		out.print("-------------id 세션 삭제후-------------<br>");
		id = (String) session.getAttribute("id");
		pw = (String) session.getAttribute("pw");
		out.print("id : " + id + "<br>");
		out.print("pw : " + pw + "<br>");
	%>
</body>
</html>