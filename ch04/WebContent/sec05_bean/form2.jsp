<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>form2 Page</h3>
	
	<form action="useBean2.jsp" method="post">
		<%-- form의 요청 파라미터 name값과 자바빈즈의 property이름이 같으면 전달된다. --%>
		<p> 아이디 : <input name="id" value="pdh9311"/>
		
		<%-- form의 요청 파라미터 name값과 자바빈즈의 property이름이 다를 경우 동일한 param속성값에 전달된다. --%>
		<p> 비밀번호 : <input name="userPw" value="7894564" />
		<p> 나이: <input name="userAge" value="29" />
		
		<p> <input type="submit" value="전송" />
	</form>
</body>
</html>