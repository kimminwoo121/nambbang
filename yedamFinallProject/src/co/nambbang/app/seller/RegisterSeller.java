package co.nambbang.app.seller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.sellerDAO;
import co.nambbang.app.dto.sellerDTO;
import net.sf.json.JSONObject;

public class RegisterSeller implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("======== RegisterGoods 진입!!!");
		//GoodsDAO 선언
		sellerDAO dao = new sellerDAO();
		//트랜잭션을 위한 자동커밋 끄기
		//트랜잭션을 위한 자동커밋 끄기
		dao.setAutoCommit(false);
		
		//결과 리턴 Map 선언
		Map map = new HashMap();
		
		//파일업로드 실제 경로 구하기
		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile");

		// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
		int maxSize = 1024 * 1024 * 10;
		
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
			Enumeration<String> en = multi.getFileNames();
			
			String photoGroupId = dao.selectPhotoGroupId();
			while(en.hasMoreElements()) {
				//사진 등록
				sellerDTO photo = new sellerDTO();
				File file = multi.getFile(en.nextElement());
				photo.setPhotoName(file.getName());
				photo.setPhotoFile(FileUtils.readFileToByteArray(file));
				photo.setPhotoGroupId(photoGroupId);
				dao.insertPhoto(photo);
				//파일삭제(blob으로 저장한 파일은 삭제)
				file.delete();
				
			}

			// 사진그룹 등록
			sellerDTO photoGroup = new sellerDTO();
			photoGroup.setPhotoGroupId(photoGroupId);
			dao.insertPhotoGroup(photoGroup);
			
			/*
			 * 상품등록 sellerDTO seller = new sellerDTO();
			 * seller.setId(multi.getParameter("seller_id"));
			 * seller.setSname(multi.getParameter("goods_name"));
			 * seller.setGoodsInfo(multi.getParameter("goods_info"));
			 * seller.setNetprc(Integer.parseInt(multi.getParameter("netprc")));
			 * seller.setPhotoGroupId(photoGroupId); seller.setSelerId("test"); //세션값으로 대체 할
			 * 것 dao.insertseller(seller);
			 */
			
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
