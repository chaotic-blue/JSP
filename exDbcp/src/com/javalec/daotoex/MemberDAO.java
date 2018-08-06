package com.javalec.daotoex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

//DAO는 연결부분역할 (driver load, conn, PreparedStatement, ResultSet)
public class MemberDAO {

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "micol";
	private String upw = "micol";
	//사용할 url, uid, upw 정의해둠
	
	public MemberDAO() { //생성자
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 로드
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> memberSelect() {
		//MemberDTO 타입으로 ArrayList 생성하겠다리 ㅇㅋ? Select 조회 함수만들어논거
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		
		Connection con = null; //연결을 위한 변수선언
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, uid, upw); //DriverManager을 통해 DB연결부분
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from member2"); //sql실행구문을 resultSet에 담는다.
			
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				
				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close(); //역순으로 닫아줌
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	}
	
	public int memberInsert(MemberDTO dto) { //insert 기능 함수
		
		Connection con = null; //연결을 위한 변수선언
		PreparedStatement pstmt = null;
		String query = "insert into member2 values(?,?,?,?,?,?,?)";
		int rs = 0;
		
		try {
			con = DriverManager.getConnection(url, uid, upw);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone1());
			pstmt.setString(5, dto.getPhone2());
			pstmt.setString(6, dto.getPhone3());
			pstmt.setString(7, dto.getGender());
			
			rs = pstmt.executeUpdate(); // 실행시키고 리턴밸류값 rs정의
			
		} catch(Exception e ) {
			e.printStackTrace();
		} finally {
			try {
				
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch(Exception e) {
				
			}
		}
		return rs;
	}
	
}
