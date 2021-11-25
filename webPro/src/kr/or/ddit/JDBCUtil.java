package kr.or.ddit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {
	
	//변수 선언
	private static Connection conn;

//	public JDBCUtil(){ //생성자를 호출하지않고, static으로 공유한다
	static {
		
		//Driver Class를 로딩하면 객체가 생성되고 DriverManger에 등록된다
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			//Driver클래스를 찾지 못할 경우 ClassNotFoundException 예외가 발생된다
			e.printStackTrace();
		}
	}
	
	//DB Connection 연결
	public static Connection getConn() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
			//Connection객체 생성 + 접속
			conn = DriverManager.getConnection(url, "JCG92", "java");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	/* DriverManager : JVM에서 JDBC전체를 관리하는 클래스.
	 * 					Driver등록, Connection 연결 작업 등을 한다.
	 * 				=> Class.forName() 메소드를 통해 생성된다.
	 *  
	 * Connection 객체생성 과 접속
	 * Connection conn = DriverManger.getconnection(url,id,pw)
	 * url = jdbc라이브러리:오라클로 연결:자바로연결:@내부ip로접속:port:Listener
	 *  
	 * DAO에서 Connection메소드 호출해서 SQL문 작성
	 * 
	 * Connection 및 기타객체 닫기(접속 종료)
	 * Connection, PreparedStatement, ResultSet close 
	 * */
	
	//Connection 및 기타 객체 닫기
	public static void close(Connection conn) {
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static void close(Connection conn, PreparedStatement ps) {
		if(ps != null)
			try {
				ps.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs != null)
			try {
				rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	
	
	
	
}
