package co.nambbang.app.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminMainDto;
import co.nambbang.app.dto.NoticeDto;

public class AdminMainCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();
		AdminMainDto dto = new AdminMainDto();
		NoticeDto nDto = new NoticeDto();
		AdminDao dao = new AdminDao();
		
		dto = dao.selectAll();
		list = dao.NselectAll();
		
		int cnt = dto.getUserCnt() + dto.getSelerCnt();		
		dto.setCustomerCnt(cnt);
		
		request.setAttribute("dto", dto); // 메인 화면 카운트 데이터
		request.setAttribute("list", list); // 공지사항 데이터 
		
		
		String path = "/adminviews/adminMain.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

		return null;
	}

}
