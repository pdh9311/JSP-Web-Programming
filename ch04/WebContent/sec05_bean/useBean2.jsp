<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>useBean2 Page</h3>
		
	<jsp:useBean id="member" class="ch04.Member" scope="request" />

	<%-- form의 요청 파라미터 name값과 자바빈즈의 property이름이 같으면 전달된다. --%>
	<jsp:setProperty property="id" name="member"/>
	
	<%-- form의 요청 파라미터 name값과 자바빈즈의 property이름이 다를 경우 동일한 param속성값에 전달된다. --%>
	<jsp:setProperty property="pw" name="member" param="userPw"/>
	<jsp:setProperty property="age" name="member" param="userAge"/>
	<%
		out.print("아이디: " + member.getId() + "<br/>");
		out.print("비밀번호: " + member.getPw() + "<br/>");
		out.print("나이: " + member.getAge() + "<br/>");
	%>
	<jsp:getProperty property="id" name="member"/> <br/>
	<jsp:getProperty property="pw" name="member"/> <br/>
	<jsp:getProperty property="age" name="member"/> <br/>
</body>
</html>