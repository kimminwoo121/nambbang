package co.nambbang.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminMainDto;

public class AdminRefundCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminMainDto dto = new AdminMainDto();
		AdminDao dao = new AdminDao();
		dto = dao.selectAll();
		
		int refund = dto.getRefundCnt();
		
		request.setAttribute("refundCnt", refund);
		
		
		String path = "/adminviews/refund.jsp";
		return path;
	}

}
