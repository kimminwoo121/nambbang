<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Colo Shop Categories</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	href="userplugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="userstyles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="userstyles/categories_responsive.css">

</head>

<body>

	<div class="super_container">

		<%@include file="header.jsp"%>

		<div class="fs_menu_overlay"></div>

		<div class="container product_section_container">
			<div class="row">
				<div class="col product_section clearfix">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="./index.do">Home</a></li>
							<li class="active"><a href="./totalShop.do"><i
									class="fa fa-angle-right" aria-hidden="true"></i>TotalShop</a></li>
						</ul>
					</div>

					<div class="sidebar">
						<div class="sidbar_section">
							<div class="sidebar_title">
								<h5>Ah......</h5>
							</div>
							<ul class="checkboxes">
								<li><i class="fa fa-square-o" data-checkcate="*"
									aria-hidden="true"></i><span>all</span></li>
								<li><i class="fa fa-square-o" data-checkcate='식빵류'
									aria-hidden="true"></i><span>식빵류</span></li>
								<li><i class="fa fa-square-o" data-checkcate='과자빵류'
									aria-hidden="true"></i><span>과자빵류</span></li>
								<li><i class="fa fa-square-o" data-checkcate='조리빵류'
									aria-hidden="true"></i><span>조리빵류</span></li>
							</ul>
						</div>

						<!-- Price Range Filtering -->
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Filter by Price</h5>
							</div>
							<p>
								<input type="text" id="amount" readonly
									style="border: 0; color: #f6931f; font-weight: bold;">
							</p>
							<div id="slider-range"></div>
							<div class="filter_button">
								<span>filter</span>
							</div>
						</div>

					</div>

					<!-- Main Content -->

					<div class="main_content">

						<!-- Products -->

						<div class="products_iso">
							<div class="row">
								<div class="col">

									<!-- Product Sorting -->

									<div
										class="product_sorting_container product_sorting_container_top">
										<ul class="product_sorting">
											<li><span class="type_sorting_text">Default
													Sorting</span> <i class="fa fa-angle-down"></i>
												<ul class="sorting_type">
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "original-order" }'><span>Default
															Sorting</span></li>
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "price" }'><span>Price</span></li>
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "name" }'><span>Product
															Name</span></li>

												</ul></li>
											<li><span>Show</span> <span class="num_sorting_text">6</span>
												<i class="fa fa-angle-down"></i>
												<ul class="sorting_num">
													<li class="num_sorting_btn"><span>6</span></li>
													<li class="num_sorting_btn"><span>12</span></li>
													<li class="num_sorting_btn"><span>24</span></li>
												</ul></li>
										</ul>
										<div class="pages d-flex flex-row align-items-center">
											<div class="page_current">
												<span>1</span>
												<ul class="page_selection">
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
												</ul>
											</div>
											<div class="page_total">
												<span>of</span> 3
											</div>
											<div id="next_page" class="page_next">
												<a href="#"><i class="fa fa-long-arrow-right"
													aria-hidden="true"></i></a>
											</div>
										</div>

									</div>



									<!-- Product Grid -->

									<div class="product-grid">

										<!-- Product -->
										<c:forEach var="list" items="${GoodsMain }">
											<div class="product-item ${list.goodsCl }"
												data-cate='${list.goodsCl }'>
												<div class="product discount product_filter">
													<div class="product_image">
														<img src="${list.stringImage }" width="30px"
															height="200px" alt="">
													</div>
													<div class="favorite favorite_left"></div>
													<div
														class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
														<span>${list.sleEndTime.getHours() } : 00 </span>
													</div>
													<div class="product_info">
														<h6 class="product_name">
															<a href="single.html">${list.goodsName} </a>
														</h6>
														<div class="product_price">
															${list.slePc}<span>${list.netPrc }</span>
														</div>
													</div>
												</div>
												<div class="red_button add_to_cart_button">
													<a href="#">add to cart</a>
												</div>
											</div>

										</c:forEach>
									</div>
									<!-- Product Sorting -->

									<div
										class="product_sorting_container product_sorting_container_bottom clearfix">
										<ul class="product_sorting">
											<li><span>Show:</span> <span class="num_sorting_text">04</span>
												<i class="fa fa-angle-down"></i>
												<ul class="sorting_num">
													<li class="num_sorting_btn"><span>01</span></li>
													<li class="num_sorting_btn"><span>02</span></li>
													<li class="num_sorting_btn"><span>03</span></li>
													<li class="num_sorting_btn"><span>04</span></li>
												</ul></li>
										</ul>
										<span class="showing_results">Showing 1–3 of 12 results</span>
										<div class="pages d-flex flex-row align-items-center">
											<div class="page_current">
												<span>1</span>
												<ul class="page_selection">
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
												</ul>
											</div>
											<div class="page_total">
												<span>of</span> 3
											</div>
											<div id="next_page_1" class="page_next">
												<a href="#"><i class="fa fa-long-arrow-right"
													aria-hidden="true"></i></a>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<!-- Footer -->
		<%@include file="footer.jsp"%>


	</div>

	<script src="userjs/jquery-3.2.1.min.js"></script>
	<script src="userstyles/bootstrap4/popper.js"></script>
	<script
		src="userstyles/bootstrap4/bootstrap.min.js"></script>
	<script
		src="userplugins/Isotope/isotope.pkgd.min.js"></script>
	<script
		src="userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="userplugins/easing/easing.js"></script>
	<script
		src="userplugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="userjs/categories_custom.js"></script>
</body>

</html>
