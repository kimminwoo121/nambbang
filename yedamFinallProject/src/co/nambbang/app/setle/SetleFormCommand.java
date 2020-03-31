package co.nambbang.app.setle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.SetleDAO;
import co.nambbang.app.dto.SetleFormDTO;

public class SetleFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)			
			throws ServletException, IOException {
			SetleFormDTO dto = new SetleFormDTO();
			List<SetleFormDTO> list = new ArrayList<SetleFormDTO>();
			HttpSession session = request.getSession();
			
//			int groupno = (Integer.parseInt(request.getParameter("orderGroupNo")));
//		   	dto.setGoodsName(request.getParameter("g_name"));
			
			// user id, 판매 id, 구매수량 
							
			String id = (String)session.getAttribute("id"); 
			String sleId = request.getParameter("s_id");
		   	int orderQy = (Integer.parseInt(request.getParameter("q_value")));
		   	
	
			SetleDAO dao = new SetleDAO();
			// 주문 그룹,주문 ID 생성
		   	int orderId = dao.insertOrders(id, orderQy, sleId);
		   
		   	//결제 페이지에 입력받은 id ,주문그룹번호로 검색
		   	if(orderId != 0 )
		    list = dao.getSetleForm(id, orderId);
		   	
		   	request.setAttribute("list", list);
		   	request.setAttribute("groupno", orderId); 
			
		   	int mlg = (int) session.getAttribute("mlg");
		   	request.setAttribute("mlg",mlg);
			
		return "setle/setle.jsp";
	}

}
