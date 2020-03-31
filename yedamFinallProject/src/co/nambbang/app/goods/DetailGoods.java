package co.nambbang.app.goods;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;

public class DetailGoods implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("======== DetailGoods 진입!!!");
		
		//세션체크
		Map<String, Object> sessionMap = SessionCheck.checkSession(request);
		if(!(boolean)sessionMap.get("isSession") || !(boolean)sessionMap.get("isAuth")) {
			request.setAttribute("sessionMap", sessionMap);
			return (String)sessionMap.get("returnPage");
		}		
		
		Map<String, Object> param = Utils.getParameterMap(request);
		GoodsDAO dao = new GoodsDAO();
		GoodsDTO goodsDetail = null;
		List<GoodsDTO> photoList = null;
		try {
			goodsDetail = dao.selectGoodsDetail((String)param.get("goods_id"));
			photoList = dao.selectPhotoList(goodsDetail.getPhotoGroupId());
		}finally {
			dao.close();
		}
		
		request.setAttribute("goodsDetail", goodsDetail);
		request.setAttribute("photoList", photoList);
		return "/sellviews/detailGoods.jsp";
		}

}
