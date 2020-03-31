package co.nambbang.app.setle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.SetleDAO;
import co.nambbang.app.dto.SetleDto;

public class AjaxSetleCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SetleDAO dao = new SetleDAO();
		SetleDto dto = new SetleDto();
		
		System.out.println(request.getParameter("merchant_uid"));
		
		Long setleNo = (Long.parseLong(request.getParameter("merchant_uid"))); //결제번호
		String orderMn = request.getParameter("pay_method");	//결제수단
		String setleConfmCode = request.getParameter("imp_uid"); //결제승인코드
		int setleAmount = (Integer.parseInt(request.getParameter("paid_amount"))); //결제금액
		int mlgUseAmount = (Integer.parseInt(request.getParameter("mlg_use_amount")));	//마일리지 사용금액
		int orderGroupNo = (Integer.parseInt(request.getParameter("order_group_no")));	//주문그룹 번호
		String orderTelno = request.getParameter("order_tel_no");//주문자 전화번호
		
		
		System.out.println("setleNo "+setleNo);
		System.out.println("orderMn "+orderMn);
		System.out.println("setleConfmCode "+setleConfmCode);
		System.out.println("setleAmount "+setleAmount);
		System.out.println("mlgUseAmount "+mlgUseAmount);
		System.out.println("orderGroupNo "+orderGroupNo);
		System.out.println("orderTelno "+orderTelno);
		
		dto.setSetleNo(setleNo);
		dto.setOrderMn(orderMn);
		dto.setSetleConfmCode(setleConfmCode);
		dto.setSetleAmount(setleAmount);
		dto.setMlgUseAmount(mlgUseAmount);
		dto.setOrderGroupNo(orderGroupNo);
		dto.setOrderTelno(orderTelno);
		
		String result = dao.insertSetle(dto);
		System.out.println("dao 결과값 " + result);
		
		return "ajax:" + result;
	}
}
