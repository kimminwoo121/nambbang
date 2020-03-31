package co.nambbang.app.goods;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;

public class DetailSellGoods implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("======== DetailSellGoods 진입!!!");
		Map<String, Object> param = Utils.getParameterMap(request);
		
		//세션체크
		Map<String, Object> sessionMap = SessionCheck.checkSession(request);
		if(!(boolean)sessionMap.get("isSession") || !(boolean)sessionMap.get("isAuth")) {
			request.setAttribute("sessionMap", sessionMap);
			return (String)sessionMap.get("returnPage");
		}		
		
		SellGoodsDAO dao = new SellGoodsDAO();
		GoodsDAO goodsDao = new GoodsDAO();
		SellGoodsDTO sellDetail = null;
		List<GoodsDTO> photoList = null;
		try {
			sellDetail = dao.selectSellGoodsDetail((String)param.get("sle_id"), (String)param.get("goods_id"));
			photoList = goodsDao.selectPhotoList(sellDetail.getPhotoGroupId());
		}finally {
			dao.close();
		}
		
		request.setAttribute("sellDetail", sellDetail);
		request.setAttribute("photoList", photoList);
		
		return "/sellviews/detailSellGoods.jsp";
		}

}
