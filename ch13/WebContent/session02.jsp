<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 기본 속성이 session="true" 이다. --%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession httpSession = request.getSession();	// 세션 생성
		httpSession.setAttribute("id","admin");
		String session_id = (String)httpSession.getAttribute("id");
		out.print(session_id + "<br>");
	%>
</body>
</html>
