<%@page import="co.nambbang.app.goods.Paging"%>
<%@page import="co.nambbang.app.goods.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String imgPath = "sellviews";
	String jsPath = "sellviews";
	String cssPath = "sellviews";
%>
<html>
	<head>
	<title>상품목록</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Colo Shop Template">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/styles/bootstrap4/bootstrap.min.css">
	<link href="<%=cssPath %>/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" href="<%=cssPath %>/plugins/themify-icons/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/styles/contact_styles.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/styles/contact_responsive.css">
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="<%=jsPath %>/js/jquery-3.2.1.min.js"></script>
	
	
	<style type="text/css">
	</style>

	<script type="text/javascript">
		// 검색
		function searchGoods(){
			var frm = document.frm;
			frm.curPageNo.value = 1;
			frm.action = "listGoods.do";			
			frm.submit();
		}
		
		// 상세보기
		function goDetailGoods(goodsId){
			var frm = document.frm;
			frm.goods_id.value = goodsId;
			frm.action = "detailGoods.do";			
			frm.submit();			
		}
		
		// 페이징 처리
		function fnPagingSearch(curPageNo){
			var frm = document.frm;
			frm.curPageNo.value = curPageNo;
			frm.action = "listGoods.do";			
			frm.submit();	
		}
		
		
	</script>
</head>

<body>

<div class="super_container">

	<!-- Header -->
	<%@include file="../userviews/header.jsp" %>

	

	<form method="post" id="frm" name="frm">
	<input type="hidden" id="goods_id" name="goods_id"/>
	<input type="hidden" id="curPageNo" name="curPageNo" value="1"/>
	
	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="${pageContext.request.contextPath }/">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>상품판매내역</a></li>
					</ul>
				</div>

			</div>
		</div>


		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col">
						<div class="form-group">
							<!-- <label for="schGoodsId">상품ID</label> --> 
							<input type="text" class="form-control" id="schGoodsId" name="schGoodsId" value="${param.schGoodsId }" placeholder="상품ID"/>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<!-- <label for="schGoodsNm">상품명</label> --> 
							<input type="text" class="form-control" id="schGoodsNm" name="schGoodsNm" value="${param.schGoodsNm }" placeholder="상품명"/>
						</div>
					</div>
					<div class="col" >
						<div class="form-group">
							<a href="#" class="btn btn-success" onclick="searchGoods();">검색</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
					
				<table class="table table-hover table-bordered results mt-3 align-items-center">
					<thead class="thead-light">
						<tr class="text-center">							
							<th width="10%">상품 이미지</th>							
							<th>주문번호</th>							
							<th>상품명</th>
							<th>판매수량</th>
							<th>판매가격</th>
							<th>구매자</th>
							<th>판매시간</th>							
					  	</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${not empty list }">
						<c:forEach var="i" items="${list }">
								<tr>					
									<td class="align-middle text-center">
									<img src="${i.photoFile }" style="max-height:100%; max-width:100%">
									</td>
									<td class="align-middle text-center">${i.oId }</td>									
									<td class="align-middle text-center">${i.gName}</td>
									<td class="align-middle text-center">${i.orderQy}</td>
									<td class="align-middle text-center">${i.setle_amount}</td>
									<td class="align-middle text-center">${i.userId}</td>
									<td class="align-middle text-center">${i.setle_de}</td>																		
								</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
								<tr><td colspan="7" class="text-center">판매된 상품이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>

						

					</tbody>
				</table>
				<div class="pager mt-5">
<%-- <%
	//페이징 처리
	Paging paging = (Paging)request.getAttribute("paging");
	out.print(paging.printPaging("fnPagingSearch"));
%> --%>
				</div>  	
				 
				<div class="text-right mt-5">
					<!-- <a href="#" class="btn btn-primary" onclick="goRegistGoods();">상품등록</a>
					<a href="#" class="btn btn-success" onclick="goSellGoodsList();">상품판매보기</a> -->
				</div>
				</div>
			</div>
		</div>
</form>
		<%@include file="../userviews/footer.jsp" %>

</div>

<script src="<%=jsPath %>/styles/bootstrap4/popper.js"></script>
<script src="<%=jsPath %>/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=jsPath %>/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="<%=jsPath %>/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=jsPath %>/plugins/easing/easing.js"></script>
<script src="<%=jsPath %>/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="<%=jsPath %>/js/single_custom.js"></script>
</body>
</html>