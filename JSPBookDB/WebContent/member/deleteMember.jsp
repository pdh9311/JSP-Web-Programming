<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jsp"
	driver="com.mysql.jdbc.Driver"
	user="root"
	password="1234"/>

<sql:update dataSource="${dataSource}" var="result">
	DELETE FROM jspbook_member WHERE id=?
	<sql:param value="<%=sessionId %>" />
</sql:update>

<c:if test="${result >= 1}">
	<c:import url="logoutMember.jsp" />
	<c:redirect url="resultMember.jsp" />
</c:if>

</body>
</html>