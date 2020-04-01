	package co.nambbang.app.goods;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nambbang.app.common.Command;
import net.sf.json.JSONObject;

public class RegisterGoods implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("======== RegisterGoods 진입!!!");
		
		//세션체크
		Map<String, Object> sessionMap = SessionCheck.checkSession(request);
		if(!(boolean)sessionMap.get("isSession") || !(boolean)sessionMap.get("isAuth")) {
			request.setAttribute("sessionMap", sessionMap);
			return (String)sessionMap.get("returnPage");
		}
		
		//세션생성
		HttpSession session = request.getSession();
		
		//GoodsDAO 선언
		GoodsDAO dao = new GoodsDAO();
		
		//트랜잭션을 위한 자동커밋 끄기
		dao.setAutoCommit(false);
		
		//결과 리턴 Map 선언
		Map<String, Object> map = new HashMap<String, Object>();
		
		//파일업로드 실제 경로 구하기
		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile");

		// 한번에 올릴 수 있는 파일 용량 : 20M로 제한
		int maxSize = 1024 * 1024 * 20;
		
		//파일업로드 실제 경로 존재 체크
		File path = new File(uploadPath);
		if(!path.exists()){
			//경로가 없다면 생성
			path.mkdir();
		}
		try {
			//파일을 저장하기 위한 request 받기
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			//파라메터 출력해보기(확인용)
//			Enumeration<String> parameters = multi.getParameterNames();
//			while(parameters.hasMoreElements()) {
//				String pname = parameters.nextElement();
//				String pvalue = multi.getParameter(pname);
//				System.out.println("#pname = " + pname + " #pvalue = " + pvalue);
//			}
			
			//파일 저장
			@SuppressWarnings("unchecked")
			Enumeration<String> en = multi.getFileNames();
			
			String photoGroupId = dao.selectPhotoGroupId();
			// 사진그룹 등록
			GoodsDTO photoGroup = new GoodsDTO();
			photoGroup.setPhotoGroupId(photoGroupId);
			dao.insertPhotoGroup(photoGroup);
			
			while(en.hasMoreElements()) {
				//사진 등록
				GoodsDTO photo = new GoodsDTO();
				File file = multi.getFile(en.nextElement());
				photo.setPhotoName(file.getName());
				photo.setPhotoFile(FileUtils.readFileToByteArray(file));
				photo.setPhotoGroupId(photoGroupId);
				dao.insertPhoto(photo);
				//파일삭제(blob으로 저장한 파일은 삭제)
				file.delete();
				
			}

			//상품등록
			GoodsDTO goods = new GoodsDTO();
			goods.setGoodsId(multi.getParameter("goods_id"));
			goods.setGoodsName(multi.getParameter("goods_name"));
			goods.setGoodsInfo(multi.getParameter("goods_info"));
			goods.setGoodsCl(multi.getParameter("goods_cl"));
			goods.setNetprc(Integer.parseInt(multi.getParameter("netprc")));
			goods.setPhotoGroupId(photoGroupId);
			goods.setSelerId((String)session.getAttribute("id")); //세션값으로 대체 할 것
			dao.insertGoods(goods);
			
			//트랜잭션 커밋
			dao.commit();
			
			//성공!!
			map.put("result", "ok");
		}catch(Exception e) {
			System.out.println("======== RegisterGoods 실패!!!");
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
