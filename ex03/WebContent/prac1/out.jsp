<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); 
	//String date = request.getParameter("date");
%>

<jsp:useBean id="b" class="com.javalec.ex04.Prac"/>
<jsp:setProperty name="b" property="*"/>



<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title> practice에서 조회한 것을 OUT해주는 부분 </title>
</head>

<body>
	<table border = "1">
	<form>
		
		<tr>
			<td  align="center" width="250" bgcolor="#FFEEFF"><h2>순번</h2></td>
			<td  align="center" width="250" bgcolor="#FFEEFF"><h2>작성자</h2></td>
			<td  align="center" width="250" bgcolor="#FFEEFF"><h2>작성일자</h2></td>
			<td  align="center" width="250" bgcolor="#FFEEFF"><h2>제목</h2></td>
		</tr>

		<tr>
		
			<td align="center">
				<% 
				for(int i=1; i<2; i++){
					out.print(i);
				}
				%>
			</td>
			<td align="center">
				<jsp:getProperty name="b" property="writer"/>
			</td>
			<td align="center">
				<jsp:getProperty name="b" property="date"/>
			</td>
			<td align="center">
				<jsp:getProperty name="b" property="title"/>
			</td>
			
		</tr>
		
		<tr>
			<td colspan="4" align = "center">
				<jsp:getProperty name="b" property="text"/>
			</td>
		</tr>

	</form>
	</table>

</html>