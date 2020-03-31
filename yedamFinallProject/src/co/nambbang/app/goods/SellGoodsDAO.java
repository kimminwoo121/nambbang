package co.nambbang.app.goods;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.codec.binary.Base64;

import co.nambbang.app.dao.DAO;
import co.nambbang.app.dto.sellerDTO;

public class SellGoodsDAO extends DAO {
	//상품목록
	public List<SellGoodsDTO> selectSellGoodsList(Map<String, Object> param, int startNo, int endNo) {
		List<SellGoodsDTO> list = new ArrayList<SellGoodsDTO>();

		try {
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * FROM ( ");
			sql.append("		SELECT GR.GOODS_ID ");
			sql.append("		     , GR.GOODS_NAME ");
			sql.append("		     , GR.NETPRC ");
			sql.append("		     , GR.GOODS_INFO ");
			sql.append("		     , GR.GOODS_CL ");
			sql.append("		     , GS.SLE_ID ");
			sql.append("		     , (GS.SLE_QY - nvl((select sum(order_qy) from orders where sle_id = gs.sle_id group by sle_id),0)) as SLE_QY ");
			sql.append("		     , GS.SLE_PC ");
			sql.append("		     , GS.MNFCTUR_DE ");
			sql.append("		     , TO_CHAR(GS.MNFCTUR_DE, 'YYYY-MM-DD HH24:MI:SS') AS MNFCTUR_DE_VIEW ");
			sql.append("		     , GS.SLE_BEGIN_TIME ");
			sql.append("		     , TO_CHAR(GS.SLE_BEGIN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SLE_BEGIN_TIME_VIEW ");
			sql.append("		     , GS.SLE_END_TIME ");
			sql.append("		     , TO_CHAR(GS.SLE_END_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SLE_END_TIME_VIEW ");
			sql.append("		     , GS.GOOS_SLE_RESULT ");
			sql.append("		     , GC.CANCL_RESN ");
			sql.append("		     , GC.CANCL_DE ");
			sql.append("		     , TO_CHAR(GC.CANCL_DE, 'YYYY-MM-DD HH24:MI:SS') AS CANCL_DE_VIEW ");
			sql.append("		     , GS.RGSDE ");
			sql.append("			 , TO_CHAR(GS.RGSDE, 'YYYY-MM-DD HH24:MI:SS') AS RGSDE_VIEW ");
			sql.append("			 , CASE WHEN GC.CANCL_DE IS NOT NULL THEN 'Y' ELSE 'N' END CANCL_YN ");
			sql.append("			 , GR.PHOTO_GROUP_ID ");
			sql.append("			 , CASE WHEN GS.GOOS_SLE_RESULT = 'A' THEN '완판' WHEN GS.GOOS_SLE_RESULT = 'P' THEN '부분판매' WHEN GS.GOOS_SLE_RESULT = 'C' THEN '판매취소' ELSE ' ' END AS GOOS_SLE_RESULT_VIEW "); 
			sql.append("			 , ROW_NUMBER() OVER(ORDER BY GS.SLE_ID DESC) AS NUM "); 
			sql.append("		FROM GOODS_REGIST GR INNER JOIN GOODS_SLE GS ON GR.GOODS_ID = GS.GOODS_ID ");
			sql.append("										LEFT OUTER JOIN GOODS_CANCL GC ON GS.SLE_ID = GC.SLE_ID ");
			sql.append("    WHERE 1=1 ");
			
			//id 추가
			if(param.get("id") != null && ((String)param.get("id")).length() > 0) {
				sql.append("and GR.SELER_ID = '" + param.get("id") + "' ");
			}				
			//검색조건 추가
			if(param.get("schSleId") != null && ((String)param.get("schSleId")).length() > 0) {
				sql.append("and GS.SLE_ID like '" + param.get("schSleId") + "%' ");
			}
			if(param.get("schGoodsId") != null && ((String)param.get("schGoodsId")).length() > 0) {
				sql.append("and GR.GOODS_ID like '" + param.get("schGoodsId") + "%' ");
			}
			if(param.get("schGoodsNm") != null && ((String)param.get("schGoodsNm")).length() > 0) {
				sql.append("and GR.GOODS_NAME like '" + param.get("schGoodsNm") + "%' ");
			}
			sql.append(") WHERE NUM BETWEEN ");
			sql.append(startNo);
			sql.append("AND ");
			sql.append(endNo);
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(sql.toString());
			System.out.println(sql);
			while (rs.next()) {
				SellGoodsDTO dto = new SellGoodsDTO();
				dto.setGoodsId(rs.getString("goods_id"));
				dto.setGoodsName(rs.getString("goods_name"));
				dto.setRgsdeView(rs.getString("rgsde_view"));
				dto.setNetprc(rs.getInt("netprc"));
				dto.setGoodsInfo(rs.getString("goods_info"));
				dto.setGoodsCl(rs.getString("goods_cl"));
				dto.setSleId(rs.getString("sle_id"));
				dto.setSleQy(rs.getInt("sle_qy"));
				dto.setSlePc(rs.getInt("sle_pc"));
				dto.setMnfcturDe(rs.getString("mnfctur_de_view"));
				dto.setSleBeginTime(rs.getString("sle_begin_time_view"));
				dto.setSleEndTime(rs.getString("sle_end_time_view"));
				dto.setCanclYn(rs.getString("cancl_yn"));
				dto.setPhotoGroupId(rs.getString("photo_group_id"));
				dto.setGoosSleResult(rs.getString("goos_sle_result"));
				dto.setGoosSleResultView(rs.getString("goos_sle_result_view"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return list;
	}

	//상품목록총건수
	public int selectSellGoodsCount(Map<String, Object> param) {
		int result = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			
			sql.append("    SELECT COUNT(*) AS CNT");
			sql.append("		FROM GOODS_REGIST GR INNER JOIN GOODS_SLE GS ON GR.GOODS_ID = GS.GOODS_ID ");
			sql.append("						LEFT OUTER JOIN GOODS_CANCL GC ON GS.SLE_ID = GC.SLE_ID ");
			sql.append("    WHERE 1=1 ");
			
			//id 추가
			if(param.get("id") != null && ((String)param.get("id")).length() > 0) {
				sql.append("and GR.SELER_ID = '" + param.get("id") + "' ");
			}				
			//검색조건 추가
			if(param.get("schSleId") != null && ((String)param.get("schSleId")).length() > 0) {
				sql.append("and GS.SLE_ID like '" + param.get("schSleId") + "%' ");
			}
			if(param.get("schGoodsId") != null && ((String)param.get("schGoodsId")).length() > 0) {
				sql.append("and GR.GOODS_ID like '" + param.get("schGoodsId") + "%' ");
			}
			if(param.get("schGoodsNm") != null && ((String)param.get("schGoodsNm")).length() > 0) {
				sql.append("and GR.GOODS_NAME like '" + param.get("schGoodsNm") + "%' ");
			}
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(sql.toString());

			while (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return result;
	}		
	public sellerDTO selectSelerLocation(String sleId) {
		sellerDTO sDto = new sellerDTO();
		
		String sql = "select s.mtlty_lc, s.cmpnm " + 
				"from goods_sle gs, goods_regist gr, seler s " + 
				"where gs.goods_id = gr.goods_id " + 
				"and gr.seler_id = s.seler_id " + 
				"and gs.sle_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sleId);			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sDto = new sellerDTO();
				sDto.setSname(rs.getString("cmpnm"));
				sDto.setLc(rs.getString("mtlty_lc"));
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
				
		return sDto;
	}
	//상품상세
	public SellGoodsDTO selectSellGoodsDetail(String sleId) {
		return this.selectSellGoodsDetail(sleId, null);
	}
	
	//상품상세
	public SellGoodsDTO selectSellGoodsDetail(String sleId, String goodsId) {
		SellGoodsDTO dto = new SellGoodsDTO();
		StringBuffer sql = new StringBuffer();
		try {
			sql.append("		SELECT GR.GOODS_ID ");
			sql.append("		     , GR.GOODS_NAME ");
			sql.append("		     , GR.NETPRC ");
			sql.append("		     , GR.GOODS_INFO ");
			sql.append("		     , GR.GOODS_CL ");
			sql.append("		     , GS.SLE_ID ");
			sql.append("		     , (GS.SLE_QY - nvl((select sum(order_qy) from orders where sle_id = gs.sle_id group by sle_id),0)) as SLE_QY ");
			sql.append("		     , GS.SLE_PC ");
			sql.append("		     , GS.MNFCTUR_DE ");
			sql.append("		     , TO_CHAR(GS.MNFCTUR_DE, 'YYYY-MM-DD HH24:MI:SS') AS MNFCTUR_DE_VIEW ");
			sql.append("		     , TO_CHAR(GS.MNFCTUR_DE, 'YYYY-MM-DD') AS MNFCTUR_DE_YMD ");
			sql.append("		     , TO_CHAR(GS.MNFCTUR_DE, 'HH24') AS MNFCTUR_DE_HH ");
			sql.append("		     , TO_CHAR(GS.MNFCTUR_DE, 'MI') AS MNFCTUR_DE_MM ");
			sql.append("		     , TO_CHAR(GS.MNFCTUR_DE, 'SS') AS MNFCTUR_DE_SS ");
			sql.append("		     , GS.SLE_BEGIN_TIME ");
			sql.append("		     , TO_CHAR(GS.SLE_BEGIN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SLE_BEGIN_TIME_VIEW ");
			sql.append("		     , TO_CHAR(GS.SLE_BEGIN_TIME, 'HH24') AS SLE_BEGIN_TIME_HH ");
			sql.append("		     , TO_CHAR(GS.SLE_BEGIN_TIME, 'MI') AS SLE_BEGIN_TIME_MM ");
			sql.append("		     , TO_CHAR(GS.SLE_BEGIN_TIME, 'SS') AS SLE_BEGIN_TIME_SS ");
			sql.append("		     , GS.SLE_END_TIME ");
			sql.append("		     , TO_CHAR(GS.SLE_END_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SLE_END_TIME_VIEW ");
			sql.append("		     , TO_CHAR(GS.SLE_END_TIME, 'HH24') AS SLE_END_TIME_HH ");
			sql.append("		     , TO_CHAR(GS.SLE_END_TIME, 'MI') AS SLE_END_TIME_MM ");
			sql.append("		     , TO_CHAR(GS.SLE_END_TIME, 'SS') AS SLE_END_TIME_SS ");			
			sql.append("		     , GS.GOOS_SLE_RESULT ");
			sql.append("		     , GC.CANCL_RESN ");
			sql.append("		     , GC.CANCL_DE ");
			sql.append("		     , TO_CHAR(GC.CANCL_DE, 'YYYY-MM-DD HH24:MI:SS') AS CANCL_DE_VIEW ");
			sql.append("		     , GS.RGSDE ");
			sql.append("			 , TO_CHAR(GS.RGSDE, 'YYYY-MM-DD HH24:MI:SS') AS RGSDE_VIEW ");
			sql.append("			 , CASE WHEN GC.CANCL_DE IS NOT NULL THEN 'Y' ELSE 'N' END CANCL_YN "); 
			sql.append("			 , GR.PHOTO_GROUP_ID "); 
			sql.append("			 , CASE WHEN GS.GOOS_SLE_RESULT = 'A' THEN '완판' WHEN GS.GOOS_SLE_RESULT = 'P' THEN '부분판매' WHEN GS.GOOS_SLE_RESULT = 'C' THEN '판매취소' ELSE ' ' END AS GOOS_SLE_RESULT_VIEW ");
			sql.append("		FROM GOODS_REGIST GR INNER JOIN GOODS_SLE GS ON GR.GOODS_ID = GS.GOODS_ID ");
			sql.append("										LEFT OUTER JOIN GOODS_CANCL GC ON GS.SLE_ID = GC.SLE_ID ");
			sql.append("    WHERE GS.SLE_ID = ? ");
			if(goodsId != null && goodsId.length() > 0) {
				sql.append("    AND GR.GOODS_ID = ? ");
			}
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, sleId);
			if(goodsId != null && goodsId.length() > 0) {
				pstmt.setString(2, goodsId);
			}			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setGoodsId(rs.getString("goods_id"));
				dto.setGoodsName(rs.getString("goods_name"));
				dto.setRgsdeView(rs.getString("rgsde_view"));
				dto.setNetprc(rs.getInt("netprc"));
				dto.setGoodsInfo(rs.getString("goods_info"));
				dto.setGoodsCl(rs.getString("goods_cl"));
				dto.setSleId(rs.getString("sle_id"));
				dto.setSleQy(rs.getInt("sle_qy"));
				dto.setSlePc(rs.getInt("sle_pc"));
				dto.setMnfcturDe(rs.getString("mnfctur_de_view"));
				dto.setMnfcturDeYmd(rs.getString("mnfctur_de_ymd"));
				dto.setMnfcturDeHh(rs.getString("mnfctur_de_hh"));
				dto.setMnfcturDeMm(rs.getString("mnfctur_de_mm"));
				dto.setMnfcturDeSs(rs.getString("mnfctur_de_ss"));
				dto.setSleBeginTime(rs.getString("sle_begin_time_view"));
				dto.setSleBeginTimeHh(rs.getString("sle_begin_time_hh"));
				dto.setSleBeginTimeMm(rs.getString("sle_begin_time_mm"));
				dto.setSleBeginTimeSs(rs.getString("sle_begin_time_ss"));
				dto.setSleEndTime(rs.getString("sle_end_time_view"));
				dto.setSleEndTimeHh(rs.getString("sle_end_time_hh"));
				dto.setSleEndTimeMm(rs.getString("sle_end_time_mm"));
				dto.setSleEndTimeSs(rs.getString("sle_end_time_ss"));
				dto.setCanclYn(rs.getString("cancl_yn"));
				dto.setPhotoGroupId(rs.getString("photo_group_id"));
				dto.setGoosSleResult(rs.getString("goos_sle_result"));
				dto.setGoosSleResultView(rs.getString("goos_sle_result_view"));
				dto.setCanclResn(rs.getString("cancl_resn"));
				dto.setCanclDeView(rs.getString("cancl_de_view"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return dto;
	}		
	
	//상품판매 등록
	public int insertSellGoods(SellGoodsDTO dto) throws Exception{
		int r = 0;
		try { 
			String sql = "INSERT INTO GOODS_SLE ( SLE_ID,GOODS_ID,SLE_QY,SLE_PC,MNFCTUR_DE,SLE_BEGIN_TIME,SLE_END_TIME,RGSDE ) "
					+" VALUES ((SELECT 'SLE' || lpad(nvl(max(to_number(REGEXP_REPLACE(SLE_ID, '[^0-9]+'))),0)+1, 10, '0') FROM GOODS_SLE), ?, ?, ?, to_date(to_char(sysdate, 'YYYYMMDD') || ?, 'YYYYMMDDHH24MISS'), to_date(to_char(sysdate, 'YYYYMMDD') || ?, 'YYYYMMDDHH24MISS'), to_date(to_char(sysdate, 'YYYYMMDD') || ?, 'YYYYMMDDHH24MISS'), SYSDATE) ";
			System.out.println("insertSQL::" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getGoodsId());
			pstmt.setInt(2, dto.getSleQy());
			pstmt.setInt(3, dto.getSlePc());
			pstmt.setString(4, dto.getMnfcturDe());
			pstmt.setString(5, dto.getSleBeginTime());
			pstmt.setString(6, dto.getSleEndTime());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}
	
	//상품판매 수정
	public int updateSellGoods(SellGoodsDTO dto) throws Exception{
		int r = 0;
		try { 
			String sql = "UPDATE GOODS_SLE SET "
					+" SLE_QY = ?, SLE_PC = ?, MNFCTUR_DE = to_date(replace(?, '-', ''), 'YYYYMMDDHH24MISS') "
					+" , SLE_BEGIN_TIME = to_date(to_char(sysdate, 'YYYYMMDD') || ?, 'YYYYMMDDHH24MISS'), SLE_END_TIME = to_date(to_char(sysdate, 'YYYYMMDD') || ?, 'YYYYMMDDHH24MISS'), GOOS_SLE_RESULT = ? "
					+" WHERE SLE_ID = ? AND GOODS_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getSleQy());
			pstmt.setInt(2, dto.getSlePc());
			pstmt.setString(3, dto.getMnfcturDe());
			pstmt.setString(4, dto.getSleBeginTime());
			pstmt.setString(5, dto.getSleEndTime());
			pstmt.setString(6, dto.getGoosSleResult());
			pstmt.setString(7, dto.getSleId());
			pstmt.setString(8, dto.getGoodsId());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}
	
	//상품판매취소 등록
	public int cancelSellGoods(SellGoodsDTO dto) throws Exception{
		int r = 0;
		try { 
			String sql = "INSERT INTO GOODS_CANCL ( SLE_ID, CANCL_RESN, CANCL_DE ) "
					+" VALUES (?, ?, SYSDATE) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSleId());
			pstmt.setString(2, dto.getCanclResn());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}	
	
	
	//상품 판매내역 리스트
	public ArrayList<SellLogDTO> sellLogList(String id) throws IOException{
		ArrayList<SellLogDTO> list = new ArrayList<SellLogDTO>();
		
		String sql = "SELECT " + 
				"        gr.goods_name, " + 
				"        gs.goods_id, " + 
				"        gs.sle_id, " +
				"        (select photo_file from photo_stre where photo_group_id = gr.photo_group_id and rownum = 1 ) as photo_file, " +
				"        o.order_qy, " + 
				"        o.order_id, " +
				"        og.user_id, " + 
				"        s.setle_de, " + 
				"        s.setle_amount " + 
				"FROM " + 
				"        goods_regist gr, " + 
				"        goods_sle gs, " + 
				"        orders o, " + 
				"        order_group og, " + 
				"        setle s " + 
				"WHERE " + 
				"        gr.goods_id = gs.goods_id " + 
				"AND " + 
				"        gs.sle_id = o.sle_id " + 
				"AND " + 
				"        o.order_group_no = og.order_group_no " + 
				"AND " + 
				"        s.order_group_no = og.order_group_no " + 
				"AND " + 
				"        s.setle_code = 'SC' " + 
				"AND " + 
				"        gr.seler_id = ?";
				System.out.println("sellLogSQL:" +  sql);
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						SellLogDTO dto = new SellLogDTO();
						dto.setgName(rs.getString("goods_name"));
						dto.setgId(rs.getString("goods_id"));
						dto.setSleId(rs.getString("sle_id"));
						dto.setOrderQy(rs.getInt("order_qy"));
						dto.setoId(rs.getString("order_id"));
						dto.setUserId(rs.getString("user_id"));
						dto.setSetle_de(rs.getString("setle_de"));
						dto.setSetle_amount(rs.getInt("setle_amount"));
						byte[] encoded = Base64.encodeBase64(rs.getBytes("photo_file"));
						String base64Encoded = new String(encoded, "UTF-8");
						dto.setPhotoFile("data:image/jpg;base64, "+ base64Encoded);
						list.add(dto);												
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close();
				}
								
		return list;
					
	}
	
}
