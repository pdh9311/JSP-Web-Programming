<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag bean</title>
</head>
<body>
	<h3>useBean Page</h3>
	
	<jsp:useBean id="m" class="ch04.Member" scope="request" />
	<jsp:setProperty name="m" property="id" value="padohy" />
	<jsp:setProperty name="m" property="pw" value="1234" />
	<jsp:setProperty name="m" property="age" value="28" />
	<% 
		out.print("아이디: " + m.getId() + "<br/>");
		out.print("비밀번호: " + m.getPw() + "<br/>");
		out.print("나이: " + m.getAge() + "<br/>");
	%>
	
	<jsp:getProperty property="id" name="m"/> <br/>
	<jsp:getProperty property="pw" name="m"/> <br/>
	<jsp:getProperty property="age" name="m"/> <br/>
	
	<jsp:include page="form1.jsp" />
</body>
</html>