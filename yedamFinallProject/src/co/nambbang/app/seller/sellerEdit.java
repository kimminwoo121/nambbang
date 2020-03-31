package co.nambbang.app.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.sellerDAO;
import co.nambbang.app.dto.sellerDTO;

public class sellerEdit implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		sellerDAO dao = new sellerDAO();
		sellerDTO dto = new sellerDTO();
		
		String id = (String)request.getSession().getAttribute("id");
		
		System.out.println("id :=============" + id);
		dto = dao.boardEditSelect(id);
		//dto = dao.boardEditSelect(request.getParameter("sid"));
		
		request.setAttribute("dto", dto);
		
		return "/sellerRegi/sellerEdit.jsp";
		
	}
}
