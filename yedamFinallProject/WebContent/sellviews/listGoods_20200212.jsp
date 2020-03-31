<%@page import="co.nambbang.app.goods.Paging"%>
<%@page import="co.nambbang.app.goods.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	
	
	<style type="text/css">
	input[type=file] {
		display: none;
	}
	
	.my_button {
		display: inline-block;
		width: 200px;
		text-align: center;
		padding: 10px;
		background-color: #006BCC;
		color: #fff;
		text-decoration: none;
		border-radius: 5px;
	}
	
	.imgs_wrap {
		border: 2px solid #D4D4D4;
		margin-top: 30px;
		margin-bottom: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.imgs_wrap img {
		max-width: 150px;
		margin-left: 10px;
		margin-right: 10px;
	}
	</style>

	<script type="text/javascript">
		function searchGoods(){
			var frm = document.frm;
			frm.action = "listGoods.do";			
			frm.submit();
		}
		
		function goRegistGoods(){
			var frm = document.frm;
			frm.action = "regGoodsForm.do";			
			frm.submit();
		}
		
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
		
		function goSellGoods(goodsId){
			var frm = document.frm;
			frm.goods_id.value = goodsId;
			frm.action = "listSellGoods.do";			
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
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>상품목록</a></li>
					</ul>
				</div>

			</div>
		</div>


<%
	String goodsId = request.getParameter("goods_id");
	List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("goodsList") ;
%>
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col">
						<div class="form-inline form-group">
							<label for="goods_id" class="col-sm-4 control-label">상품ID</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="schGoodsId" name="schGoodsId" value="${param.schGoodsId }"/>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="form-inline form-group">
							<label for="goods_name" class="col-sm-4 control-label">상품명</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="schGoodsNm" name="schGoodsNm" value="${param.schGoodsNm }"/>
							</div>
						</div>
					</div>
					<div class="col">
						<a href="#" class="btn btn-success" onclick="searchGoods();">검색</a>
					</div>
				</div>			
				<div class="row mt-5 font-weight-bold">  
					<div class="col"></div>
					<div class="col">상품ID</div>
					<div class="col">상품분류</div>
					<div class="col">상품명</div>
					<div class="col">가격</div>
					<div class="col">등록일시</div>
					<div class="col">등록자</div>
					<div class="col"></div>
				</div>				
<%
	if(list != null && list.size() > 0){
		for(GoodsDTO goods : list){
%>

				<div class="row mt-1"> 
<%
			if(goods.getPhotoList() != null && goods.getPhotoList().size() > 0){
%>
					<div class="col"><img src="data:x-image/jpg;base64, <%=goods.getPhotoList().get(0).getPhotoFileBlob()%>" data-file="<%=goods.getPhotoList().get(0).getPhotoName()%>" class="img-responsive img-thumbnail" width="50%"></div>
<%
			}
%>					
					<div class="col align-self-center"><%=goods.getGoodsId() %></div>
					<div class="col align-self-center"><%=goods.getGoodsCl() %></div>
					<div class="col align-self-center"><%=goods.getGoodsName() %></div>
					<div class="col align-self-center"><%=goods.getNetprc() %></div>
					<div class="col align-self-center"><%=goods.getRgsdeView() %></div>
					<div class="col align-self-center"><%=goods.getSelerId() %></div>
					<div class="col text-center align-self-center">
						<div class="row">
							<a href="#" class="btn btn-secondary btn-sm" onclick="goDetailGoods('<%=goods.getGoodsId() %>');">보기</a>
							<a href="#" class="btn btn-info btn-sm ml-1" onclick="goSellGoods('<%=goods.getGoodsId() %>');">판매</a>
						</div>
					</div>
					<%-- <div class="col align-self-center"><a href="#" class="btn btn-secondary btn-sm" onclick="goDetailGoods('<%=goods.getGoodsId() %>');">상세보기</a></div> --%>
				</div>

<%
		}
	}else{
%>	
				<div class="row mt-1"> 
					<div class="col text-center">등록 된 상품이 없습니다.</div>
				</div>
<%
	}
%>

<div class="pager mt-5">
<%
	//페이징 처리
	Paging paging = (Paging)request.getAttribute("paging");
	out.print(paging.printPaging("fnPagingSearch"));
%>
</div>  	
				 
				<div class="text-right mt-5">
					<a href="#" class="btn btn-primary" onclick="goRegistGoods();">상품등록</a>
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