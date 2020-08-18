<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
	
		Connection conn = null;
		Statement stmt = null;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root&password=1234&useSSL=false");
			stmt = conn.createStatement();
			String sql = "INSERT INTO member VALUES('"+id+"','"+pw+"','"+name+"')";
			stmt.executeUpdate(sql);
			out.print("member 테이블에 데이터 삽입을 성공했습니다.<br>");
		} catch(SQLException e) {
			out.print("member 테이블에 데이터 삽입을 실패했습니다.<br>");
			out.print("SQLException : " + e.getMessage());
		} finally {
			if(stmt != null) { stmt.close(); }
			if(conn != null) { conn.close(); }
		}
	%>
	<a href="insertData.jsp">정보 입력하러 가기</a>
</body>
</html>