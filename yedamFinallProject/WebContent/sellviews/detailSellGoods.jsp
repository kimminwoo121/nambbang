<%@page import="co.nambbang.app.goods.SellGoodsDTO"%>
<%@page import="co.nambbang.app.goods.CommonUtils"%>
<%@page import="co.nambbang.app.goods.Paging"%>
<%@page import="co.nambbang.app.goods.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String imgPath = "/yedamFinallProject/sellviews";
	String jsPath = "/yedamFinallProject/sellviews";
	String cssPath = "/yedamFinallProject/sellviews";
%>
<html>
	<head>
	<title>상품판매 상세</title>
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
	<%-- <link rel="stylesheet" type="text/css" href="<%=cssPath %>/plugins/jquery-ui-1.12.1.custom/jquery-ui.css"> --%>
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/styles/contact_styles.css">
	<link rel="stylesheet" type="text/css" href="<%=cssPath %>/styles/contact_responsive.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
			
 	<script src="<%=jsPath %>/js/jquery-3.2.1.js"></script>
 	<script src="<%=jsPath %>/js/jquery-ui.js"></script>
	<script src="<%=jsPath %>/styles/bootstrap4/popper.js"></script>
	<script src="<%=jsPath %>/styles/bootstrap4/bootstrap.min.js"></script>
  	<script src="<%=jsPath %>/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="<%=jsPath %>/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="<%=jsPath %>/plugins/easing/easing.js"></script>
	<script src="<%=jsPath %>/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="<%=jsPath %>/js/single_custom.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="<%=jsPath %>/js/datepicker-ko.js"></script>
	<style type="text/css">
	</style>

	<script type="text/javascript">
      if("${result}" == "modifyOk"){
    	  alert("상품판매가 수정되었습니다.");
    	  location.href = "/yedamFinallProject/listSellGoods.do";
      }
	</script>

	<script type="text/javascript">
	    $(document).ready(function(){
	      $('.slider').bxSlider();
	      
	      $("#mnfctur_de").datepicker();
	      
	      fnCancelDisplay("${sellDetail.goosSleResult }", "load");
	    });
	    
	    function fnCancelSellGoods(){
	    	var frm = document.frm;
	    	if(confirm("상품판매를 취소 하시겠습니까?")){
		    	//validation 추가할것
	    		frm.action = "cancelSellGoods.do";

		    	frm.submit();
	    	}
	    }	    
	    
	    function fnModifySellGoods(){
	    	if('${sellDetail.goosSleResult}' == 'C'){
	    		alert("판매취소 된 건은 수정할 수 없습니다.");
	    		return;
	    	}
	    	
	    	if(confirm("상품판매를 수정 하시겠습니까?")){
		    	//validation 추가할것
	    		frm.action = "modifySellGoods.do";

		    	frm.submit();
	    	}
	    }
	    
	    function fnCancelDisplay(val, load){
	    	if("C" == val){
	    		$("#canclResnTr").show();
	    		if("load" == load){
		    		$("#canclDeTr").show();
	    		}
	    	}else{
	    		$("#canclResnTr").hide();
	    		if("load" == load){
		    		$("#canclDeTr").hide();
	    		};
	    	}
	    }
	    
	</script>
</head>

<body>

<div class="super_container">

	<!-- Header -->
	<%@include file="../userviews/header.jsp" %>
	

	<form method="post" id="frm" name="frm">
	<input type="hidden" id="sle_id" name="sle_id" value="${param.sle_id }"/>
	<input type="hidden" id="goods_id" name="goods_id" value="${param.goods_id }"/>
	<input type="hidden" id="curPageNo" name="curPageNo" value="1"/>
	
	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>상품판매 상세</a></li>
					</ul>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col">

				<table class="table table-bordered">
					<tbody>
						<tr>
							<td rowspan="14" style="width: 20%;">
								<div class="slider">
<%
			SellGoodsDTO detail = (SellGoodsDTO)request.getAttribute("sellDetail");
			if(detail == null) detail = new SellGoodsDTO();
			List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("photoList");
			if(list != null && list.size() > 0){
				for(GoodsDTO dto : list){
%>
          							<div><img src="data:x-image/jpg;base64, <%=dto.getPhotoFileBlob()%>" data-file='<%=dto.getPhotoName()%>' class='img-responsive' title='사진'></div>
<%
				}
			}else{
%>          
									<div><img src="<%=imgPath %>/images/no_images.png" class="img-responsive img-thumbnail" alt="no Image" /></div>		
<%
			}
