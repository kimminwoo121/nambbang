package co.nambbang.app.seller;

import java.sql.SQLException;

import co.nambbang.app.dao.DAO;

public class UsersDao extends DAO {
	public int isLoginCheck(String id, String pw) {

		String sql = "select * from login_info where id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(pw.equals(rs.getString("PASSWORD")))
				{
					return 2;
				}
				return 3;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	public int idDuplicationCheck(String id) {
		String sql = "select * from login_info where id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
