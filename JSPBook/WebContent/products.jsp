<%@page import="jspbook.ProductRepository"%>
<%@page import="jspbook.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
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
	
	<% 
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> pList = dao.getpList(); 
	%>
	
	<div class ="container">
		<div class="row" align="center">
			<%
				for(int i=0; i<pList.size(); i++) {
					Product product = pList.get(i);
			%>
			<div class="col-md-4">
				<img src="/resources/images/<%=product.getFileName() %>" style="width:100%" />
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
				<p><a href="./product.jsp?id=<%=product.getProductId() %>" class="btn btn-secondary" role="button">상세정보 &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
		<hr/>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>