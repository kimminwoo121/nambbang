<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Single Product</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.css">
<link href="/yedamFinallProject/userplugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/yedamFinallProject/userplugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userplugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userstyles/single_styles.css">
<link rel="stylesheet" type="text/css" href="/yedamFinallProject/userstyles/single_responsive.css">

<script src="/yedamFinallProject/userjs/jquery-3.2.1.min.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/popper.js"></script>
<script src="/yedamFinallProject/userstyles/bootstrap4/bootstrap.min.js"></script>
<script src="/yedamFinallProject/userplugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/yedamFinallProject/userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/yedamFinallProject/userplugins/easing/easing.js"></script>
<script src="/yedamFinallProject/userplugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/yedamFinallProject/userjs/single_custom.js"></script>
<!--지도 api script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2084a98791b71389462cf829531808b2&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
jQuery(document).ready(function($)
{
	if($('.single_product_thumbnails ul li').length)
	{
		var thumbs = $('.single_product_thumbnails ul li');
		var singleImage = $('.single_product_image_background');
	
		thumbs.each(function()
		{
			var item = $(this);
			item.on('click', function()
			{
				thumbs.removeClass('active');
				item.addClass('active');
				var img = item.find('img').data('image');
				$("#single_product_img").attr("src", img);
			});
		});
	}	
});

function FormChk(){
	var q_val;
	q_val = document.getElementById("quantity_value").innerHTML;
	if(q_val > ${sell.sleQy}){
		alert("판매수량보다 많은 수량은 구매할 수 없습니다.");
		return false;		
	}else{
	document.getElementById("q_value").value = q_val;	
	}
	
	if(${empty CONECTR_SE}){
			alert("비회원은 로그인을 해주세요.");
			return false;
	}
	if(${CONECTR_SE == 'SE'}){
		alert("판매자는 상품을 구매할 수 없습니다.");
		return false;
	}
	
}
$(function(){
	
	
	var container = document.getElementById('SelerLocation'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${seller.lc}', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        map.setCenter(coords);
	     }
	     
	     var iwContent = '<div style="padding:5px;">${seller.sname}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	     iwPosition = coords //인포윈도우 표시 위치입니다

	 // 인포윈도우를 생성합니다
	 var infowindow = new kakao.maps.InfoWindow({
	     position : iwPosition, 
	     content : iwContent 
	    
	    
	 });
	     infowindow.open(map, marker); 
	});	
	
});

</script>
<style>
#btn {
	background-color: #fe4c50;
}
#btn:hover {
	background-color: #cc272a;
	transition: 0.5s;
}
</style>
 
</head>

<body>

<div class="super_container">

	<!-- Header -->
	<%@include file="../userviews/header.jsp" %>

	<!-- 상품 -->
	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="/yedamFinallProject/">Nam Bang</a></li>
						<!-- <li><a href="categories.html"><i class="fa fa-angle-right" aria-hidden="true"></i>Men's</a></li> -->
						<li class="active"><a href=""><i class="fa fa-angle-right" aria-hidden="true"></i>${sell.goodsName }</a></li>
					</ul>
				</div>

			</div>
		</div>
		<form id="frm" name="frm" method="post" action="SetleForm.do" onsubmit="return FormChk()">
		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<div class="single_product_thumbnails">
								<ul>
									<c:forEach var="list" items="${photoList }" varStatus="status">
										<li ${status.count eq 1 ? "class='active'" : "" }><img src="data:x-image/jpg;base64, ${list.photoFileBlob }" data-image="data:x-image/jpg;base64, ${list.photoFileBlob }"></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="col-lg-9 image_col order-lg-2 order-1">
							<div class="single_product_image">
								<div class="single_product_image_background"><img id="single_product_img" src="data:x-image/jpg;base64, ${photoList[0].photoFileBlob }" data-image="data:x-image/jpg;base64, ${photoList[0].photoFileBlob }" class="img-responsive" style="max-width: 100%"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2>${sell.goodsName }</h2>
						<input type="hidden" id="g_name" name="g_name" value="${sell.goodsName }">
						<input type="hidden" id="s_id" name="s_id" value="${sell.sleId }">
						<p>${fn:replace(sell.goodsInfo, newLineChar, "<br/>")  }</p>
					</div>
					<div class="original_price">${sell.netprc } 원</div>
					<div class="product_price">${sell.slePc } 원</div>
					<input type="hidden" id="g_price" name="g_price" value="${sell.slePc }">
					<!-- <ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul> -->
					<div class="product_color">
						<span>판매수량:</span>
						<ul>
						<c:if test="${sell.sleQy > 0 }">
						${sell.sleQy }
						</c:if>
						<c:if test="${sell.sleQy < 1}">
						<h4>SOLD OUT</h4>
						</c:if>
						</ul>
					</div>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<span style="min-width: 70px;">구매수량:</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>							
							<span id="quantity_value">1</span>							
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
							<input type="hidden" id="q_value" name="q_value" value="">
						</div>
						<!-- <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
						<div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div> -->						
					</div>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
					<c:if test="${sell.sleQy > 0 }">
						<input type="submit" id="btn" name="btn" class="btn btn-default btn-login" style="color:white;" value="구매">
					</c:if>
					</div>
				</div>
			</div>			
		</div>
		</form>
	</div>


	<!-- Tabs -->
	<div class="tabs_section_container">

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>판매점 위치</span></li>
							<!-- <li class="tab" data-active-tab="tab_2"><span>Additional Information</span></li>
							<li class="tab" data-active-tab="tab_3"><span>Reviews (2)</span></li> -->
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12" id="SelerLocation" name="SelerLocation" style="width:500px;height:400px; border-radius: 10px">					
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-12" id="LocationRoadview" name="LocationRoadview" style="width:500px;height:400px; border-radius: 10px">					
				</div>
			</div>
		</div>

	</div> 


	<!-- Benefit(맨밑에 주의사항) -->
	<!-- <div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 -->

	<!-- Footer -->
	<%@include file="../userviews/footer.jsp" %>
	

</div>

</body>

</html>
