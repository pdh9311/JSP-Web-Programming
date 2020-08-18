<%@page import="jspbook.ProductRepository"%>
<%@page import="jspbook.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page errorPage="error/errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>상품 정보</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
		<div class="col-md-5">
		<%--
			프로젝트 외부에 파일 업로드
		 --%>
			<img src="/resources/images/<%=product.getFileName() %>" style="width:100%" />
		</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p> <%=product.getDescription() %>
				<p><b>상품 코드 : </b> <span class="badge badge-danger"><%=product.getProductId() %></span>
				<p><b>제조사</b> : <%=product.getManufacturer() %>
				<p><b>분류</b> : <%=product.getCategory() %>
				<p><b>재고 수</b> : <%=product.getUnitsInStock() %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p>
				<form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
					<a href="#" class="btn btn-info" role="button" onClick="addToCart()">상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning" role="button">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary" role="button">상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
<script>
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</body>
</html>