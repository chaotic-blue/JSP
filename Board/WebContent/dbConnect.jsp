
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%!
		Connection connection; // Connection 타입 connection 객체변수 정의
		Statement statement;
		ResultSet resultSet;
	
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "jhw";
		String upw = "jhw";
		String query = "select * from board";
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		try{
			
			Class.forName(driver);	//oracle.jdbc.driver.OracleDriver //드라이버를 메모리에 로드
			connection = DriverManager.getConnection(url, uid, upw); //커넥션에 담음	//jdbc:oracle:thin:@localhost:1521:xe
			statement = connection.createStatement(); //statement 인스턴스 정의
			resultSet = statement.executeQuery(query);	//select * from member
			
			while(resultSet.next()){ //테이블 데이터 끝날때 까지 돌림
				String title = resultSet.getString("title"); //스트링 변수 id에, 테이블의 컬럼명 id의 값을 담는다. 아시겠어연?
				String writer = resultSet.getString("writer");
				String date = resultSet.getString("date1");
				
				
				out.println("아이디 : " + title + ", 비밀번호 : " + writer + ", 이름 : " + date + "<br />");
			}
			
		} catch(Exception e) {
		} finally {
			try{
				if(resultSet != null) resultSet.close(); //resultSet 닫음
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			} catch(Exception e){}
		}
	%>
	
</body>
</html>