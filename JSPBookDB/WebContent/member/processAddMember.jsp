<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birthyy = request.getParameter("bithyy");
	String birthmm = request.getParameter("bithmm");
	String birthdd = request.getParameter("bithdd");
	String birth = birthyy + "/" + birthmm + "/" + birthdd; 
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
	String currentDate = sdf.format(new Date());
	System.out.println("오늘 날짜 : " + currentDate);
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jsp"
	driver="com.mysql.jdbc.Driver"
	user="root"
	password="1234"/>
	
<sql:update dataSource="${dataSource}" var="result">
	INSERT INTO jspbook_member VALUES(?,?,?,?,?,?,?,?,?);
	<sql:param value="<%=id %>"/>
	<sql:param value="<%=pw %>"/>
	<sql:param value="<%=name %>"/>
	<sql:param value="<%=gender %>"/>
	<sql:param value="<%=birth %>"/>
	<sql:param value="<%=mail %>"/>
	<sql:param value="<%=phone %>"/>
	<sql:param value="<%=address %>"/>
	<sql:param value="<%=currentDate %>"/>
</sql:update>

<c:if test="${result >= 1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>


</body>
</html>