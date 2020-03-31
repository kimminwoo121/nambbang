package co.nambbang.app.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nambbang.app.dto.sellerDTO;

public class sellerDAO extends DAO {
	CallableStatement cstmt;
	
	public int insert(sellerDTO dto) {
		int n = 0;
		String sql = "insert into seler (SELER_ID, CMPNM, MTLTY_LC, BPRPRR, SELLER_TELNO, BSN_BEGIN_TIME, BSN_CLOS_TIME, SNS_ADRES, INTRCN_SNTNC) "
				+ "values (?, ?, ?, ?, ?, to_date(?,'HH24:mi'), to_date(?,'HH24:mi'), ?, ?)";
		String sql2 = "insert into LOGIN_INFO (ID, PASSWORD, CONECTR_SE) "
				+ "values (?, ?, 'SE')";
		
		try {
			System.out.println();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSid());
			pstmt.setString(2, dto.getSname());
			pstmt.setString(3, dto.getLc());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getNo());
			pstmt.setString(6, dto.getOpen());
			pstmt.setString(7, dto.getClose());
			pstmt.setString(8, dto.getSns());
			pstmt.setString(9, dto.getIntrcn());
			n = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, dto.getSid());
			pstmt.setString(2, dto.getPw());
			n = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	//id(사업자번호) duplication(중복확인)
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

	// 판매자 수정
	public int update(sellerDTO dto) throws Exception {
		int n = 0;
		try {
			String sql = "update seler set "
					+ "CMPNM = ?, MTLTY_LC = ?, SELLER_TELNO = ?, BSN_BEGIN_TIME = to_date(?,'HH24:mi'), BSN_CLOS_TIME = to_date(?,'HH24:mi'), SNS_ADRES = ?, INTRCN_SNTNC = ? "
					+ "where SELER_ID = ?";
			String sql2 = "update LOGIN_INFO set "
					+ "PASSWORD = ? "
					+ "where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSname());
			pstmt.setString(2, dto.getLc());
			pstmt.setString(3, dto.getNo());
			pstmt.setString(4, dto.getOpen());
			pstmt.setString(5, dto.getClose());
			pstmt.setString(6, dto.getSns());
			pstmt.setString(7, dto.getIntrcn());
			pstmt.setString(8, dto.getSid());
			n = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getSid());
			n = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} finally {
			close();
		}
		return n;
	}

	// 단건 조회
	public sellerDTO boardEditSelect(String sid) {

		sellerDTO dto = new sellerDTO();
		String sql = "select SELER_ID, CMPNM, MTLTY_LC, BPRPRR, SELLER_TELNO, "
				+ "to_char(bsn_begin_time,'HH24:mi') bsn_begin_time, "
				+ "to_char(bsn_clos_time,'HH24:mi') bsn_clos_time, SNS_ADRES, "
				+ "INTRCN_SNTNC from seler"
				+ " where SELER_ID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setSid(rs.getString("SELER_ID"));
				dto.setSname(rs.getString("CMPNM"));
				dto.setLc(rs.getString("MTLTY_LC"));
				dto.setName(rs.getString("BPRPRR"));
				dto.setNo(rs.getString("SELLER_TELNO"));
				dto.setOpen(rs.getString("BSN_BEGIN_TIME"));
				dto.setClose(rs.getString("BSN_CLOS_TIME"));
				dto.setSns(rs.getString("SNS_ADRES"));
				dto.setIntrcn(rs.getString("INTRCN_SNTNC"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	// 전체목록조회
	public ArrayList<sellerDTO> select() {
		ArrayList<sellerDTO> list = new ArrayList<>();
		sellerDTO dto = new sellerDTO();
		String sql = "select * from seler";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new sellerDTO();
				dto.setSid(rs.getString("SELER_ID"));
				dto.setSname(rs.getString("CMPNM"));
				dto.setLc(rs.getString("MTLTY_LC"));
				dto.setName(rs.getString("BPRPRR"));
				dto.setNo(rs.getString("SELLER_TELNO"));
				dto.setPhoto(rs.getString("PHOTO_GROUP_ID"));
				dto.setOpen(rs.getString("BSN_BEGIN_TIME"));
				dto.setClose(rs.getString("BSN_CLOS_TIME"));
				dto.setStart(rs.getString("SRBDE"));
				dto.setSns(rs.getString("SNS_ADRES"));
				dto.setIntrcn(rs.getString("INTRCN_SNTNC"));
				dto.setGrade(rs.getString("SELER_GRAD"));
				dto.setStatus(rs.getString("SELER_STTUS"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 사진그룹ID조회
	public String selectPhotoGroupId() {
		String result = "";
		try {
			String sql = "select nvl(max(photo_group_id), 0) + 1 as photo_group_id from photo_group";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			while (rs.next()) {
				result = rs.getString("photo_group_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 사진등록
	public int insertPhoto(sellerDTO dto) throws Exception {
		int r = 0;
		try {
			String sql = "insert into photo_stre(photo_no, photo_name, photo_file, writng_de, photo_group_id)"
					+ " values((select nvl(max(photo_no),0)+1 from photo_stre),?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhotoName());
			pstmt.setBytes(2, dto.getPhotoFile());
			pstmt.setString(3, dto.getPhotoGroupId());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} finally {
			close();
		}
		return r;
	}

	// 사진삭제
	public int deletePhoto(sellerDTO dto) throws Exception {
		int r = 0;
		try {
			String sql = "delete from photo_stre where photo_group_id = ? ";
			if (dto.getPhotoNo() > 0) {
				sql += "and photo_no = ? ";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhotoGroupId());
			if (dto.getPhotoNo() > 0) {
				pstmt.setInt(2, dto.getPhotoNo());
			}
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} finally {
			close();
		}
		return r;
	}

	// 사진그룹등록
	public int insertPhotoGroup(sellerDTO dto) throws Exception {
		int r = 0;
		try {
			String sql = "insert into photo_group(photo_group_id, writng_de)" + " values(?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhotoGroupId());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} finally {
			close();
		}
		return r;
	}

	// 판매자 가게정보 위치 저장
	public void insertSelerLcInfo(String SelerId, double x ,double y) {
		
		try {
			conn.setAutoCommit(false);

			cstmt = conn.prepareCall("{call seler_lcinfo_inser_pr(?,?,?)}");
			cstmt.setString(1, SelerId);
			cstmt.setDouble(2, x);
			cstmt.setDouble(3, y);
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
}
