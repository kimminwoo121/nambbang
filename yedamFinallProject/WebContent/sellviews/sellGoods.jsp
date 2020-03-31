<%@page import="co.nambbang.app.goods.CommonUtils"%>
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
	<title>상품판매</title>
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
			
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
      if("${result}" == "sellOk"){
    	  alert("상품판매가 등록되었습니다.");
    	  location.href = "${pageContext.request.contextPath }/listSellGoods.do";
      }
	</script>
	
	<script type="text/javascript">
	    $(document).ready(function(){
	      $('.slider').bxSlider();
	      
	      $("#mnfctur_de").datepicker();
	    });
	    
	    function fnRegSellGoods(){
	    	var frm = document.frm;
	    	if(confirm("상품을 판매 하시겠습니까?")){
		    	//validation 추가할것
	    		frm.action = "sellGoods.do";

		    	frm.submit();
	    	}
	    }	    
	</script>
</head>

<body>

<div class="super_container">

	<!-- Header -->
	<%@include file="../userviews/header.jsp" %>
	

	<form method="post" id="frm" name="frm">
	<input type="hidden" id="goods_id" name="goods_id" value="${param.goods_id }"/>
	<input type="hidden" id="curPageNo" name="curPageNo" value="1"/>
	
	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>상품판매</a></li>
					</ul>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col">

				<table class="table table-bordered">
					<tbody align="center">
						<tr>
							<td rowspan="10" style="width: 20%;">
								<div class="slider">
<%
			List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("photoList");
			if(list != null && list.size() > 0){
				for(GoodsDTO dto : list){
%>
          							<div><img src="data:x-image/jpg;base64, <%=dto.getPhotoFileBlob()%>" data-file='<%=dto.getPhotoName()%>' class='img-responsive' title='사진' style="max-width:300px; max-height:300px"></div>
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
							<th class="table-secondary" style="width:10%">상품ID</th>
							<td>${goodsDetail.goodsId }</td>
						</tr>						
						<tr>
							<th class="table-secondary">상품명</th>
							<td class="success">${goodsDetail.goodsName }</td>
						</tr>
						<tr>
							<th class="table-secondary">상품분류</th>
							<td>${goodsDetail.goodsCl }</td>
						</tr>
						<tr>
							<th class="table-secondary">정가</th>
							<td>${goodsDetail.netprc }</td>
						</tr>
						<tr>
							<th class="table-secondary">상품정보</th>
							<td>${goodsDetail.goodsInfo }</td>
						</tr>
						<tr>
							<th class="table-secondary">판매수량</th>
							<td><input type="text" class="form-control" id="sle_qy" name="sle_qy"/></td>
						</tr>
						<tr>
							<th class="table-secondary">판매가격</th>
							<td><input type="text" class="form-control" id="sle_pc" name="sle_pc"/></td>
						</tr>
						<tr>
							<th class="table-secondary">제조일</th>
							<td>
								<div class="form-inline form-group">
									<input type="text" class="form-control" id="mnfctur_de" name="mnfctur_de" style="width:167px" readonly="readonly"/>
									<br>&nbsp;&nbsp;&nbsp;									
									<select class="form-control" id="mnfctur_hh" name="mnfctur_hh">
										<%=CommonUtils.printHourList()%>
									</select>&nbsp;&nbsp;
									<select class="form-control" id="mnfctur_mm" name="mnfctur_mm">
										<%=CommonUtils.printMinuteList()%>	
									</select>
									<select class="form-control" id="mnfctur_ss" name="mnfctur_ss">
										<%=CommonUtils.printSecondList()%>	
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th class="table-secondary">판매시간</th>
							<td>
								<div class="form-inline form-group">
								<select class="form-control" id="sle_begin_time_hh" name="sle_begin_time_hh">
									<%=CommonUtils.printHourList()%>								
								</select>&nbsp;&nbsp;
								<select class="form-control" id="sle_begin_time_mm" name="sle_begin_time_mm">
									<%=CommonUtils.printMinuteList()%>	
								</select>
								~
								<select class="form-control" id="sle_end_time_hh" name="sle_end_time_hh">
									<%=CommonUtils.printHourList()%>								
								</select>&nbsp;&nbsp;
								<select class="form-control" id="sle_end_time_mm" name="sle_end_time_mm">
									<%=CommonUtils.printMinuteList()%>	
								</select>
								</div>	
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="text-right">
					<input class="btn btn-danger ml-1 text-center" type="button" value="이전" name="prev" onclick="history.back();"/>
					<input class="btn btn-primary ml-1 text-center" type="button" value="상품판매" name="uploadFile" onclick="fnRegSellGoods();"/> 
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