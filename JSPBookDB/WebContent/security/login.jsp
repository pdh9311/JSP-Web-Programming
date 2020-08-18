<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>관리자 영역 Security</title>
</head>
<body>
	
	<%@ include file="../menu.jsp" %>
	
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class ="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			
			<%
				String error = request.getParameter("error");
				if(error != null) {
					out.print("<div class='alert alert-danger'>");
					out.print("아이디와 비밀번호를 확인해주세요");
					out.print("</div>");
				}
			%>
			
			<form class="form-signin" action="j_security_check" method="post" >
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" name="j_username" class="form-control" placeholder="ID" required autofocus/>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" name="j_password" class="form-control" placeholder="Password" required />
				</div>
				<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>