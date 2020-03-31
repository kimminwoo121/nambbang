package co.nambbang.app.goods;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;

public class RegisterGoodsForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("======== RegisterGoodsForm 진입!!!");
		
		//세션체크
		Map<String, Object> sessionMap = SessionCheck.checkSession(request);
		if(!(boolean)sessionMap.get("isSession") || !(boolean)sessionMap.get("isAuth")) {
			request.setAttribute("sessionMap", sessionMap);
			return (String)sessionMap.get("returnPage");
		}		
		
		return "/sellviews/regGoods.jsp";
		}

}
