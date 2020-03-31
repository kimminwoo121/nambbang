package co.nambbang.app.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.UsersDao;
import co.nambbang.app.dto.CertificationDto;

public class AjaxIdFindClick implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String cerNo = request.getParameter("Certification");
		
		UsersDao dao = new UsersDao();
		CertificationDto dto = dao.certificationCheck(email,cerNo);
		
		if(dto != null) {
			return "ajax:"+dto; //인증됨
		}else {
			return "ajax:"+0; //인증안됨
		}
		
	}

}
