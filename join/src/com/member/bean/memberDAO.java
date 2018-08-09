package com.member.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import javax.naming.NamingException;
 
import com.member.db.DB_conn;
 
 
/* Data Access Object
 * DB에 생성된 회원정보가 담긴 join_member 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 */

public class memberDAO 
{
    private static memberDAO instance;
    
    private memberDAO(){}
    
    public static memberDAO getInstance(){
        if(instance==null)
            instance=new memberDAO();
        return instance;
    }
    
    
    
    //*** String -> Date로 변경하는 메서드 (생년월일을 DATE로 바꿀려고..)
    
    public Date stringToDate(memberBean member)
    {
        String year = member.getBirthyy();
        String month = member.getBirthmm();
        String day = member.getBirthdd();
        
        Date birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    }
    
    
    
    //*** 회원정보를 JSP_MEMBER 테이블에 저장하는 메서드
    public void insertMember(memberBean member) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // 커넥션을 가져온다.
            conn = DB_conn.getConnection();
            
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            // 쿼리 생성한다.
            StringBuffer sql = new StringBuffer();
            sql.append("insert into JOIN_MEMBER values");
            sql.append("(?, ?, ?, ?, ?, ?, ?, ?)");        
            stringToDate(member);
            
          	//StringBuffer에 담긴 값을 얻으려면 toString()메서드를 이용해야 함.
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getGender());
            pstmt.setDate(5, stringToDate(member));
            pstmt.setString(6, member.getMail1()+"@"+member.getMail2());
            pstmt.setString(7, member.getPhone());
            pstmt.setString(8, member.getAddress());
            
            // 쿼리 실행
            pstmt.executeUpdate();
            // 완료시 커밋
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            // 오류시 롤백
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end insertMember()
    
    
    
    
    
 //*** 로그인시 아이디, 비밀번호 체크 해주는 메소드
 // 아이디, 비밀번호를 인자값으로 받는다.
    public int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // DB에서 꺼낸 비밀번호를 담을 변수
        int x = -1; //DB에 등록된 비밀번호와 입력한 비밀번호를 비교하기위해 만든 변수
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            StringBuffer query = new StringBuffer();
            query.append("select password FROM JOIN_MEMBER WHERE ID=?");
 
            conn = DB_conn.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id); //쿼리에 id 담는부분
            
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입력된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 비번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ 
                	pstmt.close(); pstmt=null; 
                	}
                
                if ( conn != null ){
                	conn.close(); conn=null;   
                	}
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()


    
}
