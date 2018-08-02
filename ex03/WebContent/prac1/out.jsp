<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="b" class="com.javalec.ex04.Prac"/>
<jsp:setProperty name="b" property="*"/>
<html>
<head>
<title> practice에서 조회한 것을 OUT해주는 부분 </title>
</head>

<body>
	<table border = "1">
	<form>
		
		<tr>
			<th  width="250" bgcolor="#FFEEFF"><h2>순번</h2></th>
			<th  width="250" bgcolor="#FFEEFF"><h2>작성자</h2></th>
			<th  width="250" bgcolor="#FFEEFF"><h2>작성일자</h2></th>
			<th  width="250" bgcolor="#FFEEFF"><h2>제목</h2></th>
		</tr>

		<tr>
		
			<td>
				<jsp:getProperty name="b" property="seq"/>
			</td>
			<td>
				<jsp:getProperty name="b" property="writer"/>
			</td>
			<td>
				<jsp:getProperty name="b" property="date"/>
			</td>
			<td>
				<jsp:getProperty name="b" property="title"/>
			</td>
			
		</tr>
		
		<tr>
			<td colspan="4">
				<jsp:getProperty name="b" property="text"/>
				<!-- <br>&nbsp;<textarea name="text" rows="8" cols = "100" style="resize:none"></textarea> <br><br> -->
			</td>
		</tr>

	</form>
	</table>

</html>