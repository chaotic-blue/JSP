<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	//변수설정
	int result = 0;
	
	if(request.getMethod().equals("POST")) {
		//연산자를 가지고 옴. POST와 같다면 호출
		String op = request.getParameter("operator"); //request는 jsp내장객체임 따로 임포트 ㄴㄴ
		
		//문자열 형태로 전달된 인자들을 int 로 변환함.
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		//각 연산자별 처리, op코드 (스크롤 연산자 선택) 경우
		if(op.equals("+")){ 
			result = num1+num2;
		}
		else if(op.equals("-")) {
			result = num1-num2;
		}
		else if(op.equals("*")) {
			result = num1*num2;
		}
		else if(op.equals("/")) {
			result = num1/num2;
		}
		}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계산기</title>
</head>
<body>
<h3>계산기</h3>
<hr>
<form name=form1 method=post>
<INPUT TYPE="text" NAME="num1" width=200 size="5">
<SELECT NAME = "operator">
	<option selected>+</option>
	<option>-<option>
	<option>*<option>
	<option>/<option>
	</SELECT>
	
	<INPUT TYPE = "text" NAME = "num2" width=200 size="5">
	<input type = "submit" value="계산" name="B1"> <input type="reset" value="다시입력" name="B2">
	</form>
	<hr>
	계산결과 : <%=result %>
	
</body>
</html>