package co.nambbang.app.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminPagingDto;
import co.nambbang.app.dto.AdminSellerManageDto;

public class AdminSellerCancelCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		AdminSellerManageDto dto = new AdminSellerManageDto();
		AdminDao dao = new AdminDao();
		AdminPagingDto pDto = new AdminPagingDto();
		
		int cancel = dao.sellerCancleCnt();		
		request.setAttribute("cancelCnt", cancel);
		
		dto.setsCtg1("seler_id");
		dto.setsCtg2("goods_name");				
		dto.setsStat1("R");
		dto.setsDate(null);
		dto.seteDate(null);
		dto.setSort("gs.rgsde desc");
		
		int p = 1;		
		int pageunit = 10;
		int start = (p-1) * pageunit + 1; // 1 -> 1, 3
		int end = start + pageunit - 1;  // 2-> 4, 6
		pDto.setStart(start);		
		pDto.setEnd(end);		
		pDto.setPageUnit(pageunit);		
		int totalrecord = dao.AdminSellerCancelSelectCnt(dto);
		int lastPage = totalrecord / pageunit + ((totalrecord % pageunit > 0) ? 1: 0);		
		pDto.setLastPage(lastPage);
		pDto.setTotalCnt(totalrecord); // 검색 결과 총 몇건인지 전달할 Dto

		request.setAttribute("pDto", pDto);		 // 페이징 값 전달 Dto
		request.setAttribute("scDto", dto);	 // 검색 조건 전달 Dto
		list = dao.AdminSellerCancelSelect(dto, pDto);
		request.setAttribute("list", list);
		
		String path = "/adminviews/sellercancel.jsp";
		return path;
	}

}
