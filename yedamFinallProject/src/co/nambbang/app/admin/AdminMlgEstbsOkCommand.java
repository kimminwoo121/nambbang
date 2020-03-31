package co.nambbang.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminMlgDto;

public class AdminMlgEstbsOkCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminMlgDto dto = new AdminMlgDto();
		AdminDao dao = new AdminDao();
		
		dto.setPercent(Integer.parseInt(request.getParameter("percent")));
		dto.setAmount(Integer.parseInt(request.getParameter("amount")));
		dto.setNewUser(Integer.parseInt(request.getParameter("newUser")));
		dto.setUseMlgAble(Integer.parseInt(request.getParameter("useMlgAble")));
					
		dao.AdminMlgUpdate(dto);		
		
		String path = "redirect:AdminMlgEstbs.ad";  //저장하면 다시 최신 정보 표시 
		
		return path;
	}

}
