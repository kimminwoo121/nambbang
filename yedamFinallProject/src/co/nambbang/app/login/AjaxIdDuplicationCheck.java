package co.nambbang.app.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.UsersDao;

public class AjaxIdDuplicationCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsersDao Dao = new UsersDao();
	
		int Check = Dao.idDuplicationCheck(request.getParameter("userid"));
		System.out.println("---"+request.getParameter("userid"));
		return "ajax:"+Check;
	}

}
