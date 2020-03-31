package co.nambbang.app.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.sellerDAO;
import co.nambbang.app.dto.sellerDTO;

public class SellerEditCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n = 0;
		sellerDTO dto = new sellerDTO();
		sellerDAO dao = new sellerDAO();
		
		dto.setSid(request.getParameter("sid"));
		dto.setPw(request.getParameter("pw"));
		dto.setOpen(request.getParameter("open"));
		dto.setClose(request.getParameter("close"));
		dto.setSname(request.getParameter("sname"));
		dto.setLc(request.getParameter("lc"));
		dto.setName(request.getParameter("name"));
		dto.setNo(request.getParameter("no"));
		dto.setPhoto(request.getParameter("photo"));
		dto.setSns(request.getParameter("sns"));
		dto.setIntrcn(request.getParameter("intrcn"));
		dto.setStatus(request.getParameter("status"));
		dto.setGrade(request.getParameter("grade"));
		
		try {
			n = dao.update(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String path = null;
		if (n != 0) {
			return "redirect:index.do"; // 성공시 목록 보여주기
		} else {
			
			return "redirect:sellerEdit.do"; // 실패시 실패 페이지 보여주기

		}
	
	}

}

