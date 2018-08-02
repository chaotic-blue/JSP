<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>for문 예제</title>
</head>
<body>

<h2>for문 예제 - 임의의 값을 임의의 횟수로 곱하기</h2>
<form method="post" action="ex03-03Pro.jsp"> <!--post 방식으로 ex03-03Pro.jsp 에게 값 전달하겠다. -->
<dl>
	<dd>
	<label for="number"> 곱해질 값 : </label>
	<input type="nubmer" name="number" autofocus required>
	</dd>
	
	<dd>
	<label for="num"> 곱해질 횟수 : </label>
	<input type="number" name="num" required>
	</dd>
	
	<dd>
	<input type="submit" value="확인">
	</dd>
</dl>

</form>


</body>
</html>


