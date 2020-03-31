package co.nambbang.app.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminChartDao;
import co.nambbang.app.dto.AdminSelngAnalysisDto;
import net.sf.json.JSONArray;

public class AdminAjaxGoodsAnalysisQyOkCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminSelngAnalysisDto dto = new AdminSelngAnalysisDto();

		AdminChartDao dao = new AdminChartDao();
								
		
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");						
		
		
		System.out.println("sDate==="+ sDate);
		System.out.println("eDate==="+ eDate);
		
		
		if(sDate != null && sDate.equals("")) {
			sDate = null;
		}
		if(eDate != null && eDate.equals("")) {
			eDate = null;
		}
		
		
		dto.setsDate(sDate);		
		dto.seteDate(eDate);
		
		List<Map<String,Object>> list = dao.goodsAnalysQy(dto);
		String chart = JSONArray.fromObject(list).toString();
		
//		List<Map<String,Object>> list2 = dao.goodsAnalysAmount(dto);
//		String chart2 = JSONArray.fromObject(list2).toString();
		
		System.out.println("chart == " + chart);

		
		String path = "ajax:" + chart;
		
		return path;		
	}

}
