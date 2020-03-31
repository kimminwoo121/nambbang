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
import co.nambbang.app.dto.AdminMlgSelectDto;
import co.nambbang.app.dto.AdminPagingDto;

public class AdminMlgManageCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String,Object> map = new HashMap<String, Object>();
		AdminMlgSelectDto dto = new AdminMlgSelectDto();		
		AdminDao dao = new AdminDao();
		AdminPagingDto pDto = new AdminPagingDto();
		
						
		dto.setmName(null);		
		dto.setsDate(null);
		dto.seteDate(null);
		
		
		//페이징 변수  + 처리 
		int p = 1;		
		int pageunit = 10;
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
		
		
		String path = "/adminviews/mlgManage.jsp";
		return path;
	}

}
