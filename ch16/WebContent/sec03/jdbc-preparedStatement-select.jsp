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
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root&password=1234&useSSL=false");
			String sql = "SELECT * FROM member WHERE name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"홍길동");
			rs = pstmt.executeQuery();
			out.print("<table border='1'>");
			out.print("<tr>");
			out.print("<td>아이디</td>");
			out.print("<td>비밀번호</td>");
			out.print("<td>이름</td>");
			out.print("</tr>");
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>" + rs.getString("id") + "</td>");
				out.print("<td>" + rs.getString("pw") + "</td>");
				out.print("<td>" + rs.getString("name") + "</td>");
				out.print("</tr>");
			}
			out.print("</table>");
			out.print("member 테이블에 데이터 검색을 성공했습니다.<br>");
		} catch(SQLException e) {
			out.print("member 테이블에 데이터 검색을 실패했습니다.<br>");
			out.print("SQLException : " + e.getMessage());
		} finally {
			if(rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(conn != null) { conn.close(); }
		}
	%>
	<a href="form-preparedStatement-insertData.jsp">정보 입력하러 가기</a>
</body>
</html>