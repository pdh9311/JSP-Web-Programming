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
		<p> 나이 : <input type="text" name="age" onkeypress="checkAge()" /> <br>
		<p> <input type="button" value="전송" onclick="checkForm()" />
	</form>
<script>
	function checkForm() {
		// 기본 유효성 검사 : 데이터 값의 유무 확인, 데이터 길이, 숫자 등
		/*  return 타입이 false일 경우 input태그의 기능을 실행하지 않는다.
			「  < focus()함수와 select()함수의 차이점 > 
			focus()는 입력한 값이 있다면 입력되어있는 값 바로 뒤에 커서가 나타난다.
			select()는 입력한 값이 있다면 입력되어있는 값을 모두 선택한 상태로 된다.」
		*/
		var form = document.frm;
			
		for(i=0; i<form.id.value.length;i++) {
			var ch = form.id.value.charAt(i);
			if((ch<'a' || ch>'z') && (ch>'A' || ch<'Z') && (ch>'0' || ch<'9')){
				alert("아이디는 영문 소문자만 입력 가능합니다.");
				form.id.select();
				return false;
			}
		}			
		
		if(form.id.value == "") {
			alert("아이디를 입력해주세요");
			form.id.focus();
			return false;
		}else if(form.id.value.length < 6 || form.id.value.length > 20) {
			alert("아이디를 6~20자 이내로 입력해주세요.");
			form.id.focus();
			return false;
		}else if(form.pw.value == ""){
			alert("비밀번호를 입력해주세요.");
			form.pw.focus();
			return false;
		}else if(form.name.value == "") {
			alert("이름을 입력해주세요.");
			form.name.focus();
			return false;
		}else if(form.age.value == ""){
			alert("나이를 입력해주세요.");
			form.age.focus();
			return false;
		}
		/*
		이렇게 코드를 작성할 경우 만약 스페이스 키가 입력되어도 문제가 없다고 판단하기 때문에 입력 양식의 onkeypress속성을 이용하여 핸들러 함수를 설정해준다.
		}else if(isNaN(form.age.value)){		// isNaN(is Not a Number)함수는 매개값이 숫자가 아니면 true 숫자면 false
			// 숫자가 아니면 false, 숫자면 true
			alert("나이는 숫자를 입력해주세요.");
			form.age.focus();
			return false;
		}
		*/
		form.submit();
	}
	
	function checkAge(){
		if(!(event.keyCode >=48 && event.keyCode <= 57)) {
			alert("나이는 숫자를 입력해주세요.");
			event.returnValue = false;		// event.returnValue를 false로 지정하면 조건문에 만족하지 않는 키 값을 받았을 때 그 값이 입력되지 않게 한다.
		}
	}
</script>
</body>
</html>