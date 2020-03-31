<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="userassets/css/login-register.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="userstyles/bootstrap4/bootstrap.min.css">
<link
	href="userplugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="userplugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="userplugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="userplugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="userstyles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="userstyles/responsive.css">



<script src="userjs/jquery-3.2.1.min.js"></script>
<script src="userstyles/bootstrap4/popper.js"></script>
<script src="userstyles/bootstrap4/bootstrap.min.js"></script>
<script
	src="userplugins/Isotope/isotope.pkgd.min.js"></script>
<script
	src="userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="userplugins/easing/easing.js"></script>
<script src="userjs/custom.js"></script>

<!-- 로그인 스크립트 전체 -->
<script type="text/javascript"
	src="userassets/js/login-register.js"></script>
<style>
#lgBtn {
	border: none;
	border-radius: 15px;
	height: 40px;
	width: 80px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
	background-color: #ff3847;
	color: white;
}

#lgBtn:hover {
	background-color: #fc6570;
	height: 45px;
	transition: 0.5s;
}

#usBtn {
	border: none;
	border-radius: 15px;
	height: 40px;
	width: 60px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
	background-color: #ff3847;
	color: white;
}

#usBtn:hover {
	background-color: #fc6570;
	height: 45px;
	transition: 0.5s;
}

#seBtn {
	border: none;
	border-radius: 15px;
	height: 40px;
	width: 60px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
	background-color: #00bbff;
	color: white;
}

#seBtn:hover {
	background-color: #58d1fc;
	height: 45px;
	transition: 0.5s;
}

#adBtn {
	border: none;
	border-radius: 15px;
	height: 40px;
	width: 60px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
	background-color: #ffba30;
	color: white;
}

#adBtn:hover {
	background-color: #facf78;
	height: 45px;
	transition: 0.5s;
}

a {
	text-decoration: none;
}

a:link a:hover a:visited a:active {
	text-decoration: none;
}
</style>
<header class="header trans_300">

	<!-- Main Navigation(숨겨진 상단메뉴) -->

	<div class="main_nav_container">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-right">
					<div class="logo_container">
						<a href="${pageContext.request.contextPath }/">Nam <span>BBang</span>
						</a>
					</div>
					<nav class="navbar">
						<ul class="navbar_menu">
							<li><a href="${pageContext.request.contextPath }/">Home</a></li>
							<!-- <li><a href="./totalShop.do">Total Shop</a></li> -->

							<c:if test="${CONECTR_SE eq 'SE'}">
								<li><a href="./listGoods.do">상품 관리</a></li>
								<li><a href="./sellerEdit.do">판매자 정보 수정</a></li>
								<li><a href="./sellLogManage.do">판매 내역 관리</a></li>
							</c:if>
							<c:if test="${CONECTR_SE eq 'AD'}">
								<li><a href="./AdminMain.ad">관리자 모드</a></li>
							</c:if>

						</ul>

						<ul class="navbar_user">


							<!-- <li><a data-toggle="modal" href="javascript:void(0)"> <i
									onclick="javascript: openLoginModal();" class="fa fa-user" aria-hidden="true"></i></a></li>
							 -->



							<c:if test="${empty CONECTR_SE}">
								<li><a data-toggle="modal" href=""
									onclick="javascript: openLoginModal();"
									style="text-decoration: none">
										<button type="button" id="lgBtn">LOGIN</button>
								</a></li>
							</c:if>
							<c:if test="${not empty CONECTR_SE && CONECTR_SE == 'US'}">
								<li><a data-toggle="modal" href=""
									onclick="javascript: openLogoutModal();"
									style="text-decoration: none">
										<button type="button" id="usBtn">${id }</button>
								</a></li>
							</c:if>
							<c:if test="${not empty CONECTR_SE && CONECTR_SE == 'SE'}">
								<li><a data-toggle="modal" href=""
									onclick="javascript: openLogoutModal();"
									style="text-decoration: none">
										<button type="button" id="seBtn">${id }</button>
								</a></li>
							</c:if>
							<c:if test="${not empty CONECTR_SE && CONECTR_SE == 'AD'}">
								<li><a data-toggle="modal" href=""
									onclick="javascript: openLogoutModal();"
									style="text-decoration: none">
										<button type="button" id="adBtn">관리자</button>
								</a></li>
							</c:if>
							<c:if test="${not empty CONECTR_SE}">
								<%
									String ss = (String) session.getAttribute("id");
										String sa = (String) session.getAttribute("CONECTR_SE");
								%>



							</c:if>
							<!-- <li class="checkout">
							<a href="myPage.do"> 
							<i class="fa fa-shopping-cart" aria-hidden="true"></i> 
							</a>
							</li> -->
						</ul>
						<div class="hamburger_container">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<!-- 제일위 흰색에 글씨-->
	<div class="fs_menu_overlay"></div>

	<!-- 오른쪽 숨겨진 메뉴 -->
	<div class="hamburger_menu">
		<div class="hamburger_close">
			<i class="fa fa-times" aria-hidden="true"></i>
		</div>
		<div class="hamburger_menu_content text-right">
			<ul class="menu_top_nav">
				<li class="menu_item"><a href="./index.do">Home</a></li>

				<c:if test="${CONECTR_SE eq 'SE'}">
					<li class="menu_item"><a href="#">상품 등록</a></li>
					<li class="menu_item"><a href="#">판매자 등록</a></li>
				</c:if>
			</ul>
		</div>
	</div>

</header>

<!-- Modal -->
<%@include file="modal.jsp"%>

