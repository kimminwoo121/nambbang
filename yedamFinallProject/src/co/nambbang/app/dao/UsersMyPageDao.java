package co.nambbang.app.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nambbang.app.dto.UsersMyPageDto;

public class UsersMyPageDao extends DAO {
	public ArrayList<UsersMyPageDto> myPageList(String id){
		
		ArrayList<UsersMyPageDto> list = new ArrayList<>();
		
//		String sql="SELECT PHOTO_NAME,"
//				+ "GOODS_NAME,"
//				+ "ORDER_QY,"
//				+ "SETLE_CODE,"
//				+ "SETLE_AMOUNT, "
//				+ "to_char(setle_de,'yy-mm-dd hh24:mi') setle_de,"
//				+ "ORDER_ID,"
//				+ "ORDER_GROUP_NO,"
//				+ "imglist.SLE_ID SLE_ID" 
//				+ " FROM " 
//				+ " (select c.sle_id SLE_ID,a.GOODS_NAME GOODS_NAME,c.sle_qy SLE_QY,c.SLE_PC SLE_PC," + 
//				" c.SLE_BEGIN_TIME SLE_BEGIN_TIME, c.SLE_END_TIME SLE_END_TIME," + 
//				" a.GOODS_CL GOODS_CL,a.NETPRC NETPRC" + 
//				" ,(select photo_file from photo_stre where photo_group_id = a.PHOTO_GROUP_ID and rownum = 1 ) as PHOTO_NAME" + 
//				" from GOODS_REGIST a, goods_sle c " + 
//				" where a.GOODS_ID = c.GOODS_ID) imglist," + 
//				" (select order_id,order_qy,sle_id,order_group_no,SETLE_CODE, setle_amount, setle_de " + 
//				" from ORDERS ord,(select se.ORDER_GROUP_NO ORDER_GROUP_NO_1,"
//								  + " SETLE_CODE, " 
//								  + " SETLE_AMOUNT, "
//								  + " SETLE_DE " +								  
//				"                 from SETLE se, ORDER_GROUP og" + 
//				"                 where se.ORDER_GROUP_NO =og.ORDER_GROUP_NO and user_id=?) seog  " + 
//				" where ord.ORDER_GROUP_NO = seog.ORDER_GROUP_NO_1) orderlist" + 
//				" where imglist.SLE_ID = orderlist.SLE_ID";
		String sql = "SELECT PHOTO_NAME, " + 
				"  imglist.GOODS_NAME, " + 
				"  ORDER_QY, " + 
				"  SETLE_CODE, " + 
				"  SETLE_AMOUNT, " + 
				"  TO_CHAR(setle_de,'yy-mm-dd hh24:mi') setle_de, " + 
				"  ORDER_ID, " + 
				"  ORDER_GROUP_NO, " + 
				"  imglist.SLE_ID SLE_ID, " + 
				"  sl.la, " + 
				"  sl.lo, " + 
				"  s.cmpnm " +
				"FROM " + 
				"  (SELECT c.sle_id SLE_ID, " + 
				"    a.GOODS_NAME GOODS_NAME, " + 
				"    c.sle_qy SLE_QY, " + 
				"    c.SLE_PC SLE_PC, " + 
				"    c.SLE_BEGIN_TIME SLE_BEGIN_TIME, " + 
				"    c.SLE_END_TIME SLE_END_TIME, " + 
				"    a.GOODS_CL GOODS_CL, " + 
				"    a.NETPRC NETPRC , " + 
				"    (SELECT photo_file  " + 
				"    FROM photo_stre " + 
				"    WHERE photo_group_id = a.PHOTO_GROUP_ID " + 
				"    AND rownum = 1 " + 
				"    ) AS PHOTO_NAME " + 
				"  FROM GOODS_REGIST a, " + 
				"    goods_sle c " + 
				"  WHERE a.GOODS_ID = c.GOODS_ID " + 
				"  ) imglist, " + 
				"  (SELECT order_id,  " + 
				"    order_qy,  " + 
				"    sle_id,  " + 
				"    order_group_no,  " + 
				"    SETLE_CODE,  " + 
				"    setle_amount,  " + 
				"    setle_de " + 
				"  FROM ORDERS ord,  " + 
				"    (SELECT se.ORDER_GROUP_NO ORDER_GROUP_NO_1,  " + 
				"      SETLE_CODE,  " + 
				"      SETLE_AMOUNT,  " + 
				"      SETLE_DE " + 
				"    FROM SETLE se,  " + 
				"      ORDER_GROUP og " + 
				"    WHERE se.ORDER_GROUP_NO =og.ORDER_GROUP_NO " + 
				"    AND user_id = ? " + 
				"    ) seog " + 
				"  WHERE ord.ORDER_GROUP_NO = seog.ORDER_GROUP_NO_1 " + 
				"  ) orderlist,  " + 
				"  seler_lcinfo sl,  " + 
				"  seler s,  " + 
				"  goods_sle gs,  " + 
				"  goods_regist gr " + 
				"WHERE imglist.SLE_ID = orderlist.SLE_ID " + 
				"and orderlist.sle_id = gs.sle_id " + 
				"and gs.goods_id = gr.goods_id " + 
				"and gr.seler_id = s.seler_id " + 
				"and s.seler_id = sl.seler_id";
		
		System.out.println("myPageSQL:"+ sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				if(rs.getBlob("PHOTO_NAME")==null) {
				}
				else {
					UsersMyPageDto dto = new UsersMyPageDto();
					dto.setGoodsName(rs.getString("GOODS_NAME"));
					dto.setOrderGroupNo(rs.getInt("ORDER_GROUP_NO"));
					dto.setOrderId(rs.getString("ORDER_ID"));
					dto.setOrderQy(rs.getString("ORDER_QY"));
					dto.setSetleCode(rs.getString("SETLE_CODE"));
					dto.setSetleDe(rs.getString("SETLE_DE"));
					dto.setSetleAmount(rs.getInt("SETLE_AMOUNT"));
					dto.setSleId(rs.getString("SLE_ID"));
					dto.setLa(rs.getDouble("la"));
					dto.setLo(rs.getDouble("lo"));
					dto.setCmpnm(rs.getString("cmpnm"));
					Blob blob = rs.getBlob("PHOTO_NAME");
					dto.setPhotoName(blob.getBytes(1, (int)blob.length()));
					list.add(dto);
					
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
}
