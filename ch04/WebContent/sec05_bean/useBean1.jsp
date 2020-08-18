<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>useBean1 Page</h3>
	
	<%-- form의 요청 파라미터 name값과 자바빈즈의 property이름이 모두 일치할 경우  property="*"로 사용할 수 있다. --%>
	<jsp:useBean id="member" class="ch04.Member" scope="request" />
	<jsp:setProperty property="*" name="member" />		
	<%
		out.print("아이디: " + member.getId() + "<br/>");
		out.print("비밀번호: " + member.getPw() + "<br/>");
		out.print("나이: " + member.getAge() + "<br/>");
	%>
	<jsp:getProperty property="id" name="member"/> <br/>
	<jsp:getProperty property="pw" name="member"/> <br/>
	<jsp:getProperty property="age" name="member"/> <br/>
	<jsp:include page="form2.jsp" />
</body>
</html>