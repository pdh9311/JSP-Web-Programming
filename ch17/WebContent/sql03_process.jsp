<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
%>

	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/jsp"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="1234"/>
	
	<sql:update dataSource="${dataSource}" var="resultSet">
		update member set name = ? where id = ? and pw = ?
		<sql:param value="<%=name %>" />
		<sql:param value="<%=id %>" />
		<sql:param value="<%=pw %>" />
	</sql:update>
	
	<c:import var="url" url="sql01.jsp" />
	${url}	
</body>
</html>