package co.nambbang.app.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.admin.AdminAjaxGoodsAnalysisAmountOkCommand;
import co.nambbang.app.admin.AdminAjaxGoodsAnalysisQyOkCommand;
import co.nambbang.app.admin.AdminAjaxSellerAnalysisAmountOkCommand;
import co.nambbang.app.admin.AdminAjaxSellerAnalysisQyOkCommand;
import co.nambbang.app.admin.AdminAjaxSelngAnalysisDayOkCommand;
import co.nambbang.app.admin.AdminAjaxSelngAnalysisMonthOkCommand;
import co.nambbang.app.admin.AdminAjaxSelngAnalysisWeekOkCommand;
import co.nambbang.app.admin.AdminBbsNoticeManageCommand;
import co.nambbang.app.admin.AdminBbsReplyInsertCommand;
import co.nambbang.app.admin.AdminGoodsAnalysisCommand;
import co.nambbang.app.admin.AdminMainCommand;
import co.nambbang.app.admin.AdminMerchListCommand;
import co.nambbang.app.admin.AdminMerchListModifyCommand;
import co.nambbang.app.admin.AdminMerchListOkCommand;
import co.nambbang.app.admin.AdminMlgEstbsCommand;
import co.nambbang.app.admin.AdminMlgEstbsOkCommand;
import co.nambbang.app.admin.AdminMlgManageCommand;
import co.nambbang.app.admin.AdminMlgManageOkCommand;
import co.nambbang.app.admin.AdminNoticeInsertCommand;
import co.nambbang.app.admin.AdminRefundCommand;
import co.nambbang.app.admin.AdminRefundOkCommand;
import co.nambbang.app.admin.AdminSellerAnalysisCommand;
import co.nambbang.app.admin.AdminSellerCancelCommand;
import co.nambbang.app.admin.AdminSellerCancelOkCommand;
import co.nambbang.app.admin.AdminSellerManageCommand;
import co.nambbang.app.admin.AdminSellerManageOkCommand;
import co.nambbang.app.admin.AdminSelngAnalysisDayCommand;
import co.nambbang.app.admin.AdminSelngAnalysisMonthCommand;
import co.nambbang.app.admin.AdminSelngAnalysisWeekCommand;
import co.nambbang.app.admin.AdminSetleManageCommand;
import co.nambbang.app.admin.AdminSetleManageOkCommand;
import co.nambbang.app.admin.AdminUserManageCommand;
import co.nambbang.app.admin.AdminUserManageOkCommand;
import co.nambbang.app.goods.DeleteGoods;
import co.nambbang.app.goods.DetailGoods;
import co.nambbang.app.goods.DetailSellGoods;
import co.nambbang.app.goods.ListGoods;
import co.nambbang.app.goods.ListSellGoods;
import co.nambbang.app.goods.ModifyGoods;
import co.nambbang.app.goods.ModifySellGoods;
import co.nambbang.app.goods.RegisterGoods;
import co.nambbang.app.goods.RegisterGoodsForm;
import co.nambbang.app.goods.SellGoods;
import co.nambbang.app.goods.SellGoodsForm;
import co.nambbang.app.goods.SellLogManage;
import co.nambbang.app.goods.Single;
import co.nambbang.app.login.AjaxIdDuplicationCheck;
import co.nambbang.app.login.AjaxIdFindClick;
import co.nambbang.app.login.AjaxIdPwCheck;
import co.nambbang.app.login.AjaxLoginCheck;
import co.nambbang.app.login.AjaxRegisterDB;
import co.nambbang.app.main.MainCommandList;
import co.nambbang.app.main.MainCommandLogOut;
import co.nambbang.app.main.MainCommandLogin;
import co.nambbang.app.main.MyPageCommandList;
import co.nambbang.app.main.TotalShopCommandList;
import co.nambbang.app.seller.BoardList;
import co.nambbang.app.seller.BoardSellRegist;
import co.nambbang.app.seller.BoardWrite;
import co.nambbang.app.seller.BoardWriteOK;
import co.nambbang.app.seller.SellerEditCommand;
import co.nambbang.app.seller.SellerIdCheck;
import co.nambbang.app.seller.sellerEdit;
import co.nambbang.app.setle.AjaxSetleCancelCommand;
import co.nambbang.app.setle.AjaxSetleCommand;
import co.nambbang.app.setle.SetleFormCommand;