%>					
								</div>
							</td>
						</tr>
						<tr>
							<th class="table-secondary">판매ID</th>
							<td>${sellDetail.sleId }</td>
						</tr>						
						<tr>
							<th class="table-secondary">상품ID</th>
							<td>${sellDetail.goodsId }</td>
						</tr>						
						<tr>
							<th class="table-secondary" style="width: 20%;">상품명</th>
							<td class="success">${sellDetail.goodsName }</td>
						</tr>
						<tr>
							<th class="table-secondary">상품분류</th>
							<td>${sellDetail.goodsCl }</td>
						</tr>
						<tr>
							<th class="table-secondary">정가</th>
							<td>${sellDetail.netprc }</td>
						</tr>
						<tr>
							<th class="table-secondary">상품정보</th>
							<td>${sellDetail.goodsInfo }</td>
						</tr>
						<tr>
							<th class="table-secondary">판매수량</th>
							<td><input type="text" class="form-control" id="sle_qy" name="sle_qy" value="${sellDetail.sleQy }"/></td>
						</tr>
						<tr>
							<th class="table-secondary">판매가격</th>
							<td><input type="text" class="form-control" id="sle_pc" name="sle_pc" value="${sellDetail.slePc }"/></td>
						</tr>
						<tr>
							<th class="table-secondary">제조일</th>
							<td>
								<div class="form-inline form-group">
									<input type="text" class="form-control" id="mnfctur_de" name="mnfctur_de" value="${sellDetail.mnfcturDeYmd }" readonly="readonly"/>
									<select class="form-control" id="mnfctur_hh" name="mnfctur_hh">
										<%=CommonUtils.printHourList(detail.getMnfcturDeHh() != null ? detail.getMnfcturDeHh() : "0")%>
									</select>
									<select class="form-control" id="mnfctur_mm" name="mnfctur_mm">
										<%=CommonUtils.printMinuteList(detail.getMnfcturDeMm() != null ? detail.getMnfcturDeMm() : "0")%>	
									</select>
									<select class="form-control" id="mnfctur_ss" name="mnfctur_ss">
										<%=CommonUtils.printSecondList(detail.getMnfcturDeSs() != null ? detail.getMnfcturDeMm() : "0")%>	
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th class="table-secondary">판매시간</th>
							<td>
								<div class="form-inline form-group">
								<select class="form-control" id="sle_begin_time_hh" name="sle_begin_time_hh">
									<%=CommonUtils.printHourList(detail.getSleBeginTimeHh() != null ? detail.getSleBeginTimeHh() : "0")%>		
								</select>
								<select class="form-control" id="sle_begin_time_mm" name="sle_begin_time_mm">
									<%=CommonUtils.printMinuteList(detail.getSleBeginTimeMm() != null ? detail.getSleBeginTimeMm() : "0")%>	
								</select>
								-
								<select class="form-control" id="sle_end_time_hh" name="sle_end_time_hh">
									<%=CommonUtils.printHourList(detail.getSleEndTimeHh() != null ? detail.getSleEndTimeHh() : "0")%>								
								</select>
								<select class="form-control" id="sle_end_time_mm" name="sle_end_time_mm">
									<%=CommonUtils.printMinuteList(detail.getSleEndTimeMm() != null ? detail.getSleEndTimeMm() : "0")%>	
								</select>
								</div>	
							</td>
						</tr>
						<tr>
							<th class="table-secondary">판매결과</th>
							<td>
								<select name="goos_sle_result" id="goos_sle_result" class="form-control" onchange="fnCancelDisplay(this.value);">
									<option value="">선택</option>
									<option value="A" ${sellDetail.goosSleResult eq 'A' ? 'selected="selected"' : '' }>완판</option>
									<option value="P" ${sellDetail.goosSleResult eq 'P' ? 'selected="selected"' : '' }>부분판매</option>
									<option value="C" ${sellDetail.goosSleResult eq 'C' ? 'selected="selected"' : '' }>판매취소</option>
								</select>
							</td>
						</tr>
						<tr id="canclResnTr" style="display: none;">
							<th class="table-secondary">판매취소사유</th>
							<td>
								<textarea name="cancl_resn" id="cancl_resn" class="form-control" rows="5">${sellDetail.canclResn }</textarea>
							</td>
						</tr>
						<tr id="canclDeTr" style="display: none;">
							<th class="table-secondary">판매취소일자</th>
							<td>${sellDetail.canclDeView }</td>
						</tr>
					</tbody>
				</table>
				
				<div class="text-right">
<%
	//if("N".equals(detail.getCanclYn())){
%>				
					<!-- <input class="btn btn-warning ml-1 text-center" type="button" value="판매취소" name="cancel" onclick="fnCancelSellGoods();"/> -->
<%
	//}
%>					 
					<input class="btn btn-danger ml-1 text-center" type="button" value="이전" name="prev" onclick="history.back();"/>
					<input class="btn btn-primary ml-1 text-center" type="button" value="판매수정" name="modify" onclick="fnModifySellGoods();"/> 
				</div>				

			</div>
		</div>

	</div>
	</form>
	<!-- footer -->
	<%@include file="../userviews/footer.jsp" %>

</div>



</body>
</html>