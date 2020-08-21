<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MariaDB Connection</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/test";
	String user = "root";
	String password = "123123";
	
	String sql = "INSERT INTO test_table VALUES(?,?)";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, memo);
		int result = pstmt.executeUpdate();
		if(result >= 1) {
			out.print("<h1>마리아 디비 성공!</h1>");
		} 
	} catch(Exception e) {
		out.print("<h1>마리아 디비 실패!</h1>");
		System.out.println("에러 : " + e.getMessage());
	} finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			throw new RuntimeException();
		}
	}
%>
<a href="mariadbTable.jsp">MariaDB(test_table) 목록</a>
</body>
</html>