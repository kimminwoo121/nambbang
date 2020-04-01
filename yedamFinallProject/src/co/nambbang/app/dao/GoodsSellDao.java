package co.nambbang.app.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nambbang.app.dto.GoodsMainSellDto;

public class GoodsSellDao extends DAO {
	// 메인화면 전체 상품 리스트
	public ArrayList<GoodsMainSellDto> mainList(Double x, Double y) {
		ArrayList<GoodsMainSellDto> list = new ArrayList<>();
//		String sql="select c.sle_id SLE_ID,a.GOODS_NAME GOODS_NAME,"
//				+ "c.sle_qy SLE_QY,c.SLE_PC SLE_PC,c.SLE_BEGIN_TIME SLE_BEGIN_TIME,"+
//				"c.SLE_END_TIME SLE_END_TIME,a.GOODS_CL GOODS_CL,a.NETPRC NETPRC"+
//				",(select photo_file from photo_stre where photo_group_id = a.PHOTO_GROUP_ID and rownum = 1 ) as PHOTO_NAME"+
//				" from GOODS_REGIST a, goods_sle c "+
//				" where a.GOODS_ID = c.GOODS_ID " +
//				" order by c.SLE_BEGIN_TIME desc ";
		String sql = "SELECT c.sle_id sle_id, " 
				+ "  a.goods_name goods_name, " 
				+ "  c.sle_qy sle_qy, "
				+ "  c.sle_pc sle_pc, " 
				+ "  c.sle_begin_time sle_begin_time, "
				+ "  c.sle_end_time sle_end_time, " 
				+ "  a.goods_cl goods_cl, " 
				+ "  a.netprc netprc, "
				+ "  i.mtlty_lc mtlty_lc, " 
				+ "  i.cmpnm cmpnm, " 
				+ "  (SELECT photo_file "
				+ "  FROM photo_stre " 
				+ "  WHERE photo_group_id = a.photo_group_id "
				+ "  AND ROWNUM           = 1 " 
				+ "  ) AS photo_name, " 
				+ "  i.DSTNC "
				+ "FROM goods_regist a, " 
				+ "  goods_sle c, "
				+ "  (select s.* , round(DSTNC_CALC_FU(l.la,l.lo,?,?),20) as DSTNC " 
				+ "  from seler s, "
				+ "  seler_lcinfo l " 
				+ "  where s.seler_id = l.seler_id) i "
				+ "WHERE a.goods_id = c.goods_id " 
				+ "AND a.seler_id   = i.seler_id "
				+ "AND sysdate between c.sle_begin_time and c.sle_end_time "
				+ "ORDER BY i.DSTNC ";
	
		
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			if(x == null)
				x = 35.871389;
			pstmt.setDouble(1, x);
			if(y == null) 
				y = 128.601389;
			pstmt.setDouble(2, y);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				if (rs.getBlob("PHOTO_NAME") == null) {
				} else {
					GoodsMainSellDto dto = new GoodsMainSellDto();
					dto.setSleId(rs.getString("SLE_ID"));
					dto.setGoodsName(rs.getString("GOODS_NAME"));
					dto.setSleBeginTime(rs.getTimestamp("SLE_BEGIN_TIME"));
					dto.setSleEndTime(rs.getTimestamp("SLE_END_TIME"));
					dto.setSlePc(rs.getInt("SLE_PC"));
					dto.setSleQy(rs.getInt("SLE_QY"));
					dto.setNetPrc(rs.getInt("NETPRC"));
					dto.setGoodsCl(rs.getString("GOODS_CL"));
					dto.setMtlty_lc(rs.getNString("MTLTY_LC"));
					dto.setCmpnm(rs.getString("CMPNM"));
					dto.setDstnc(Math.round(rs.getDouble("DSTNC")*10)/10.0);
					Blob blob = rs.getBlob("PHOTO_NAME");
					dto.setPhotoFile(blob.getBytes(1, (int) blob.length()));
					list.add(dto);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

}
