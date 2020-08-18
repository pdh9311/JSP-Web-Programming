<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jsp"
	driver="com.mysql.jdbc.Driver"
	user="root"
	password="1234"/>

<sql:query var="resultSet" dataSource="${dataSource}">
	SELECT * FROM jspbook_member WHERE id = ? and pw = ?
	<sql:param value="<%=id %>" />
	<sql:param value="<%=pw %>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="resultMember.jsp?msg=2" />
</c:forEach>

<c:redirect url="loginMember.jsp?error=1" />
</body>
</html>