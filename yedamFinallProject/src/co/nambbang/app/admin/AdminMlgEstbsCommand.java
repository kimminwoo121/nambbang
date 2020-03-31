package co.nambbang.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminMlgDto;

public class AdminMlgEstbsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminMlgDto dto = new AdminMlgDto();
		AdminDao dao = new AdminDao();
				
		dto = dao.MlgSelect();
		
		request.setAttribute("mlgInfo", dto);
		
		
		
		String path = "/adminviews/mlgEstbs.jsp";
		return path;
	}

}
