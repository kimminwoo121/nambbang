package co.nambbang.app.goods;

public class CommonUtils {
	//시 출력
	public static String printHourList() {
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<24; i++){
			sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"시</option>");
		}
		
		return sb.toString(); 
	}
	
	//분 출력
	public static String printMinuteList() {
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<60; i++){
			sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"분</option>");
		}
		
		return sb.toString(); 
	}
	
	//초 출력
	public static String printSecondList() {
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<60; i++){
			sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"초</option>");
		}
		
		return sb.toString(); 
	}
	//시 출력
	public static String printHourList(String value) {
		StringBuffer sb = new StringBuffer();
		int val = Integer.parseInt(value);
		
		for(int i=0; i<24; i++){
			if(i == val) {
				sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"' selected='selected'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"시</option>");				
			}else {
				sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"시</option>");
			}
		}
		
		return sb.toString(); 
	}
	
	//분 출력
	public static String printMinuteList(String value) {
		StringBuffer sb = new StringBuffer();
		int val = Integer.parseInt(value);
		
		for(int i=0; i<60; i++){
			if(i == val) {
				sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"' selected='selected'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"분</option>");				
			}else {
				sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"분</option>");
			}			
		}
		
		return sb.toString(); 
	}
	
	//초 출력
	public static String printSecondList(String value) {
		StringBuffer sb = new StringBuffer();
		int val = Integer.parseInt(value);
		
		for(int i=0; i<60; i++){
			if(i == val) {
				sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"'' selected='selected'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"초</option>");				
			}else {
				sb.append("<option value='" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"'>" + (String.valueOf(i).length() == 1 ? "0" + i : i) +"초</option>");
			}			
		}
		
		return sb.toString(); 
	}
}
