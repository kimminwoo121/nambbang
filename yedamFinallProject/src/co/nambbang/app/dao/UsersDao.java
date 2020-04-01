package co.nambbang.app.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;

import co.nambbang.app.dto.CertificationDto;
import co.nambbang.app.dto.LoginInfoDto;
import co.nambbang.app.dto.SetleDto;
import co.nambbang.app.dto.UsersDto;
import oracle.jdbc.OracleTypes;

public class UsersDao extends DAO {
	CallableStatement cstmt;
	
	//email 로 id 값 가져오기
	public String emailFromidSearch(String email) {
		String sql = "select user_id "
				+ " from users "
				+ " where USER_MAIL=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
		
			rs = pstmt.executeQuery();
			if (rs.next()) {
				//인증번호 일치
				String id = rs.getString("user_id");
				return id;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return null;
		
	}
	
	//email certification check id,pw
	public CertificationDto certificationCheck(String email,String cerNo) {
		CertificationDto Dto = new CertificationDto();
		String sql = "select * "
				+ " from certification "
				+ " where cer_email=? and cer_no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, cerNo);
		
			rs = pstmt.executeQuery();
			if (rs.next()) {
				//인증번호 일치
				Dto.setCerEmail("CER_EMAIL");
				Dto.setCerId("CER_ID");
				Dto.setCerName("CER_NAME");
				Dto.setCerNo("CER_NO");
				return Dto;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return null;
		
	}
	
	//email certification id and pw;
	public int certificationUpdate(String no,String name,String id,String email) {
		String sql ="MERGE INTO certification" + 
				" USING DUAL" + 
				"     ON (CER_EMAIL = ?)" + 
				"            WHEN MATCHED THEN" + 
				"                      UPDATE SET" + 
				"                            CER_NO = ?" + 
				"            WHEN NOT MATCHED THEN" + 
				"                      INSERT (CER_NO,CER_NAME,CER_ID,CER_EMAIL ) " + 
				"                                 VALUES (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, no);
			pstmt.setString(3, no);
			pstmt.setString(4, name);
			pstmt.setString(5, id);
			pstmt.setString(6, email);
			int r = pstmt.executeUpdate();
			if (r>0) {
				//인증번호 바뀌거나 넣기 성공
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}
	
	//id,pw check;
	public int userIdPwCertification(String id, String email) {
		String sql = "select * from users where user_name=? "
				+ " and user_mail=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				//name,email exist
				return 2;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		//id not exist
		return 1;
	}
	//user_sttus (admin,seller,users)
	public String userStatus(String id) {
		String user_sttus=null;
		String sql="select USER_STTUS from users where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user_sttus=rs.getString("USER_STTUS");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return user_sttus;
	}
	
	//
	public int insertIdPw(LoginInfoDto idPw) {
		int n=0;
		String sql="insert into login_info values(?,?,'US')";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idPw.getId());
			pstmt.setString(2, idPw.getPassword());
			System.out.println(idPw);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return n;
	}
	
	public void insertMlg(String id) {
		// 회원 마일리지 입력
		try {
			conn.setAutoCommit(false);
			cstmt = conn.prepareCall("{call user_mlg_pr(?)}");
			cstmt.setString(1, id);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
		
	//(Users)register
	public int insertRegister(UsersDto user) {
		int n=0;
		String sql = "insert into users(USER_ID, USER_NAME, USER_MAIL, "
				+ "USER_TELNO, USER_BRTHDY, USER_SEXDSTN, USER_STTUS, SRBDE)"
				+ " values(?,?,?,?,?,?,'UNO',sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserMail());
			pstmt.setString(4, user.getUserTelNo());
			pstmt.setDate(5, new java.sql.Date(user.getUserBirthdy().getTime()));
			pstmt.setString(6, user.getUserSexDSTN());
			System.out.println(user);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return n;
	}
	// id,pw login check
	public int isLoginCheck(String id, String pw) {

		String sql = "select * from login_info where id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(pw.equals(rs.getString("PASSWORD")))
				{
					//로그인 가능
					return 2;
				}
				//비밀번호틀림
				return 3;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		//id not exist
		return 1;
	}
	// login log 파일 기록
	public void insertConectlog(String id) {
		// 주문삭제, 주문그룹삭제
		
		try {
			conn.setAutoCommit(false);

			cstmt = conn.prepareCall("{call conect_log_pr(?)}");
			cstmt.setString(1, id);
			cstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	//id duplication(중복확인)
	public int idDuplicationCheck(String id) {
		String sql = "select * from login_info where id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			//중복;
			if (rs.next()) {
				return 1;
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		//이용가능
		return 0;
	}
	//회원,판매자,관리자 구분
	public String loginConectrSeCheck(String id) {
		String conectrSe=null;
		String sql="select conectr_se from login_info where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				conectrSe=rs.getString("conectr_se");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return conectrSe;
	}
	
	
	public int getMlg(String id) {
		CallableStatement cstmt;
		// 결재 값을 주고 받는 메소드
		int result = 0;

		try {
			conn.setAutoCommit(false);

			cstmt = conn.prepareCall("{call mlg_select_pr(?,?)}");
			cstmt.setString(1, id);						
			cstmt.registerOutParameter(2, OracleTypes.NUMBER);
			cstmt.execute();

			result = cstmt.getInt(2);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close();
		}

		return result;
	}
	
	
	
	
	
}
