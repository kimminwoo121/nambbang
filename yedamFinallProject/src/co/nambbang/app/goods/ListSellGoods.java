package co.nambbang.app.goods;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;

public class ListSellGoods implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("======== ListSellGoods 진입!!!");
		
		//세션체크
		Map<String, Object> sessionMap = SessionCheck.checkSession(request);
		if(!(boolean)sessionMap.get("isSession") || !(boolean)sessionMap.get("isAuth")) {
			request.setAttribute("sessionMap", sessionMap);
			return (String)sessionMap.get("returnPage");
		}		
		
		//세션생성
		HttpSession session = request.getSession();		
		
		SellGoodsDAO dao = new SellGoodsDAO();
		Paging paging = new Paging();
		
		try {
			Map<String, Object> param = Utils.getParameterMap(request);
			//현재 페이지 받기
			String curPageNo = (String)param.get("curPageNo");
			//페이징 블록처리
			if(curPageNo != null) {
				paging.makeBlock(Integer.parseInt(curPageNo));
			}else {
				paging.makeBlock(1);
			}			
			
			// 세션ID 설정
			param.put("id", session.getAttribute("id"));
			
			// 전체건수 조회
			int cnt = dao.selectSellGoodsCount(param);
			
			//페이징 마지막 페이지 구하기
			paging.makeLastPageNum(cnt);
			
			List<SellGoodsDTO> sellList = dao.selectSellGoodsList(param, paging.getFirst(), paging.getLast());
			
			request.setAttribute("sellList", sellList);
			request.setAttribute("paging", paging);
			
		}finally {
			dao.close();
		}
		
		
		return "/sellviews/listSellGoods.jsp";
		}

}
