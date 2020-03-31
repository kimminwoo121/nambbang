package co.nambbang.app.seller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.sellerDAO;
import co.nambbang.app.dto.sellerDTO;

public class BoardList implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		sellerDAO dao = new sellerDAO();
		ArrayList<sellerDTO> list = new ArrayList<>();
		list = dao.select();  
		
		request.setAttribute("list", list);
		return "/sellerRegi/view/boardlist.jsp";
	
	
	}
}
