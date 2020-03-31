package co.nambbang.app.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.GoodsSellDao;
import co.nambbang.app.dto.GoodsMainSellDto;

public class MainCommandList implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//메인 화면 상품 리스트 출력
		
		GoodsSellDao Dao = new GoodsSellDao();
		HttpSession session = request.getSession();		
		Double x,y;
		if(request.getParameter("x") != null) {
			x = Double.parseDouble(request.getParameter("x"));
			y = Double.parseDouble(request.getParameter("y"));
			session.setAttribute("x", x);
			session.setAttribute("y", y);
		}else {
			x = (Double)session.getAttribute("x");
			y = (Double)session.getAttribute("y");
		}

		System.out.println("x:"+ x);
		System.out.println("y:"+ y);
	
		
		ArrayList<GoodsMainSellDto> list = Dao.mainList(x,y);
		
		for (int i = 0; i < list.size(); i++) {
			String imageString = new String(Base64.encodeBase64(list.get(i).getPhotoFile()));
			String changeString ="data:image/jpg;base64, "+ imageString;
			list.get(i).setStringImage(changeString);
			
		}
			
		request.setAttribute("GoodsMain", list);
			return "userviews/index.jsp";
			
	}

}
