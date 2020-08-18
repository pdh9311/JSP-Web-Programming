<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>form1 Page</h3>
	
	<%-- form의 요청 파라미터 name값과 자바빈즈의 property이름이 모두 일치할 경우  property="*"로 대체할 수 있다. --%>
	<form action="useBean1.jsp" method="post">
		<p> 아이디 : <input name="id" value="pdh6381"/>
		<p> 비밀번호 : <input name="pw" value="456789" />
		<p> 나이: <input name="age" value="22" />
		<p> <input type="submit" value="전송" />
	</form>
</body>
</html>