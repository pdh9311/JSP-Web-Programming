<%@page import="jspbook.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="productR" class="jspbook.ProductRepository" scope="session" />

<%-- 다국어 처리 --%>
<c:set value="<%=request.getLocale().getLanguage() %>" var="locale" />
<fmt:setLocale value="${locale}"/>
<fmt:setBundle basename="resourceBundle.message"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title><fmt:message key="title"/></title>
</head>
<body>
	
	<%@ include file="./menu.jsp" %>
	
	
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div>
	
	<div class ="container">
		<div class="text-right">
			<a href="./security/logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<form name="newProduct" action="./processAddProduct.jsp" method="post" class="form-horizontal" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId" /> </label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname" /></label>
				<div class="col-sm-3">
					<input type="text" name="pname" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-3">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New" /><fmt:message key="condition_New"/>
					<input type="radio" name="condition" value="Old" /><fmt:message key="condition_Old"/>
					<input type="radio" name="condition" value="Refurbished" /><fmt:message key="condition_Refurbished"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" />
				</div>
			</div>
			<fmt:message key="button" var="btn"/>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" value="${btn}" class="btn btn-primary" onclick="checkAddProduct()"/>
				</div>
			</div>
		</form> 
		<hr/>
	</div>
	
	<%@ include file="./footer.jsp" %>
</body>
</html>