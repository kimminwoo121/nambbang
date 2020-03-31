package co.nambbang.app.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.UsersDao;

public class AjaxLoginCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UsersDao Dao = new UsersDao();
		
		String id = request.getParameter("userid");
		String pw = request.getParameter("password");
		// 1 same not password login ok 3 id not exist
		int Check = Dao.isLoginCheck(id,pw);
		if(Check ==2) {
			Dao.insertConectlog(id);
			String userStatus = Dao.loginConectrSeCheck(id);
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			if(userStatus.equals("AD")) {
				session.setAttribute("CONECTR_SE","AD");//관리자
			}else if(userStatus.equals("SE")) {
				session.setAttribute("CONECTR_SE", "SE"); //판매자
			}else {
				session.setAttribute("CONECTR_SE", "US"); //회원
			}
			
		}
		return "ajax:" + Check;
		
	}

}
