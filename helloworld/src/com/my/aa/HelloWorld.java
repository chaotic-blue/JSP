package com.my.aa;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloWorld
 */
@WebServlet("/Hworld") /* 맵퍼부분 도메인뒤에 대체되어 붙는다. servlet/패키지명.프로젝트네임 부분 이게 Hworld로 바꿔서 간단하게 사용해달라는 부분, 보안도 생각함*/
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L; //고정변수 사용 final
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloWorld() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath()); //브라우져에 표현하는 내용
		System.out.println("Hello world ~~~~~~~~~ ");
		System.out.println("수업 잘 듣자. ^^ ");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
