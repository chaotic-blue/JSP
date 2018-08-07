<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title> 게시판연습 </title>
</head>

<body>
	<table border = "1">
	<form method="post" action="out.jsp">
		
		<tr>
			<td align="center" width="100" bgcolor="#FFEEFF"><h3>작성자</h3></td>
		
			<td  width="200" > &nbsp;&nbsp;&nbsp;
				<input type="text" name="writer" size="20" value="">
			</td>

			<td align="center" width="100" bgcolor="#FFEEFF"> <h3>작성일자</h3></td>
		
			<td width="200"> &nbsp;&nbsp;&nbsp;
				<input type="date" name="date" size="20" id="datepicker">
			</td>
		
		</tr>

		<tr>

			<br><br>
			<td align="center" bgcolor="#FFEEFF"><h3>제목</h3></td>
		
			<td colspan="3"> &nbsp;&nbsp;&nbsp;
				<input type="text" name="title" size="20" value="">
			</td>
		</tr>

		<tr>

			<td colspan="4">
				<br>&nbsp;<textarea name="text" rows="8" cols = "100" style="resize:none"></textarea> <br><br>
			</td>
		</tr>

		<tr >
			<td colspan="2" ><input type="submit" name="Update" value="Update" class="btn btn-danger btn-lg"  width="100">
							<input type="reset" name="Cancle" value="Cancle" class="btn btn-primary btn-lg" width="100">
			</td>
		 	
		</tr>
	</form>
	</table>

</html>

<!-- style="background-color:purple;border-color:red;font-face:굴림;font-size:9pt" -->

