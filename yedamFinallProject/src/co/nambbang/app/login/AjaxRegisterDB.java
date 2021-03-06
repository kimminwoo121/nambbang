package co.nambbang.app.login;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.UsersDao;
import co.nambbang.app.dto.LoginInfoDto;
import co.nambbang.app.dto.UsersDto;

public class AjaxRegisterDB implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsersDao Dao=new UsersDao();
		UsersDto uDto = new UsersDto();
		
		String id = request.getParameter("userid");
		uDto.setUserId(id);
		uDto.setUserName(request.getParameter("username"));
		uDto.setUserMail(request.getParameter("email"));
		uDto.setUserTelNo(request.getParameter("usertel"));
		
		String Sbirth =request.getParameter("birth");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date =( Date)format.parse(Sbirth);
			uDto.setUserBirthdy(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		uDto.setUserSexDSTN(request.getParameter("gender"));
		Dao.insertRegister(uDto);
		
		
		Dao=new UsersDao();
		LoginInfoDto lDto=new LoginInfoDto();
		lDto.setId(id);
		lDto.setPassword(request.getParameter("password"));
		Dao.insertIdPw(lDto);
		Dao.insertMlg(id);

		return null ;
	}

}