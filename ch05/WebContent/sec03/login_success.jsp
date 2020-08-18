<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response sendRedirect</title>
</head>
<body>
	로그인 성공하였습니다.<br>
	<a href="response.jsp">로그아웃</a>
	<hr>
	<%
		response.setHeader("Cache-control","use_cache");	// 헤더에 첫번째 매개값의 이름으로 두번째 매개값의 정보를 추가
		response.addHeader("contentType","text/html; charset=utf-8");	// 헤더에 첫번째 매개값의 이름으로 두번째 매개값의 정보를 추가
		response.setDateHeader("date", 1L);		// 헤더에 첫번째 매개값의 이름에 두번째 매개값으로 날짜와 시간정보를 추가
		response.setIntHeader("Refresh", 60);	// 60초 마다 새로고침
		
		response.setCharacterEncoding("utf-8");		// 웹 브라우저에 응답할 문자 인코딩을 설정
		response.setContentType("text/html; charset=utf-8");	// 웹 브라우저에 응답할 MIME유형을 설정
	%>
	
	Cache-control : <%= response.getHeader("Cache-control") %> <br>
	contentType : <%= response.getHeader("contentType") %><br>
	date : <%= response.getHeader("date") %> <br>
	<%= new Date() %><br>
	
	문자 인코딩 : <%= response.getCharacterEncoding() %><br>
	콘텐츠 유형 : <%= response.getContentType() %>
	<hr>
	<a href="error404.jsp">찾을 수 없는 페이지</a>
	
	
</body>
</html>