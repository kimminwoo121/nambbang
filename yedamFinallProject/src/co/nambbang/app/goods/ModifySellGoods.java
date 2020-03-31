package co.nambbang.app.goods;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;

public class ModifySellGoods implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("======== ModifySellGoods 진입!!!");
		
		//세션체크
		Map<String, Object> sessionMap = SessionCheck.checkSession(request);
		if(!(boolean)sessionMap.get("isSession") || !(boolean)sessionMap.get("isAuth")) {
			request.setAttribute("sessionMap", sessionMap);
			return (String)sessionMap.get("returnPage");
		}		
		
		Map<String, Object> param = Utils.getParameterMap(request);
		
		SellGoodsDAO dao = new SellGoodsDAO();
		SellGoodsDTO sell = null;
		
		String sleId = (String)param.get("sle_id");
		String goodsId = (String)param.get("goods_id");
		String sleQy = (String)param.get("sle_qy");
		String slePc = (String)param.get("sle_pc");
		String goosSleResult = (String)param.get("goos_sle_result");
		
		try {
			dao.setAutoCommit(false);
			sell = new SellGoodsDTO();
			sell.setSleId(sleId);
			sell.setGoodsId(goodsId);
			sell.setSleQy(Integer.parseInt(sleQy));
			sell.setSlePc(Integer.parseInt(slePc));
			String mnfcturDe = (String)param.get("mnfctur_de") + param.get("mnfctur_hh") + param.get("mnfctur_mm") + param.get("mnfctur_ss");
			sell.setMnfcturDe(mnfcturDe);
			sell.setSleBeginTime((String)param.get("sle_begin_time_hh") + param.get("sle_begin_time_mm") + "00");
			sell.setSleEndTime((String)param.get("sle_end_time_hh") + param.get("sle_end_time_mm") + "00");
			sell.setGoosSleResult(goosSleResult);
			
			dao.updateSellGoods(sell);
			//판매 취소 처리
			if("C".equals(goosSleResult)) {
				sell.setCanclResn((String)param.get("cancl_resn"));
				dao.cancelSellGoods(sell);
			}
			
			dao.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			dao.rollback();
			e.printStackTrace();
		}finally {
			dao.setAutoCommit(true);
			dao.close();
		}
		
		request.setAttribute("result", "modifyOk");
		
		return "/sellviews/detailSellGoods.jsp";
		}

}
