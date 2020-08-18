<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload-cos.jar</title>
</head>
<body>
	<form action="filedata1.jsp" method="post" enctype="multipart/form-data">
		<p> 작성자1 : <input type="text" name="name1" /> 
			제 목1 : <input type="text" name="title1" /> 
			파 일1 : <input type="file" name="file1" /> <br>
		<p> 작성자2 : <input type="text" name="name2" /> 
			제 목2 : <input type="text" name="title2" /> 
			파 일2 : <input type="file" name="file2" /> <br>
		<p> 작성자3 : <input type="text" name="name3" /> 
			제 목3 : <input type="text" name="title3" /> 
			파 일3 : <input type="file" name="file3" /> <br>
		<p> <input type="submit" value="파일 올리기" />
	</form>
</body>
</html>