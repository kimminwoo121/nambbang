package co.nambbang.app.dao;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;

import co.nambbang.app.dto.SetleDto;
import co.nambbang.app.dto.SetleFormDTO;
import oracle.jdbc.OracleTypes;

public class SetleDAO extends DAO {
	CallableStatement cstmt;

	public String insertSetle(SetleDto dto) {
		// 결재 값을 주고 받는 메소드
		String result = "";

		try {
			conn.setAutoCommit(false);

			cstmt = conn.prepareCall("{call SETLE_PR(?,?,?,?,?,?,?,?)}");
			cstmt.setLong(1, dto.getSetleNo());
			cstmt.setString(2, dto.getOrderMn());
			cstmt.setString(3, dto.getSetleConfmCode());
			cstmt.setInt(4, dto.getSetleAmount());
			cstmt.setInt(5, dto.getMlgUseAmount());
			cstmt.setInt(6, dto.getOrderGroupNo());
			cstmt.setString(7, dto.getOrderTelno());
			cstmt.registerOutParameter(8, OracleTypes.VARCHAR);
			cstmt.executeUpdate();

			result = cstmt.getString(8);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public List<SetleFormDTO> getSetleForm(String id, int no) throws IOException {
		List<SetleFormDTO> list = new ArrayList<SetleFormDTO>();
		
		try {
			cstmt = conn.prepareCall("{call SETLE_FORM_PR(?,?,?)}");
			cstmt.setString(1, id);
			cstmt.setInt(2, no);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.execute();
			rs = (ResultSet) cstmt.getObject(3);
			System.out.println("프로시저 콜 이후 RS에 값담음");
			while (rs.next()) {
				SetleFormDTO dto = new SetleFormDTO();
				dto.setSleId(rs.getString("SLE_ID"));
				dto.setGoodsName(rs.getString("GOODS_NAME"));
				dto.setOrderQy(rs.getInt("ORDER_QY"));
				dto.setSlePc(rs.getInt("SLE_PC"));
				//BLOB을 String으로 변환
				byte[] encoded = Base64.encodeBase64(rs.getBytes("photo_file"));
//				SerialBlob blob = new SerialBlob(rs.getBytes("photo_file"));
//				ByteArrayOutputStream baos = new ByteArrayOutputStream();
//				byte[] buf = new byte[1024];
//				InputStream in = blob.getBinaryStream();
//				int n = 0;
//				while ((n = in.read(buf)) >= 0) {
//					baos.write(buf, 0, n);}
//				in.close();
//				byte[] bytes = baos.toByteArray();
//				System.out.println("bytes" + bytes);
//				byte[] encodeBase64 = Base64.encodeBase64(buf);
				String base64Encoded = new String(encoded, "UTF-8");
				dto.setPhotoFile("data:image/jpg;base64, "+ base64Encoded);
				list.add(dto);
				System.out.println(dto.getGoodsName() + dto.getSleId());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;

	}
	
	public int insertOrders(String id,int orderQy,String sleId) {
		// 주문그룹번호 생성후 주문 그룹번호 리턴, 주문 생성
		int orderGroupNo = 0;
	
		try {
			conn.setAutoCommit(false);

			cstmt = conn.prepareCall("{call order_group_insert_pr(?,?,?,?)}");
			cstmt.setString(1, id);
			cstmt.setInt(2, orderQy);
			cstmt.setString(3, sleId);
			cstmt.registerOutParameter(4, OracleTypes.NUMBER);
			cstmt.executeUpdate();

			orderGroupNo = cstmt.getInt(4);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return orderGroupNo;
	}
	
	public void deleteOrders(String id,int orderId) {
		// 주문삭제, 주문그룹삭제
		
		try {
			conn.setAutoCommit(false);

			cstmt = conn.prepareCall("{call order_group_delete_pr(?,?)}");
			cstmt.setString(1, id);
			cstmt.setInt(2, orderId);
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
