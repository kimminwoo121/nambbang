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
import co.nambbang.app.dto.AdminUserDto;

public class AdminUserManageOkCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		AdminUserDto dto = new AdminUserDto();
		AdminPagingDto pDto = new AdminPagingDto();
		AdminDao dao = new AdminDao();
		
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		
		if(sDate != null && sDate.equals("")) {
			sDate = null;
		}
		if(eDate != null && eDate.equals("")) {
			eDate = null;
		}

		
		
		//dto 	
		dto.setuCtg1(request.getParameter("ctg1"));
		dto.setuName1(request.getParameter("s_word1"));
		dto.setuStat1(request.getParameter("stat_chk"));
		dto.setuStat2(request.getParameter("chk_age"));
		dto.setsDate(sDate);
		dto.seteDate(eDate);
		dto.setSort(request.getParameter("sort"));
		System.out.println(dto);
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
				
				int totalrecord = dao.selectUserCnt(dto);
				
				int lastPage = totalrecord / pageunit + ((totalrecord % pageunit > 0) ? 1: 0);
				
				pDto.setLastPage(lastPage);
				pDto.setTotalCnt(totalrecord); // 검색 결과 총 몇건인지 전달할 Dto
//				System.out.println("pDto=====" + pDto);
				request.setAttribute("pDto", pDto);		 // 페이징 값 전달 Dto
				request.setAttribute("uDto", dto);	 // 검색 조건 전달 Dto
//				System.out.println(dto);
				list = dao.selectUser(dto, pDto);
				request.setAttribute("list", list);		 // 검색 결과 전달  List
		
		
		String path = "/AdminUserManage.ad";
		return path;
	}

}
