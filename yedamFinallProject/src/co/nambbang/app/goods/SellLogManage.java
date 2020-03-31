package co.nambbang.app.goods;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;

public class SellLogManage implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<SellLogDTO> list = new ArrayList<SellLogDTO>();
		SellGoodsDAO dao = new SellGoodsDAO();
		SellLogDTO dto = new SellLogDTO();
				
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		list = dao.sellLogList(id);
		
		request.setAttribute("list", list);
										
		
		return "/sellviews/SellLog.jsp";
	}

}
