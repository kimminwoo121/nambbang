package co.nambbang.app.goods;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dto.sellerDTO;

public class Single implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("======== Single 진입!!!");
		sellerDTO sDto = new sellerDTO();		
		Map<String, Object> param = Utils.getParameterMap(request);
						
		SellGoodsDAO sellDAO = new SellGoodsDAO();
		GoodsDAO goodsDAO = new GoodsDAO();
		
		SellGoodsDTO sell = sellDAO.selectSellGoodsDetail((String)param.get("sleId"));
		sDto = sellDAO.selectSelerLocation((String)param.get("sleId"));
		
		
		
		List<GoodsDTO> photoList = null;
		if(sell != null && sell.getPhotoGroupId() != null && sell.getPhotoGroupId().length() > 0) {
			photoList = goodsDAO.selectPhotoList(sell.getPhotoGroupId());
		}
		request.setAttribute("seller", sDto);
		request.setAttribute("sell", sell);
		request.setAttribute("photoList", photoList);
		
		return "/sellviews/single.jsp";
		}

}
