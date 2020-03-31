package co.nambbang.app.goods;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class Utils {
	public static Map<String, Object> getParameterMap(HttpServletRequest request) {
		// 파라미터 이름
		Enumeration<String> paramNames = request.getParameterNames();

		// 저장할 맵
		Map<String, Object> paramMap = new HashMap<String, Object>();

		// 맵에 저장
		while (paramNames.hasMoreElements()) {
			String name = paramNames.nextElement().toString();
			String value = request.getParameter(name);

			paramMap.put(name, value);
		}

		// 결과반환
		return paramMap;
	}
}
