<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload-commons-*.jar</title>
</head>
<body>
	<%
		String fileUploadPath = "D:\\upload";
	
		// commons-fileupload.jar에 포함된 DiskFileUpload 클래스를 이용하여 요청 파라미터를 가져온다.
		DiskFileUpload upload = new DiskFileUpload();	
		upload.setRepositoryPath(fileUploadPath);		// 업로드된 파일을 임시로 저장할 디렉토리를 설정
		upload.setSizeMax(5*1024*1024);					// 최대 파일의 크기를 설정
		List items = upload.parseRequest(request);		// multipart/form-data 유형의 요청 파라미터를 가져온다.
		
		Iterator params = items.iterator();
		
		while(params.hasNext()){
			// commons-fileupload.jar에 포함된 FileItem 클래스의 메소드를 사용하여 요청 파라미터를 분석 처리하여 파일 업로드한다.
			FileItem param = (FileItem)params.next();
			if(param.isFormField()){	// input 태그의 type이 file이 아닌경우 true
				String data = param.getString("utf-8");
				out.print(data + " | ");
			}else{
				String fileName = param.getName();
				out.print(fileName + "<br>");
				File file = new File(fileUploadPath + File.separator + fileName);
				param.write(file);
			}
		}
	%>
</body>
</html>