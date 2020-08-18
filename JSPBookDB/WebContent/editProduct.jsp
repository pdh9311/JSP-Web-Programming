<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>상품 편집</title>
</head>
<body>
<%
	String edit = request.getParameter("edit");
%>

<%@ include file="menu.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			
				String sql = "SELECT * FROM product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
			%>
			<div class="col-md-4">
				<img src="/resources/image/<%=rs.getString("p_fileName") %>" style="width: 100%" />
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %>
				<p><%=rs.getDouble("p_unitPrice") %>원
				<p>
				<%
					if(edit.equals("update")) {
				%> 
					<a href="./updateProduct.jsp?id=<%= rs.getString("p_id") %>" class="btn btn-success" role="button">수정 &raquo;</a>
				<%
					} else if(edit.equals("delete")) {
				%>
					<a href="#" onClick="deleteConfirm('<%=rs.getString("p_id") %>')" class="btn btn-danger" role="button">삭제 &raquo;</a>
				<%
					}
				%>
			</div>
			<%	
				}
				
				if(rs != null) { rs.close(); }
				if(pstmt != null) { pstmt.close(); }
				if(conn != null) { conn.close(); }
			%>
		</div>
		<hr>
	</div>
<%@ include file="footer.jsp" %>
<script>
	function deleteConfirm(id) {
		if(confirm("해당 상품을 삭제합니다!") == true) {
			location.href = "./deleteProduct.jsp?id=" + id;
		} else {
			return;
		}
	}
</script>
</body>
</html>