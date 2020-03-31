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

public class AdminSellerCancelOkCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		AdminSellerManageDto dto = new AdminSellerManageDto(); 
		AdminDao dao = new AdminDao();
		AdminPagingDto pDto = new AdminPagingDto();
		
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		
		
		if(sDate != null && sDate.equals("")) {
			sDate = null;
		}
		if(eDate != null && eDate.equals("")) {
			eDate = null;
		}
		
		//dto 담기
		dto.setsCtg1(request.getParameter("ctg1"));
		dto.setsCtg2(request.getParameter("ctg2"));
		dto.setsName1(request.getParameter("s_word1"));		
		dto.setsName2(request.getParameter("s_word2"));
		dto.setsDate(sDate);
		dto.seteDate(eDate);				
		dto.setsStat1(request.getParameter("stat_chk1"));				
		dto.setSort(request.getParameter("sort"));
		
		System.out.println("cancelDto=========="+ dto);
		//페이징 변수  + 처리 
		int p = 1;
		String pa = request.getParameter("page");
		if(pa != null) {
			 p = Integer.parseInt(pa);
		}		
		int pageunit = Integer.parseInt(request.getParameter("pageCnt"));
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
		request.setAttribute("list", list);		 // 검색 결과 전달  List
		System.out.println("list=="+list);
		String path ="/AdminSellerCancel.ad";
		return path;
	}

}
