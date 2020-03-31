package co.nambbang.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import co.nambbang.app.dto.AdminSelngAnalysisDto;

public class AdminChartDao extends DAO{

	public AdminChartDao(){
		super();
	}
	
	public List<Map<String,Object>> AnalysDay(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String and = " where 1=1 ";
		String and2 = " and 1=1 ";
		if(dto != null) {
			if(dto.getsDate() != null && dto.geteDate() != null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= ? ";
				and2 += " and s.setle_de >= ? ";
				and2 += " and setle_de <= ? ";
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= to_date(?,'yyyy-mm-dd')+7 ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= to_date(?,'yyyy-mm-dd')+7 ";
			}
		}
		
		String sql = " select amount.day,  amount.setle_profit, amount.setle_refnd, qy.order_qy " + 
				"    from  " + 
				"        ( " + 
				"        select to_char(setle_de ,'yyyy-mm-dd') day, " + 
				"        sum(case when setle_code = 'CC' then SETLE_AMOUNT else 0 end) setle_refnd, " + 
				"        sum(case when setle_code = 'SC' then SETLE_AMOUNT else 0 end) setle_profit " + 
				"        from setle "
						+ and + 				
				"        group by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        order by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        ) amount, " + 
				"        ( " + 
				"        select to_char(setle_de ,'yyyy-mm-dd') day, sum(o.order_qy) order_qy " + 
				"        from setle s, orders o " + 
				"        where  s.order_group_no = o.order_group_no "
						+ and2 +						
				"        and s.setle_code = 'SC' " + 
				"        group by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        order by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        ) qy " + 
				"  where amount.day = qy.day (+) " + 
				"  order by amount.day";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
			}
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("day", rs.getString("day"));
				map.put("profit", rs.getInt("setle_profit"));
				map.put("refnd", rs.getInt("setle_refnd"));
				map.put("order_qy", rs.getInt("order_qy"));
				list.add(map);
							
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public List<Map<String,Object>> AnalysWeek(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String and = " where 1=1 ";
		String and2 = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and setle_de >= ? ";
				and += " and setle_de <= ? ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= ? ";
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= to_date(?,'yyyy-mm-dd')+28 ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= to_date(?,'yyyy-mm-dd')+28 ";
			}
		}

		String sql = " select amount.week, amount.setle_profit, amount.setle_refnd, qy.order_qy " + 
				"    from " + 
				"        ( " + 
				"        select to_char(to_date(setle_de),'yy-mm/w') week, " + 
				"        sum(case when setle_code = 'CC' then SETLE_AMOUNT else 0 end) setle_refnd, " + 
				"        sum(case when setle_code = 'SC' then SETLE_AMOUNT else 0 end) setle_profit " + 
				"        from setle " + 
						 and +
				"        group by to_char(to_date(setle_de) ,'yy-mm/w') " + 
				"        order by to_char(to_date(setle_de),'yy-mm/w') " + 
				"        ) amount, " + 
				"        ( " + 
				"        select to_char(to_date(setle_de),'yy-mm/w') week, " + 
				"        sum(o.order_qy) order_qy " + 
				"        from setle s, orders o " + 
				"        where s.order_group_no = o.order_group_no " + 
						 and2 + 
				"        and s.setle_code = 'SC' " + 
				"        group by to_char(to_date(setle_de),'yy-mm/w') " + 
				"        order by to_char(to_date(setle_de),'yy-mm/w') " + 
				"        ) qy " + 
				"    where amount.week = qy.week (+) " + 
				"    order by amount.week";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
			}
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("week", rs.getString("week"));
				map.put("profit", rs.getInt("setle_profit"));
				map.put("refnd", rs.getInt("setle_refnd"));
				map.put("order_qy", rs.getInt("order_qy"));
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	public List<Map<String,Object>> AnalysMonth(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String and = " where 1=1 ";
		String and2 = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and setle_de >= ? ";
				and += " and setle_de <= ? ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= ? ";
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= to_date(sysdate,'yy-mm-dd') ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= to_date(sysdate,'yy-mm-dd') ";
			}
		}
		
		String sql ="  select amount.month,  amount.setle_profit, amount.setle_refnd, qy.order_qy " + 
				"     from " + 
				"    ( " + 
				"    select to_char(to_date(setle_de), 'yy-mm') month, " + 
				"    sum(case when setle_code = 'CC' then SETLE_AMOUNT else 0 end) setle_refnd, " + 
				"    sum(case when setle_code = 'SC' then SETLE_AMOUNT else 0 end) setle_profit " + 
				"    from setle " + 
					 and +
				"    group by to_char(to_date(setle_de) ,'yy-mm') " + 
				"    order by to_char(to_date(setle_de) ,'yy-mm') " + 
				"    ) amount, " + 
				"    ( " + 
				"    select to_char(to_date(setle_de), 'yy-mm') month, sum(o.order_qy) order_qy " + 
				"    from setle s, orders o " + 
				"    where s.order_group_no = o.order_group_no " + 
					 and2 +
				"    and s.setle_code = 'SC' " + 
				"    group by to_char(to_date(setle_de), 'yy-mm') " + 
				"    order by to_char(to_date(setle_de), 'yy-mm') " + 
				"    ) qy " + 
				"    where amount.month = qy.month (+) " + 
				"    order by amount.month"; 
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				
			}
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("month", rs.getString("month"));
				map.put("profit", rs.getInt("setle_profit"));
				map.put("refnd", rs.getInt("setle_refnd"));
				map.put("order_qy", rs.getInt("order_qy"));
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	//상품별 수량별 판매 통계 
	public List<Map<String,Object>> goodsAnalysQy(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();		
		String and = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and s.setle_de between ? and ? ";				
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {				
				and += " and s.setle_de between ? and sysdate ";
				
			}
		}
		
		String sql = "select rank_rn.rn, rank_rn.goods_name, rank_rn.qy_sum, round(ratio_to_report(rank_rn.qy_sum) over () * 100, 1) as percent " + 
				"from  " + 
				"    ( " + 
				"    select rownum rn, goods_qy_rank.goods_name, goods_qy_rank.qy_sum " + 
				"    from " + 
				"           ( select gr.goods_name, sum(o.order_qy) qy_sum " + 
				"            from orders o, goods_sle gs, goods_regist gr,setle s " + 
				"            where o.sle_id = gs.sle_id " + 
				"            and o.order_group_no = s.order_group_no " + 
				"            and gs.goods_id = gr.goods_id " + 
							 and +
				"            and s.setle_code = 'SC' " + 
				"            group by gr.goods_name " + 
				"            order by qy_sum desc " + 
				"            ) goods_qy_rank " + 
				"     ) rank_rn " + 
				"where rn between 1 and 10";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());								
			}
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("goods_name", rs.getString("goods_name"));
				map.put("qy_sum", rs.getInt("qy_sum"));
				map.put("percent", rs.getDouble("percent"));				
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//상품 판매금액별 판매 통계 
	public List<Map<String,Object>> goodsAnalysAmount(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();		
		String and = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and s.setle_de between ? and ? ";				
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {				
				and += " and s.setle_de between ? and sysdate ";
				
			}
		}
		
		String sql = "select rank_rn.rn, rank_rn.goods_name, rank_rn.amount_sum, round(ratio_to_report(rank_rn.amount_sum) over () * 100, 1) as percent " + 
				"from " + 
				"    ( " + 
				"    select rownum rn, goods_profit_rank.*  " + 
				"    from " + 
				"          ( " + 
				"            select gr.goods_name, sum(s.setle_amount) amount_sum " + 
				"            from orders o, goods_sle gs, goods_regist gr,setle s " + 
				"            where o.sle_id = gs.sle_id " + 
				"            and o.order_group_no = s.order_group_no " + 
				"            and gs.goods_id = gr.goods_id " + 
							 and +
				"            and s.setle_code = 'SC' " + 
				"            group by gr.goods_name " + 
				"            order by amount_sum desc " + 
				"          ) goods_profit_rank " + 
				"     ) rank_rn " + 
				"where rn between 1 and 10";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());								
			}
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("goods_name", rs.getString("goods_name"));
				map.put("amount_sum", rs.getInt("amount_sum"));
				map.put("percent", rs.getDouble("percent"));				
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 판매자 판매수량별 통계 
	public List<Map<String,Object>> sellerAnalysQy(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();		
		String and = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and s.setle_de between ? and ? ";				
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {				
				and += " and s.setle_de between ? and sysdate ";
				
			}
		}
	
		String sql = "select rank_rn.rn, rank_rn.cmpnm, rank_rn.order_qy, round(ratio_to_report(rank_rn.order_qy) over () * 100, 1) as percent " + 
				"from  " + 
				"    ( " + 
				"    select rownum rn, seler_qy_rank.*  " + 
				"    from " + 
				"          ( " + 
				"            select sr.cmpnm, sum(o.order_qy) order_qy " + 
				"            from orders o, goods_sle gs, goods_regist gr,setle s, seler sr " + 
				"            where o.sle_id = gs.sle_id " + 
				"            and o.order_group_no = s.order_group_no " + 
				"            and gs.goods_id = gr.goods_id " + 
				"            and gr.seler_id = sr.seler_id " + 
							 and +
				"            and s.setle_code = 'SC' " + 
				"            group by sr.cmpnm " + 
				"            order by order_qy desc " + 
				"        ) seler_qy_rank " + 
				"     ) rank_rn " + 
				"where rn between 1 and 10";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());								
			}
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("cmpnm", rs.getString("cmpnm"));
				map.put("order_qy", rs.getInt("order_qy"));
				map.put("percent", rs.getDouble("percent"));				
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	//판매자 판매금액별 통계
	public List<Map<String,Object>> sellerAnalysAmount(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();		
		String and = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and s.setle_de between ? and ? ";				
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {				
				and += " and s.setle_de between ? and sysdate ";
				
			}
		}
		
		String sql = "select rank_rn.rn, rank_rn.cmpnm, rank_rn.amount_sum, round(ratio_to_report(rank_rn.amount_sum) over () * 100, 1) as percent " + 
				" from " + 
				"    ( " + 
				"    select rownum rn, seler_profit_rank.* " + 
				"    from " + 
				"          ( " + 
				"            select sr.cmpnm, sum(s.setle_amount) amount_sum " + 
				"            from orders o, goods_sle gs, goods_regist gr,setle s, seler sr " + 
				"            where o.sle_id = gs.sle_id " + 
				"            and o.order_group_no = s.order_group_no " + 
				"            and gs.goods_id = gr.goods_id " + 
				"            and gr.seler_id = sr.seler_id " + 
							 and +
				"            and s.setle_code = 'SC' " + 
				"            group by sr.cmpnm " + 
				"            order by amount_sum desc " + 
				"        ) seler_profit_rank " + 
				"     ) rank_rn " + 
				"where rn between 1 and 10";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());								
			}
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("cmpnm", rs.getString("cmpnm"));
				map.put("amount_sum", rs.getInt("amount_sum"));
				map.put("percent", rs.getDouble("percent"));				
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}


