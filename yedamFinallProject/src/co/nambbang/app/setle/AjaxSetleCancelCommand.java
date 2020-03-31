package co.nambbang.app.setle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.SetleDAO;

public class AjaxSetleCancelCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int orderId = Integer.parseInt(request.getParameter("order_group_no"));
		
		SetleDAO dao = new SetleDAO();
		dao.deleteOrders(id, orderId);
		
		return "ajax:";
		
	}

}
