package com.member.db;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
 
//DB연결을 처리하는 클래스 정의
public class DB_conn
{
    public static Connection getConnection() throws SQLException, NamingException, ClassNotFoundException{
            
    		Context initCtx = new InitialContext();
            
            //initCtx의 lookup메서드를 이용해서 "java:comp/env" 에 해당하는 객체를 찾아서 evnCtx에 삽입
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            
            //envCtx의 lookup메서드를 이용해서 "jdbc/orcl"에 해당하는 객체를 찾아서 ds에 삽입
            DataSource ds = (DataSource) envCtx.lookup("jdbc/Oracle11g");
            
            //getConnection메서드를 이용해서 커넥션 풀로 부터 커넥션 객체를 얻어내어 conn변수에 저장
            Connection conn = ds.getConnection();
            return conn;
    }
}


