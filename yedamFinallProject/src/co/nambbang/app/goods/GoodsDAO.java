package co.nambbang.app.goods;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import co.nambbang.app.dao.DAO;

public class GoodsDAO extends DAO {
	//상품목록
	
	public List<GoodsDTO> selectGoodsList(Map<String, Object> param, int startNo, int endNo) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();

		try {
			StringBuffer sql = new StringBuffer();
			
			sql.append("SELECT * FROM ( ");
			sql.append("    SELECT A.*, TO_CHAR(A.RGSDE, 'YYYY-MM-DD HH24:MI:SS') AS RGSDE_VIEW, ROW_NUMBER() OVER(ORDER BY GOODS_ID DESC) AS NUM ");
			sql.append("    	, (SELECT COUNT(*) FROM GOODS_SLE GS WHERE GS.GOODS_ID = A.GOODS_ID AND SYSDATE BETWEEN GS.SLE_BEGIN_TIME AND GS.SLE_END_TIME AND NOT EXISTS(SELECT SLE_ID FROM GOODS_CANCL WHERE SLE_ID = GS.SLE_ID )) AS SELL_CNT ");
			sql.append("    FROM GOODS_REGIST A ");
			sql.append("    WHERE 1=1 ");
			
			//id 추가
			if(param.get("id") != null && ((String)param.get("id")).length() > 0) {
				sql.append("and SELER_ID = '" + param.get("id") + "' ");
			}			
			//검색조건 추가
			if(param.get("schGoodsId") != null && ((String)param.get("schGoodsId")).length() > 0) {
				sql.append("and GOODS_ID like '" + param.get("schGoodsId") + "%' ");
			}
			if(param.get("schGoodsNm") != null && ((String)param.get("schGoodsNm")).length() > 0) {
				sql.append("and GOODS_NAME like '" + param.get("schGoodsNm") + "%' ");
			}
			sql.append(") WHERE NUM BETWEEN ");
			sql.append(startNo);
			sql.append("AND ");
			sql.append(endNo);
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(sql.toString());

			while (rs.next()) {
				GoodsDTO dto = new GoodsDTO();
				dto.setGoodsId(rs.getString("goods_id"));
				dto.setGoodsName(rs.getString("goods_name"));
				dto.setRgsdeView(rs.getString("rgsde_view"));
				dto.setNetprc(rs.getInt("netprc"));
				dto.setGoodsInfo(rs.getString("goods_info"));
				dto.setSelerId(rs.getString("seler_id"));
				dto.setPhotoGroupId(rs.getString("photo_group_id"));
				dto.setGoodsCl(rs.getString("goods_cl"));
				dto.setSellCnt(rs.getInt("sell_cnt"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return list;
	}

	public int selectGoodsCount(Map<String, Object> param) {
		int result = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			
			sql.append("    SELECT COUNT(*) AS CNT");
			sql.append("    FROM GOODS_REGIST A ");
			sql.append("    WHERE 1=1 ");
			
			//id 추가
			if(param.get("id") != null && ((String)param.get("id")).length() > 0) {
				sql.append("and SELER_ID = '" + param.get("id") + "' ");
			}
			//검색조건 추가
			if(param.get("schGoodsId") != null && ((String)param.get("schGoodsId")).length() > 0) {
				sql.append("and GOODS_ID like '" + param.get("schGoodsId") + "%' ");
			}
			if(param.get("schGoodsNm") != null && ((String)param.get("schGoodsNm")).length() > 0) {
				sql.append("and GOODS_NAME like '" + param.get("schGoodsNm") + "%' ");
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
	
	//상품상세
	public GoodsDTO selectGoodsDetail(String goodsId) {
		GoodsDTO dto = new GoodsDTO();

		try {
			String sql = "SELECT A.*, TO_CHAR(A.RGSDE, 'YYYY-MM-DD HH24:MI:SS') AS RGSDE_VIEW FROM GOODS_REGIST A WHERE A.GOODS_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodsId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setGoodsId(rs.getString("goods_id"));
				dto.setGoodsName(rs.getString("goods_name"));
				dto.setRgsdeView(rs.getString("rgsde_view"));
				dto.setNetprc(rs.getInt("netprc"));
				dto.setGoodsInfo(rs.getString("goods_info"));
				dto.setSelerId(rs.getString("seler_id"));
				dto.setPhotoGroupId(rs.getString("photo_group_id"));
				dto.setGoodsCl(rs.getString("goods_cl"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return dto;
	}	
	
	//사진목록
	public List<GoodsDTO> selectPhotoList(String photoGroupId) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		
		InputStream in = null;
		ByteArrayOutputStream baos = null;
		
		
		try {
			String sql = "select * from photo_stre where photo_group_id = ? order by photo_no asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, photoGroupId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsDTO dto = new GoodsDTO();
				dto.setPhotoNo(rs.getInt("photo_no"));
				dto.setPhotoName(rs.getString("photo_name"));
				dto.setWritngDe(rs.getDate("writng_de"));
				dto.setPhotoGroupId(rs.getString("photo_group_id"));
				
				//Blob 처리 시작!!
				// 바이너리 데이터를 저장하고 있는 컬럼으로부터 데이터를 가져온다
				in = rs.getBinaryStream("photo_file");
				// BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
				BufferedImage bimg = ImageIO.read(in);
				baos = new ByteArrayOutputStream();
				ImageIO.write(bimg, "jpg", baos);
				baos.flush();
				byte[] imageInByteArray = baos.toByteArray();
				String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
				dto.setPhotoFileBlob(b64);
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//열어준 IO반드시 종료시킨(처리중 exception 발생시에 io가 종료되지 않으므로 필수로 처리한다.
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(baos != null) {
				try {
					baos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	//사진그룹카운트
	public int selectPhotoGroupCount(String photoGroupId) {
		int result = 0;
		try {
			String sql = "select count(*) as cnt from photo_group where photo_group_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, photoGroupId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return result;
	}		
	
	//사진그룹ID조회
	public String selectPhotoGroupId() {
		String result = "";
		try {
			String sql = "select 'PHO' || lpad(nvl(max(to_number(REGEXP_REPLACE(photo_group_id, '[^0-9]+'))),0)+1, 10, '0') as photo_group_id from photo_group";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			while (rs.next()) {
				result = rs.getString("photo_group_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return result;
	}	
	
	//사진등록
	public int insertPhoto(GoodsDTO dto) throws Exception {
		int r = 0;
		try { 
			String sql = "insert into photo_stre(photo_no, photo_name, photo_file, writng_de, photo_group_id)"
					+" values((select nvl(max(photo_no),0)+1 from photo_stre),?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhotoName());
			pstmt.setBytes(2, dto.getPhotoFile());
			pstmt.setString(3, dto.getPhotoGroupId());
			r = pstmt.executeUpdate();
		 } catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}
	
	//사진삭제
	public int deletePhoto(GoodsDTO dto) throws Exception {
		int r = 0;
		try { 
			String sql = "delete from photo_stre where photo_group_id = ? ";
			if(dto.getPhotoNo() > 0) {
				sql += "and photo_no = ? ";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhotoGroupId());
			if(dto.getPhotoNo() > 0) {
				pstmt.setInt(2, dto.getPhotoNo());
			}
			r = pstmt.executeUpdate();
		 } catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}	
	
	//사진그룹등록
	public int insertPhotoGroup(GoodsDTO dto) throws Exception {
		int r = 0;
		try { 
			String sql = "insert into photo_group(photo_group_id, writng_de)"
					+" values(?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhotoGroupId());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}
	
	
	//사진삭제
	public int deletePhotoGroup(String PhotoGroupId) throws Exception {
		int r = 0;
		try { 
			String sql = "delete from photo_group where photo_group_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, PhotoGroupId);
			r = pstmt.executeUpdate();
		 } catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}		
	
	//상품등록
	public int insertGoods(GoodsDTO dto) throws Exception{
		int r = 0;
		try { 
			String sql = "insert into goods_regist(goods_id, goods_name, rgsde, netprc, goods_info, seler_id, photo_group_id, goods_cl)"
					+" values((SELECT 'REG' || lpad(nvl(max(to_number(REGEXP_REPLACE(goods_id, '[^0-9]+'))),0)+1, 10, '0') FROM goods_regist),?,sysdate,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, dto.getGoodsId());
			pstmt.setString(1, dto.getGoodsName());
			pstmt.setInt(2, dto.getNetprc());
			pstmt.setString(3, dto.getGoodsInfo());
			pstmt.setString(4, dto.getSelerId());
			pstmt.setString(5, dto.getPhotoGroupId());
			pstmt.setString(6, dto.getGoodsCl());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}
	
	//상품수정
	public int updateGoods(GoodsDTO dto) throws Exception{
		int r = 0;
		try { 
			String sql = "update goods_regist set "
					+" goods_name = ?, netprc = ?, goods_info = ?, goods_cl = ? "
					+" where goods_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getGoodsName());
			pstmt.setInt(2, dto.getNetprc());
			pstmt.setString(3, dto.getGoodsInfo());
			pstmt.setString(4, dto.getGoodsCl());
			pstmt.setString(5, dto.getGoodsId());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}
	
	//상품삭제
	public int deleteGoods(GoodsDTO dto) throws Exception{
		int r = 0;
		try { 
			String sql = "delete from goods_regist where goods_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getGoodsId());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		} 
		return r;
	}
}
	
