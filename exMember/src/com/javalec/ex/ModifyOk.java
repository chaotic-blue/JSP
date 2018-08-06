package com.javalec.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ModifyOk
 */
@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement stmt;
	
	private String id, pw, name, phone1, phone2, phone3, gender;
	
	HttpSession httpSession;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyOk() {
        super(); // 상속받은 상위 클래스의 것들의 타입을 맞춘다?
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		httpSession = request.getSession();
		
		id = (String)httpSession.getAttribute("id"); //id는 세션정보값에서 가져온다... (이부분 수정해줫음)
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		if(pwConfirm()){
			System.out.println("OK");
			
			String query = "update member2 set name ='" + name + "', phone1= '" + phone1 + "', phone2 = '" + phone2 + "', phone3 = '" + phone3 + "', gender = '" + gender + "' where id = '" + id + "'";
//			System.out.println(query);
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "micol" , "micol");
				stmt = connection.createStatement();
				int i = stmt.executeUpdate(query);
				if(i ==1){
					System.out.println("update success");
					httpSession.setAttribute("name", name);
					response.sendRedirect("modifyResult.jsp");
				} else {
					System.out.println("update fail");
					response.sendRedirect("modify.jsp");
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(stmt != null) stmt.close();
					if(connection != null) connection.close();
				} catch (Exception e) {}
			}
			
		} else {
			System.out.println("NG");
		}
		
	}
	
	private boolean pwConfirm() {
		boolean rs = false;
		
		String sessionPw =  (String)httpSession.getAttribute("pw");
		
		if(sessionPw.equals(pw)) {
			rs = true;
		} else {
			rs = false;
		}
		
		return rs;
	}

}
