<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>validation</title>
</head>
<body>
	<form name="frm" id="form">
		<p> 아이디 : <input type="text" name="id" /> <br>
		<p> 비밀번호 : <input type="password" name="pw" /> <br>
		<p> 이름 : <input type="text" name="name" /> <br>
		<p> 나이 : <input type="text" name="age" /> <br>
		<p> <input type="submit" value="전송" onclick="checkForm()" />
	</form>
<script>
	function checkForm() {
		// input 태그의 값을 가져오는 방법 
		alert("아이디는 " + document.frm.id.value + "입니다.");
		
		var formTag = document.getElementById("form");
		alert("비밀번호는 " + formTag.pw.value + "입니다.");
		
		var form = document.getElementsByTagName("form")[0];
		alert("이름은 " + form.name.value + "입니다.");
	}	
	
</script>
</body>
</html>