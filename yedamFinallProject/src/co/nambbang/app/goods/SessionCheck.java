package co.nambbang.app.goods;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionCheck {
	public static Map<String, Object> checkSession(HttpServletRequest request) {
		Map<String, Object> sessionMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String conectrSe = (String)session.getAttribute("CONECTR_SE");
		
		//세션체크
		if(id == null) {
			sessionMap.put("isSession", false);
			sessionMap.put("isAuth", false);
			sessionMap.put("returnMsg", "로그인 후 사용하시기 바랍니다.");
			sessionMap.put("returnPage", "/sellviews/checkSession.jsp");
		}else {
			//권한체크
			if(conectrSe != null) {
				if("AD".equals(conectrSe)) {
					//관리자
					sessionMap.put("isSession", true);
					sessionMap.put("isAuth", true);
				}else if("SE".equals(conectrSe)) {
					//판매자
					sessionMap.put("isSession", true);
					sessionMap.put("isAuth", true);				
				}else {
					//회원
					sessionMap.put("isSession", true);
					sessionMap.put("isAuth", false);
					sessionMap.put("returnMsg", "해당 페이지의 접근권한이 없습니다.");
					sessionMap.put("returnPage", "/sellviews/checkSession.jsp");				
				}
			}else {
				sessionMap.put("isSession", true);
				sessionMap.put("isAuth", false);
				sessionMap.put("returnMsg", "해당 페이지의 접근권한이 없습니다.");
				sessionMap.put("returnPage", "/sellviews/checkSession.jsp");
			}
		}
		
		return sessionMap;
	}
}
