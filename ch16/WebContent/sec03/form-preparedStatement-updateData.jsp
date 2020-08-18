<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<form action="jdbc-preparedStatement-update.jsp" method="post">
		<input type="text" name="id" placeholder="아이디" /> <br>
		<input type="submit" value="전송" />
	</form>
	<a href ="jdbc-preparedStatement-select.jsp">데이터 검색</a>
	<a href ="jdbc-preparedStatement-delete.jsp">데이터 삭제</a>
	<a href ="form-preparedStatement-insertData.jsp">데이터 삽입</a>
</body>
</html>