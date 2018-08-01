<!-- html로 작업된 부분 View부분 웹에 출력형태 조작 하는 파트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- useBean 액션으로 CalcBean 클래스 인스턴스 생성 -->
<jsp:useBean id="calc" class="com.javalec.ex03.CalcBean"/>
<!-- setProperty를 이용해 사용자 입력값을 자동으로 CalcBean 클래스의 맴버변수 -->
<jsp:setProperty name="calc" property="*"/>
<!-- 연산수행에서 메소드 호출하는부분 -->
<% calc.calculate(); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
	계산결과 : <jsp:getProperty name="calc" property="result"/>
	<!--계산결과 :  -->
	
</body>
</html>