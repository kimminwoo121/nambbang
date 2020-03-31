package co.nambbang.app.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.sellerDAO;
import co.nambbang.app.dto.sellerDTO;

public class BoardEdit implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		sellerDAO dao = new sellerDAO();
		sellerDTO dto = new sellerDTO();
		
		//dto = dao.boardEditSelect(Integer.parseInt(request.getParameter("id")));
		
		request.setAttribute("dto", dto);
		
		return "/sellerRegi/view/boardedit.jsp";
		
		
	}

}
