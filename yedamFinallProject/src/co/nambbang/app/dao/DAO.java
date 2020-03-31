package co.nambbang.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DAO {
	protected Connection conn;
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	
	

	

	
	
//	private String driver = "oracle.jdbc.driver.OracleDriver";
//	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	private String user = "p_test";
//	private String pw = "p_test";
	
	
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@(DESCRIPTION=(LOAD_BALANCE=ON)" +
            "(ADDRESS=(PROTOCOL=TCP)(HOST=39.116.34.40)(PORT=51234))" +
            "(ADDRESS=(PROTOCOL=TCP)(HOST=39.116.34.40)(PORT=51235))" +
            "(CONNECT_DATA=(SERVICE_NAME=racdb)))";
	private String user = "nambbang";
	private String pw = "nambbang";


//	private String url = "jdbc:oracle:thin:@192.168.219.102:1521:orcl";
//	private String user = "ymy";
//	private String pw = "ymy";
	
	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
		} catch (ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	 public void setAutoCommit(boolean bl) {
		 if(conn != null)
			try {
				conn.setAutoCommit(bl);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 }
	 
	 public void commit() {
		 if(conn != null)
			try {
				conn.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 }
	 
	 public void rollback() {
		 if(conn != null)
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 }
}
