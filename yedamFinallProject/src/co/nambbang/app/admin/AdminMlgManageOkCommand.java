package co.nambbang.app.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminMlgSelectDto;
import co.nambbang.app.dto.AdminPagingDto;


public class AdminMlgManageOkCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String,Object> map = new HashMap<String, Object>();
		AdminMlgSelectDto dto = new AdminMlgSelectDto();		
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
		
		dto.setmName(request.getParameter("s_word1"));
		
		dto.setsDate(sDate);
		dto.seteDate(eDate);
		
		
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
		
		int totalrecord = dao.selectMlgManageCnt(dto);
		
		int lastPage = totalrecord / pageunit + ((totalrecord % pageunit > 0) ? 1: 0);
		
		pDto.setLastPage(lastPage);
		pDto.setTotalCnt(totalrecord); // 검색 결과 총 몇건인지 전달할 Dto
		
		request.setAttribute("pDto", pDto);		
		request.setAttribute("mDto", dto);		
		list = dao.AdminMlgManageSelect(dto);
		map = dao.AdminMlgManageStatus(dto);
		
		request.setAttribute("mlgStat", map); // 마일리지 증차감 메소드
		request.setAttribute("list", list);   // 마일리지 내역 검색 메소드
		
		String path ="/AdminMlgManage.ad";
		return path;
	}

}
