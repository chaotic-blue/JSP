<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.javalec.daotoex.MemberDAO" %>
<%@ page import = "com.javalec.daotoex.MemberDTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String name = "마인부우";
		String id = "mine";
		String pw = "mine";
		String phone1 = "010";
		String phone2 = "1233";
		String phone3 = "5671";
		String gender = "Man";
		int i;
		
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO dt = new MemberDTO(); //클래스를 받아들일 전체 공간만 잡아두고있다, 하지만 밑에 값을 정의해두고 호출을 한다면 값 개수 틀리면 오류처리해버린다.
		MemberDTO dto = new MemberDTO(name,id,pw,phone1,phone2,phone3,gender); //ArrayList<MemberDTO>타입의 dtos 변수 만듬 
		i = memberDAO.memberInsert(dto);
		if(i == 1)
			out.println("성공적으로 입력되었습니다.");
			//입력성공했을때 메시지 page
		else
			out.println("입력에 실패하였습니다.");
			//입력실패했을때 메시지 page
	
	

	%>



</body>
</html>