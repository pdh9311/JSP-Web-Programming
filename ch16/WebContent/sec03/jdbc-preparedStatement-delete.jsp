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
	
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root&password=1234&useSSL=false");
			String sql = "DELETE FROM member WHERE name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"홍길동");
			pstmt.executeUpdate();
			out.print("member 테이블에 데이터 삭제를 성공했습니다.<br>");
		} catch(SQLException e) {
			out.print("member 테이블에 데이터 삭제을 실패했습니다.<br>");
			out.print("SQLException : " + e.getMessage());
		} finally {
			if(pstmt != null) { pstmt.close(); }
			if(conn != null) { conn.close(); }
		}
	%>
	<a href="form-preparedStatement-insertData.jsp">정보 입력하러 가기</a>
</body>
</html>