<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>ex03-02Pro 입력결과</h2>



<%
	int va = Integer.parseInt(request.getParameter("val")); //정수형 타입 getParameter로 받은 val을 처리
	String result = "";
	
	if(va >= 10) { //두개의 문자열이 같은가를 비교
		result = "10보다 크거나 같은 값";
	} else{
		result = "10보다 작은 값";
	}
%>

<dl>
	<dd>입력값에 대한 결과:<%=result %></dd>
</dl>


