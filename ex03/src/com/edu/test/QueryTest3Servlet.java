package com.edu.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/queryTest3") //어노테이션 연결방법
public class QueryTest3Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String name = req.getParameter("name"); // req.getparameter(name)
		//여기 밑에 부분은 resp에 담겨 내려보내줌
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String hobby = req.getParameter("hobby");
		String gender = req.getParameter("gender");
		String religion = req.getParameter("religion");
		String introduction = req.getParameter("introduction");

		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>Query 문자열 테스트</title></head>");
		out.print("<body>");
		out.print("<h1>POST 방식으로 요청되었습니다</h1>");

		out.print("이름 : " + name + "<br/>");
		out.print("ID : " + id + "<br/>");
		out.print("패스워드 : " + pwd + "<br/>");
		out.print("취미 : " + hobby + "<br/>");
		out.print("성별 : " + gender + "<br/>");
		out.print("종교 : " + religion + "<br/>");
		out.print("자기소개 : " + introduction + "<br/>");

		out.println("</body></html>");
		out.close();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { //req객체가 모든 정보 받아서 담고있음. 요청, 응답

		req.setCharacterEncoding("UTF-8");

		String name = req.getParameter("name"); // req.getparameter(name)
		//여기 밑에 부분은 resp에 담겨 내려보내줌
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String[] hobby = req.getParameterValues("hobby"); //배열로 여러개 담아봄
		String gender = req.getParameter("gender");
		String religion = req.getParameter("religion");
		String introduction = req.getParameter("introduction");

		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>Query 문자열 테스트</title></head>");
		out.print("<body>");
		out.print("<h1>POST 방식으로 요청되었습니다</h1>");

		out.print("이름 : " + name + "<br/>");
		out.print("ID : " + id + "<br/>");
		out.print("패스워드 : " + pwd + "<br/>");

		if(hobby.length>0) {
			out.print("취미 : ");
			for(int i=0; i<hobby.length; i++) { //for문으로 여러개 담은거 출력
				out.print(hobby[i]);

				if(i < hobby.length-1)
					out.print(",");
			}
			out.print("<br>");
		}
		else if(hobby.length==0)
			out.print("취미 : " + hobby + "<br/>");

		out.print("성별 : " + gender + "<br/>");
		out.print("종교 : " + religion + "<br/>");
		out.print("자기소개 : " + introduction + "<br/>");
		out.println("</body></html>");
		out.close();

	}
}
