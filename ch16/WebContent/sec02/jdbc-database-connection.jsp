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
		/* 	JDBC 드라이버가 로딩되면 자동으로 객체가 생성된고 DriverManager클래스에 등록된다.
			DriverManager클래스로 Connection 객체를 생성할 때 JDBC를 검색하고, 검색된 드라이버를 이용하여 Connection객체를 생성한다. 
			Connection객체를 생성하는 getConnetion()메소드의 매개 타입은 3가지가 있다. */
		Connection conn = null;
	
			
		try {
			Class.forName("com.mysql.jdbc.Driver");
			/* [방법1] */
			String url = "jdbc:mysql://localhost:3306/jsp?user=root&password=1234";
			conn = DriverManager.getConnection(url);
			
			
			/* [방법2]
			String url = "jdbc:mysql://localhost:3306/jsp";
			String user = "root";
			String password = "1234";
			conn = DriverManager.getConnection(url,user,password);
			*/
			
			/* [방법3]
			String url = "jdbc:mysql://localhost:3306/jsp";
			Properties props = new Properties();
			props.put("user","root");
			props.put("password","1234");
			conn = getConnection(url,props);
			*/
			out.print("데이터 베이스 연결을 성공하였습니다.");
		} catch(SQLException e) {
			out.print("데이터 베이스 연결을 실패하였습니다.<br>");
			out.print("SQLException : " + e.getMessage());
		} finally {
			if(conn != null) {
				conn.close();
			}
		}
	%>
</body>
</html>