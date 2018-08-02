<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>for문 예제 - 임의의 값을 임의의 횟수로 곱하기</h2>

<%
	int number = Integer.parseInt(request.getParameter("number"));
	int num = Integer.parseInt(request.getParameter("num"));
	long multiply = 1;
	
	for(int count = 1; count <=num; count++)
		multiply *= number;
%>

결과: <%=multiply%>
</body>
</html>