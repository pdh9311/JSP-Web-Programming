<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="jspbook.ProductRepository"%>
<%@page import="jspbook.Product"%>
<%@page import="java.lang.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/*	
		request.setCharacterEncoding("utf-8");
	
		String productId = request.getParameter("productId");
		String pname = request.getParameter("pname");
		Integer unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
		String description = request.getParameter("description");
		String manufacturer = request.getParameter("manufacturer");
		String category = request.getParameter("category");
		long unitsInStock = Long.parseLong(request.getParameter("unitsInStock"));
		String condition = request.getParameter("condition");
		
		Product newProduct = new Product();
		newProduct.setProductId(productId);
		newProduct.setPname(pname);
		newProduct.setUnitPrice(unitPrice);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(unitsInStock);
		newProduct.setCondition(condition);
		
		ProductRepository dao = ProductRepository.getInstance();
		dao.addProduct(newProduct);
		response.sendRedirect("products.jsp");
		*/

		String filePath = "D:\\SW PDH\\JSP Web Programming\\JSPBook\\WebContent\\resources\\images\\";
		MultipartRequest multi = new MultipartRequest(request,filePath,5*1024*1024,"utf-8",new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("productId");
		String pname = multi.getParameter("pname");
		double unitPrice = Double.parseDouble(multi.getParameter("unitPrice"));
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		long unitsInStock = Long.parseLong(multi.getParameter("unitsInStock"));
		String condition = multi.getParameter("condition");
		String fileName = multi.getFilesystemName("productImage");
		
		Product newProduct = new Product();
		newProduct.setProductId(productId);
		newProduct.setPname(pname);
		newProduct.setUnitPrice(unitPrice);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(unitsInStock);
		newProduct.setCondition(condition);
		newProduct.setFileName(fileName);
		
		ProductRepository dao = ProductRepository.getInstance();
		dao.addProduct(newProduct);		// ArrayList에 Product객체 추가
		
		response.sendRedirect("products.jsp");
	%>
</body>
</html>