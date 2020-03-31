package co.nambbang.app.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.sellerDAO;
import co.nambbang.app.dto.sellerDTO;

public class SellerIdCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		sellerDAO dao = new sellerDAO();
		sellerDTO dto = new sellerDTO();
		
		int Check = dao.idDuplicationCheck(request.getParameter("sid"));
		System.out.println("---"+request.getParameter("sid"));
		System.out.println("check  "+Check);
		return "ajax:"+Check;
		
		//request.setAttribute("dto", dto);
	}
}
