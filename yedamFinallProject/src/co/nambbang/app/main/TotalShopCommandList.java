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

public class TotalShopCommandList implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GoodsSellDao Dao = new GoodsSellDao();
		HttpSession session = request.getSession();
		Double x = Double.parseDouble((String) session.getAttribute("x"));
		Double y = Double.parseDouble((String) session.getAttribute("y"));
		ArrayList<GoodsMainSellDto> list = Dao.mainList(x,y);
		
		for (int i = 0; i < list.size(); i++) {
			String imageString = new String(Base64.encodeBase64(list.get(i).getPhotoFile()));
			String changeString ="data:image/jpg;base64, "+imageString;
			list.get(i).setStringImage(changeString);
		}
			
		request.setAttribute("GoodsMain", list);
		return "userviews/totalshop.jsp";
	}
}
