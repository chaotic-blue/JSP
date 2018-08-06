package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk") //어노테이션방식 서블릿 네임 지정!!!!!
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement stmt;
	
	private String name, id, pw, phone1, phone2, phone3, gender;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response); //doget으로 들어오든 dopost로 들어오든 actionDo로 처리하게 해둠. request와 response를 값으로 actionDo 호출실행;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		String query = "insert into member2 values('" + id + "', '" + pw + "', '" + name + "', '" + phone1 + "', '" + phone2 + "', '"+ phone3 + "', '" + gender + "')";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //jdbc 드라이브 로드 ㅇㅋ?
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "micol" , "micol"); //데이터베이스 연결.. url, id, pw 값을 넣어줌. connection객체생성
			stmt = connection.createStatement(); //statement 객체를 통해 sql문을 실행시킴.
			int i = stmt.executeUpdate(query); //쿼리문 날림
			if(i == 1){
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp"); //돌려보낼 결과 페이지 호출 ㅇㅋ?
			} else {
				System.out.println("insert fail");
				response.sendRedirect("join.html"); //insert실패하고 다시 join 으로 보내줌
			}
			
			
		} catch (Exception e) {
			e.printStackTrace(); //자바에러처리 호출 함수
		} finally {
			try {
				if(stmt != null) stmt.close(); //stmt 닫으면서 자원반납 역순으로 닫아야됨
				if(connection != null) connection.close();
			} catch (Exception e) {}
		}
		
	}

}
