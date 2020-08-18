<%@page import="jspbook.ProductRepository"%>
<%@page import="jspbook.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<div class ="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>	
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-4">
				<img src="/resources/image/<%=rs.getString("p_fileName") %>" style="width: 100%" />
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %>
				<p><%=rs.getDouble("p_unitPrice") %>원
				<p> <a href="./product.jsp?id=<%=rs.getString("p_id") %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
			<%
				}
				if(rs != null) { rs.close(); } 
				if(pstmt != null) { pstmt.close(); }
				if(conn != null) { conn.close(); }
			%>
		</div>
		<hr/>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>