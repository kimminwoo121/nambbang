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
		
		uDto.setUserId(request.getParameter("userid"));
		uDto.setUserName(request.getParameter("username"));
		uDto.setUserMail(request.getParameter("email"));
		uDto.setUserTelNo(request.getParameter("usertel"));
		
		String Sbirth =request.getParameter("birth");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date =( Date)format.parse(Sbirth);
			uDto.setUserBirthdy(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		uDto.setUserSexDSTN(request.getParameter("gender"));
		Dao.insertRegister(uDto);//회원 테이블에 넣기
		
		
		Dao=new UsersDao();
		LoginInfoDto lDto=new LoginInfoDto();
		lDto.setId(request.getParameter("userid"));
		lDto.setPassword(request.getParameter("password"));
		Dao.insertIdPw(lDto); // 로그인 정보 테이블에 넣기

		return null ;
	}

}