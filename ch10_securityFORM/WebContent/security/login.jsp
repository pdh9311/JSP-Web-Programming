<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Security</title>
</head>
<body>
	<form action="j_security_check" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="j_username" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="j_password" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="인증" /></td>
			</tr>
		</table>
	</form>
</body>
</html>	