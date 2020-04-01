package co.nambbang.app.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.UsersDao;

public class MainCommandLogin implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsersDao dao = new UsersDao();
						
		String id = request.getParameter("userid");		
		int mlg = dao.getMlg(id);
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("mlg", mlg);
		
		session.setMaxInactiveInterval(-1);
		
		System.out.println("id = " + id);
		System.out.println("mlg = " + mlg);
		
		
		return "redirect:"+"index.do";
	}

}
