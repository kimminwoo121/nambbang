package co.nambbang.app.goods;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nambbang.app.common.Command;
import net.sf.json.JSONObject;

public class DeleteGoods implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("======== DeleteGoods 진입!!!");

		//세션체크
		Map<String, Object> sessionMap = SessionCheck.checkSession(request);
		if(!(boolean)sessionMap.get("isSession") || !(boolean)sessionMap.get("isAuth")) {
			request.setAttribute("sessionMap", sessionMap);
			return (String)sessionMap.get("returnPage");
		}
		
		//GoodsDAO 선언
		GoodsDAO dao = new GoodsDAO();
	
		//트랜잭션을 위한 자동커밋 끄기
		dao.setAutoCommit(false);
		
		//결과 리턴 Map 선언
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			//파라메터 출력해보기(확인용)
			Enumeration<String> parameters = request.getParameterNames();
			while(parameters.hasMoreElements()) {
				String pname = parameters.nextElement();
				String pvalue = request.getParameter(pname);
				System.out.println("#pname = " + pname + " #pvalue = " + pvalue);
			}
			//파일업로드 실제 경로 구하기
			String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile");
			// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
			int maxSize = 1024 * 1024 * 10;
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			String photoGroupId = multi.getParameter("photo_group_id");
			String goodsId = multi.getParameter("goods_id");
			
			System.out.println("# photoGroupId : " + photoGroupId + " , goodsId = " + goodsId);
			 
			//사진그룹삭제
			dao.deletePhotoGroup(photoGroupId);
			
			//사진삭제
			GoodsDTO photo = new GoodsDTO();
			photo.setPhotoGroupId(photoGroupId);
			dao.deletePhoto(photo);
			
			//상품삭제
			GoodsDTO goods = new GoodsDTO();
			goods.setGoodsId(goodsId);
			dao.deleteGoods(goods);
			
			//트랜잭션 커밋
			dao.commit();
			
			//성공!!
			map.put("result", "ok");
		}catch(Exception e) {
			System.out.println("======== DeleteGoods 실패!!!");
			e.printStackTrace();
			//실패!!
			map.put("result", "error");
			//트랜잭션 롤백
			dao.rollback();
			//자동커밋켜기
			dao.setAutoCommit(true);
		}finally {
			dao.close();
		}
		
		return "ajax:" + JSONObject.fromObject(map);
	}

}
