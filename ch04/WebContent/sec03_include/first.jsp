<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag include</title>
</head>
<body>
	<h2>First Page</h2>
	<jsp:include page="second.jsp" />
</body>
</html>
<%-- include 디렉티브 태그와 include 액션 태그의 차이점
	include 디렉티브 태그는 JSP 컨테이너에 의해 하나의 *_jsp.java 파일로 만들어 지지만 
	inlcude 액션 태그는 first_jsp.java, second_jsp.java 각각의 파일로 만들어 진다. --%>