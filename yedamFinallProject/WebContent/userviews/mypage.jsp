<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String imgPath = "sellviews";
	String jsPath = "sellviews";
	String cssPath = "sellviews";
%>
<html lang="en">
<head>
<title>NamBang</title>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="userjs/jquery-3.2.1.min.js"></script>
<script src="userstyles/bootstrap4/popper.js"></script>
<script src="userstyles/bootstrap4/bootstrap.min.js"></script>
<script src="userplugins/Isotope/isotope.pkgd.min.js"></script>
<script src="userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="userplugins/easing/easing.js"></script>
<script src="userjs/custom.js"></script>


<style>
#trHover:hover{
	background-color:#fff2f3;
	transition: 0.3s;

}
#wayBtn{
	border: none;	
	border-radius: 5px;
	height: 40px;
	width: 80px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top:5px;
	padding-bottom:5px;
	background-color:#ff3847;
	color:white;	
}
#wayBtn:hover{
	background-color:#fc6570;	
	height: 45px;	
	transition: 0.5s;
}
</style>
<script>	

function openWay(){
	var map = document.getElementById("findWay");
	var btn = document.getElementById("wayBtn");
	if(${not empty MyPageList} && btn.innerHTML == "길 안내"){
		
		var name = document.getElementById("cmpnm").value;
		var la = document.getElementById("la").value;
		var lo = document.getElementById("lo").value;
		btn.style.width = "100px";
		btn.innerHTML = "길안내 닫기";
		map.src = "https://map.kakao.com/link/to/"+name+","+la+","+lo;
		map.style.display = "block";	
	}else if(${not empty MyPageList} && btn.innerHTML != "길 안내"){
		btn.style.width = "80px";
		btn.innerHTML = "길 안내";
		map.style.display = "none";
	}
	
}

</script>
</head>



<body>

	<div class="super_container">

		<!-- Header -->
		<%@include file="header.jsp"%>

		<div class="main_slider">
			<div class="container contact_container">
				<div class="row">
					<div class="col">
		
						<!-- Breadcrumbs -->
		
						<div class="breadcrumbs d-flex flex-row align-items-center">
							<ul>
								<li><a href="${pageContext.request.contextPath }/">Home</a></li>
								<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>${id }님의 구매내역</a></li>
							</ul>
						</div>
		
					</div>
				</div>
			
			
		<!-- Slider -->
			<div class="container contact_container" style="margin-top:0px">
				<table class="table table-hover table-bordered results align-items-center">
					<thead style="background-color:#fa6164; color:white">
						<tr class="text-center">				
							<th width="10%">상품 이미지</th>
							<th>주문번호</th>
							<th>상품명</th>
							<th>구매가격</th>
							<th>구매수량</th>						
							<th>구매시간</th>						
							<th>결제상태</th>
							<th>길 안내</th>
						</tr>
					</thead>
					<c:choose>
					<c:when test="${not empty MyPageList }">
					<c:forEach var="list" items="${MyPageList }">
					<tr id="trHover">
						<td class="align-middle text-center"width="150px">
							<a href="single.do?sleId=${list.sleId }"><img src="${list.photoString}" width="100px" height="100px" alt="">
						</a>						
						</td >
						<td class="align-middle text-center">${list.orderId }</td>
						<td class="align-middle text-center">${list.goodsName }</td>
						<td class="align-middle text-center">${list.setleAmount }</td>
						<td class="align-middle text-center">${list.orderQy }</td>
						<td class="align-middle text-center">${list.setleDe }</td>
						<td class="align-middle text-center">${list.setleCode }</td>
						<td class="align-middle text-center">
							<button type="button" id="wayBtn" name="wayBtn" onclick="openWay();">길 안내</button>
						</td>
					</tr>
					<input type="hidden" id="cmpnm" name="cmpnm" value="${list.cmpnm }">
					<input type="hidden" id="la" name="la" value="${list.la }">
					<input type="hidden" id="lo" name="lo" value="${list.lo }">
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr align="center">
							<td colspan="7">구매 내역이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
					</c:choose>
				</table>
				<div>
					<iframe src="" id="findWay" name="findWay" width="100%" height="1000px" scrolling="yes" frameborder="0" style="border-radius:10px; display:none"></iframe>
				</div>
			</div>
			
		</div>
	</div>

		<!-- Footer -->
		<%@include file="footer.jsp"%>

	</div>

</body>
</html>