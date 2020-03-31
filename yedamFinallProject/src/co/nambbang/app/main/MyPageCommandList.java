package co.nambbang.app.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.UsersMyPageDao;
import co.nambbang.app.dto.UsersMyPageDto;

public class MyPageCommandList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 메인 화면 상품 리스트 출력
		UsersMyPageDao Dao = new UsersMyPageDao();
		String id = (String) request.getSession().getAttribute("id");
		System.out.println("MypageCommandList:  "+id);
						
		ArrayList<UsersMyPageDto> list = Dao.myPageList(id);
		
		for (int i = 0; i < list.size(); i++) {
			String imageString = new String(Base64.encodeBase64(list.get(i).getPhotoName()));
			String changeString = "data:image/jpg;base64, " + imageString;
			
			list.get(i).setPhotoString(changeString);
			
			if(list.get(i).getSetleCode().equals("SC")){//결제완료
				list.get(i).setSetleCode("결제완료");
			}else if(list.get(i).getSetleCode().equals("CR")) {//환불신청
				list.get(i).setSetleCode("환불신청");
			}else {//CC환불완료
				list.get(i).setSetleCode("환불완료");
			}
			

		}
		System.out.println("list:"+list);
		request.setAttribute("MyPageList", list);

		return "userviews/mypage.jsp";
	}
}