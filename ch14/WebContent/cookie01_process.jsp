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
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("pw");
		
		if(user_id.equals("admin") && user_pw.equals("1234")){
			Cookie cookie_id = new Cookie("userID",user_id);
			Cookie cookie_pw = new Cookie("userPW",user_pw);
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			out.print("쿠키 생성이 성공했습니다.<br>");
			out.print(user_id+"님 환영합니다.");
		} else {
			out.print("쿠키 생성이 실패했습니다.");
		}
	%>
	<hr>
	<a href="getCookie.jsp">쿠키정보 가져오기</a>
</body>
</html>