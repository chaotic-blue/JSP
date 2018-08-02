<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- useBean 액션으로 CalcBean 클래스 인스턴스 생성 -->
<!-- <jsp:useBean id="prac" class="com.javalec.ex04.Prac"/> -->
<!-- setProperty를 이용해 사용자 입력값을 자동으로 CalcBean 클래스의 맴버변수 -->
<!--<jsp:setProperty name="prac" property="*"/> -->
<!-- 연산수행에서 메소드 호출하는부분 -->
<!--  prac.calculate(); %>  -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<title> 문제1번 </title>
</head>

<body>
	<table border = "1">
	<form method="post" action="out.jsp">
		
		<tr>
			<th  width="100" bgcolor="#FFEEFF"><h3>작성자</h3></th>
		
			<td  width="200" > &nbsp;&nbsp;&nbsp;
				<input type="text" name="writer" size="20" value="">
			</td>

			<td align="center" width="100" bgcolor="#FFEEFF"> <h3>작성일자</h3></td>
		
			<td width="200"> &nbsp;&nbsp;&nbsp;
				<input type="date" name="date" size="20" value="">
			</td>
		
		</tr>

		<tr>

			<br><br>
			<th bgcolor="#FFEEFF"><h3>제목</h3></th>
		
			<td colspan="3"> &nbsp;&nbsp;&nbsp;
				<input type="text" name="title" size="20" value="">
			</td>
		</tr>

		<tr>

			<td colspan="4">
				<br>&nbsp;<textarea name="text" rows="8" cols = "100" style="resize:none"></textarea> <br><br>
			</td>
		</tr>

		<tr>
			<td><input type="submit" name="Update" value="Update"></td>
		 	<td><button type="submit">Cancel</button></td>
		</tr>
	</form>
	</table>

</html>