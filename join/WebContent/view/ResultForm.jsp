<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>결과 화면</title>
</head>
<body>
	<br><br><br>
	<%
		String msg = (String)session.getAttribute("msg");
	
		if(msg != null)
		{
			if(msg.equals("0"))
				out.println("<font size='6'>회원정보가 수정되었습니다.</font>");
			else if(msg.equals("1"))
				out.println("<font size='6'>회원가입을 축하드립니다.</font>");
			else if(msg.equals("3"))
				out.println("<font size='6'>틀렸습니다..</font>");		
			session.removeAttribute("msg");
		}
		else
		{
			out.println("<font size='6'>회원정보가 삭제되었습니다.</font>");
		}
	%>
	<br><br>
	<input type="button" value="메인으로" onclick="javascript:window.location='MainForm.do'"/>
	
</body>
</html>