<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		if(cookies != null && cookies.length != 0) {
			for(int i=0;i<cookies.length;i++){
				out.print(cookies[i].getName()+" : " + cookies[i].getValue() +"<br>");
				out.print("<hr>");
			}
		} else {
			out.print("쿠키 정보가 없습니다.<hr>");
		}
	%>
	
	<a href="removeCookie.jsp">쿠키 제거</a>
</body>
</html>