@WebServlet({"*.do","*.ad"}) 
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> cont = new HashMap<String, Command>();
	
	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		
		// 재흠
		cont.put("/AdminMain.ad", new AdminMainCommand());	//admin 메인페이지
		cont.put("/AdminMerchList.ad", new AdminMerchListCommand()); // admin 목록관리페이지 
		cont.put("/AdminMerchListOk.ad", new AdminMerchListOkCommand()); //admin 목록페이지 필터 검색 커맨드 		
		cont.put("/AdminMerchListModify.ad", new AdminMerchListModifyCommand()); //admin 목록 결과 상태적용 커맨드
		
		cont.put("/AdminSetleManage.ad", new AdminSetleManageCommand()); //admin 결제관리 페이지
		cont.put("/AdminSetleManageOk.ad", new AdminSetleManageOkCommand()); //admin 결제관리 페이지
		cont.put("/AdminRefund.ad", new AdminRefundCommand()); // 결제관리 - 환불 관리 페이지
		cont.put("/AdminRefundOk.ad", new AdminRefundOkCommand()); // 결제관리 - 환불 관리 검색 페이지
		
		cont.put("/AdminUserManage.ad", new AdminUserManageCommand()); // admin - 유저 관리 페이지
		cont.put("/AdminUserManageOk.ad", new AdminUserManageOkCommand()); // admin - 유저 관리 페이지
		
		cont.put("/AdminSellerManage.ad", new AdminSellerManageCommand()); // admin - 판매자 관리 페이지
		cont.put("/AdminSellerManageOk.ad", new AdminSellerManageOkCommand()); // admin - 판매자 관리 필터 검색 커맨드
		cont.put("/AdminSellerCancel.ad", new AdminSellerCancelCommand()); // admin - 판매자 판매 취소 관리 페이지
		cont.put("/AdminSellerCancelOk.ad", new AdminSellerCancelOkCommand()); // admin - 판매자 판매 취소 관리 페이지
		
		cont.put("/AdminMlgManage.ad", new AdminMlgManageCommand()); // admin - 마일리지 관리 페이지
		cont.put("/AdminMlgManageOk.ad", new AdminMlgManageOkCommand()); // admin - 마일리지 관리 페이지
		cont.put("/AdminMlgEstbs.ad", new AdminMlgEstbsCommand()); // admin - 마일리지 설정 페이지		
		cont.put("/AdminMlgEstbsOk.ad", new AdminMlgEstbsOkCommand()); // admin - 마일리지 설정 - 재설정 저장 
		
		cont.put("/AdminBbsNoticeManage.ad", new AdminBbsNoticeManageCommand()); // admin - 게시판 및 공지사항 관리 페이지
		cont.put("/AdminNoticeInsert.ad", new AdminNoticeInsertCommand()); // admin - 공지사항 글작성 폼
		cont.put("/AdminBbsReplyInsert.ad", new AdminBbsReplyInsertCommand()); // admin - QNA 답변 달기 폼
		
		cont.put("/AdminSelngAnalysisDay.ad", new AdminSelngAnalysisDayCommand()); // admin - 매출 통계 일별 페이지
		cont.put("/AdminAjaxSelngAnalysisDayOk.ad", new AdminAjaxSelngAnalysisDayOkCommand()); // admin - 매출 통계 일별 페이지
		cont.put("/AdminSelngAnalysisWeek.ad", new AdminSelngAnalysisWeekCommand()); // admin - 매출 통계 주별 페이지
		cont.put("/AdminAjaxSelngAnalysisWeekOk.ad", new AdminAjaxSelngAnalysisWeekOkCommand()); // admin - 매출 통계 주별 페이지
		cont.put("/AdminSelngAnalysisMonth.ad", new AdminSelngAnalysisMonthCommand()); // admin - 매출 통계 월별 페이지
		cont.put("/AdminAjaxSelngAnalysisMonthOk.ad", new AdminAjaxSelngAnalysisMonthOkCommand()); // admin - 매출 통계 월별 페이지
		
		
		cont.put("/AdminGoodsAnalysis.ad", new AdminGoodsAnalysisCommand()); // admin - 상품별 통계 분석 페이지
		cont.put("/AdminAjaxGoodsAnalysQyOk.ad", new AdminAjaxGoodsAnalysisQyOkCommand()); // admin - 상품 판매량별 분석 페이지 ajax
		cont.put("/AdminAjaxGoodsAnalysAmountOk.ad", new AdminAjaxGoodsAnalysisAmountOkCommand()); // admin - 상품 판매액합계별 통계 분석 페이지 ajax
		
		cont.put("/AdminSellerAnalysis.ad", new AdminSellerAnalysisCommand()); // admin - 판매자별 통계 분석 페이지
		cont.put("/AdminAjaxSellerAnalysQyOk.ad", new AdminAjaxSellerAnalysisQyOkCommand()); // admin - 판매자 판매량별 통계 분석 페이지 ajax
		cont.put("/AdminAjaxSellerAnalysAmountOk.ad", new AdminAjaxSellerAnalysisAmountOkCommand()); // admin - 판매자 판매액합계별 통계 분석 페이지 ajax
		
		
		//오용
		cont.put("/index.do",new MainCommandList());
		cont.put("/logIn.do", new MainCommandLogin());
		cont.put("/logOut.do", new MainCommandLogOut());
		cont.put("/totalShop.do", new TotalShopCommandList());
		cont.put("/myPage.do",new MyPageCommandList()); //mypage - 구매내역 
		cont.put("/ajaxLoginCheck.do",new AjaxLoginCheck());//login Check
		cont.put("/ajaxIdDuplicationCheck.do", new AjaxIdDuplicationCheck());//id Check
		cont.put("/ajaxRegisterDB.do",new AjaxRegisterDB());//register DB transport
		cont.put("/ajaxIdPwCheck.do", new AjaxIdPwCheck()); //email certification
		cont.put("/ajaxIdFindClick.do", new AjaxIdFindClick()); //idfindclick ;
		
		
		
		// 미영
		cont.put("/regGoodsForm.do", new RegisterGoodsForm()); // 상품등록
		cont.put("/regGoods.do", new RegisterGoods()); // 상품목록
		cont.put("/listGoods.do", new ListGoods()); // 상품상세
		cont.put("/detailGoods.do", new DetailGoods()); // 상품상세(수정)
		cont.put("/modifyGoods.do", new ModifyGoods()); // 상품삭제
		cont.put("/deleteGoods.do", new DeleteGoods()); // 상품판매 등록목록
		cont.put("/sellGoods.do", new SellGoods()); 
		cont.put("/sellGoodsForm.do", new SellGoodsForm());//판매할 상품 등록
		cont.put("/listSellGoods.do", new ListSellGoods()); //상품판매 정보보기
		cont.put("/detailSellGoods.do", new DetailSellGoods()); //상품판대 등록
		cont.put("/modifySellGoods.do", new ModifySellGoods()); //상품판대 수정		
		cont.put("/single.do", new Single()); //싱글페이지
		
		//재흠
		cont.put("/sellLogManage.do", new SellLogManage()); //판매내역 관리
		
		// 시현 sellerRegi/sellerindex.jsp
		cont.put("/boardSellRegist.do", new BoardSellRegist());
		cont.put("/boardWrite.do", new BoardWrite()); 
		cont.put("/boardWriteOK.do", new BoardWriteOK());
		cont.put("/boardlist.do", new BoardList());
		cont.put("/sellerEdit.do", new sellerEdit());
		cont.put("/sellerEditCommand.do", new SellerEditCommand());
		cont.put("/sellerIdCheck.do", new SellerIdCheck());
		
		
		// 민우
		cont.put("/ajaxSetle.do",new AjaxSetleCommand());
		cont.put("/SetleForm.do", new SetleFormCommand());
		cont.put("/ajaxSetleCancel.do", new AjaxSetleCancelCommand());
		

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		// 
		System.out.println("path= " + path);
		// 

		Command commandImpl = cont.get(path); // 
		String page = null;
		response.setContentType("text/html; charset=UTF-8"); // �

		if (commandImpl != null) {
			page = commandImpl.execute(request, response);
			if (page != null && !page.isEmpty()) {
				if (page.startsWith("redirect:")) {
					String view = page.substring(9);
					response.sendRedirect(view);
				} else if (page.startsWith("ajax:")) {
					response.getWriter().append(page.substring(5));
				} else if (page.startsWith("script:")) {
					response.getWriter().append("<script>").append(page.substring(7)).append("</script>");
				} else {
					request.getRequestDispatcher(page).forward(request, response);
				}
			}
		} else {
			
		}
	}
}
