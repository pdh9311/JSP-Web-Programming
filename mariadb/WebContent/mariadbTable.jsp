<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table>
			<tr>
				<th>이름</th> <th>메모</th>
			</tr>
<%
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/test";
	String user = "root";
	String password = "123123";
	
	String sql = "SELECT * FROM test_table";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
%>
			<tr>
				<td><%= rs.getString("name") %></td>
				<td><%= rs.getString("memo") %></td>
			</tr>
<%			
		}
	} catch(Exception e) {
		System.out.println("에러 : " + e.getMessage());
	} finally {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			throw new RuntimeException();
		}
	}
%>
		</table>
</body>
</html>