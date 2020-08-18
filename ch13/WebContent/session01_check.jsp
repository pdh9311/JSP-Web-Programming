<%@page import="java.util.Enumeration"%>
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
		String id = (String) session.getAttribute("id");
		String pw = (String) session.getAttribute("pw");
		out.print("id : " + id + "<br>");
		out.print("pw : " + pw);
		
		out.print("<hr>");
		
		Enumeration<String> sessionInfo = session.getAttributeNames();
		while(sessionInfo.hasMoreElements()){
			String sessionName = sessionInfo.nextElement();
			String sessionValue = (String) session.getAttribute(sessionName);
			out.print(sessionName + ": " + sessionValue +"<br>");
		}
		
		out.print("<hr>");
		
	%>
	<p> <a href="session01_delete.jsp">아이디 세션 삭제</a>
	| <a href="session01_allDelete.jsp">모든 세션 삭제</a>
	| <a href="session01_time.jsp">세션 유효 시간 설정</a>
</body>
</html>
