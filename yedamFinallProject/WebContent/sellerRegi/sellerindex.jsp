<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">


<head>
	<title>판매자 등록</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Colo Shop Template">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="userstyles/bootstrap4/bootstrap.min.css">
	<link href="userplugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet"
		type="text/css">
	<link rel="stylesheet" type="text/css" href="userplugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css"
		href="userplugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="userplugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" type="text/css" href="userstyles/main_styles.css">
	<link rel="stylesheet" type="text/css" href="userstyles/responsive.css">


	<script src="userjs/jquery-3.2.1.min.js"></script>
	<script src="userstyles/bootstrap4/popper.js"></script>
	<script src="userstyles/bootstrap4/bootstrap.min.js"></script>
	<script src="userplugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="userplugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="userplugins/easing/easing.js"></script>
	<script src="userjs/custom.js"></script>


	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

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

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2084a98791b71389462cf829531808b2&libraries=services"></script>
	<script>

		window.addEventListener("load", function () {
			SelerBtn.addEventListener("click", function () {
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				if(formCheck() == false)
				return;

				var lc = document.getElementById('lc').value

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(lc, function (result, status) {

					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {

						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						document.getElementById('x').value=  result[0].y;
						document.getElementById('y').value=  result[0].x;
						document.frm.submit();
					}
				});
			})
		});

	</script>
	<script type="text/javascript">
		function formCheck() {
			/* if(frm.id.value == ""){
				alert("ID(사업자 번호)를  입력해주세요.")
				frm.id.focus();
				return false;
			} */
			if (frm.pw.value == "") {
				alert("비밀번호를 입력해주세요.")
				frm.pw.focus();
				return false;
			}
			if (frm.pw_conf.value == "") {
				alert("비밀번호를 입력해주세요.")
				frm.pw_conf.focus();
				return false;
			}
			if (frm.pw.value != frm.pw_conf.value) {
				alert("패스워드 확인과 다릅니다.")
				return false;
			}

			if (frm.sname.value == "") {
				alert("상호명을 입력해주세요.")
				frm.sname.focus();
				return false;
			}
			if (frm.lc.value == "") {
				alert("가게 위치를 입력해주세요.")
				frm.lc.focus();
				return false;
			}
			if (frm.name.value == "") {
				alert("사업주를 입력해주세요.")
				frm.name.focus();
				return false;
			}
			if (frm.no.value == "") {
				alert("전화번호를 입력해주세요.")
				frm.no.focus();
				return false;
			}
			if (frm.open.value == "") {
				alert("영업시작시간을 입력해주세요.")
				frm.open.focus();
				return false;
			}
			if (frm.close.value == "") {
				alert("영업마감시간을 입력해주세요.")
				frm.close.focus();
				return false;
			}
			if (frm.sns.value == "") {
				alert("sns주소를 입력해주세요.")
				frm.sns.focus();
				return false;
			} 
			if (frm.intrcn.value == "") {
				alert("가게 소개글을 입력해주세요.")
				frm.intrcn.focus();
				return false;
			}
			alert("가입이 완료되었습니다. 메인화면에서 다시 로그인해 주세요.");
			return true;
		}
	</script>
	<script type="text/javascript">
		var sel_files = [];

		$(document).ready(function () {
			$("#input_imgs").on("change", handleImgFileSelect);
		});

		function fileUploadAction() {
			console.log("fileUploadAction");
			$("#input_imgs").trigger('click');
		}

		function handleImgFileSelect(e) {
			//sel_files = [];
			//$(".imgs_wrap").empty();

			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			var index = 0;
			filesArr.forEach(function (f) {
				if (!f.type.match("image.*")) {
					alert("이미지만 등록 가능합니다.");
					return;
				}

				sel_files.push(f);

				var reader = new FileReader();
				reader.onload = function (e) {
					var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction(" + index + ")\" id=\"img_id_" + index + "\"><img src=\"" + e.target.result + "\" data-file='" + f.name + "' class='selProductFile' title='클릭 시 삭제'></a>";
					$(".imgs_wrap").append(html);
					index++;

				}
				reader.readAsDataURL(f);

			});
		}

		function deleteImageAction(index) {
			console.log("index : " + index);
			console.log("sel length : " + sel_files.length);

			sel_files.splice(index, 1);

			var img_id = "#img_id_" + index;
			$(img_id).remove();
		}


		function submitAction() {
			console.log("file size : " + sel_files.length);
			var data = new FormData();

			for (var i = 0, len = sel_files.length; i < len; i++) {
				var name = "image_" + i;
				data.append(name, sel_files[i]);
			}
			data.append("image_count", sel_files.length);
			data.append("seller_id", document.getElementById("goods_id").value);
			data.append("seller_name", document.getElementById("goods_name").value);
			data.append("netprc", document.getElementById("netprc").value);
			data.append("seller_info", document.getElementById("goods_info").value);

			if (sel_files.length < 1) {
				alert("파일을 선택하세요.");
				return;
			}

			var xhr = new XMLHttpRequest();
			xhr.open("POST", "./regGoods.do");
			xhr.onload = function (e) {
				if (this.status == 200) {
					console.log("Result : " + e.currentTarget.responseText);
					var data = JSON.parse(e.currentTarget.responseText);
					console.log("Result : " + data.result);
					if ("ok" == data.result) {
						//등록성공 목록으로 이동
						alert("판매자가 등록 되었습니다.");
						location.href = "listGoods.do";
					} else {
						alert("저장 중 오류가 발생하였습니다.");
					}
				}
			}

			xhr.send(data);
			console.log("finish");
		}

		//회원가입 비밀번호와 비밀번호확인 같은지 체크
		function isPwSame() {
			var pw = frm.pw.value;
			var pwCheck = frm.pw_conf.value;

			frm.pw.value = "";
			frm.pw_conf.value = "";

			if (pw == "" && pwCheck == "") {
				frm.pw.style.background = 'rgba(0, 0, 0, 0.09)';
				frm.pw_conf.style.background = 'rgba(0, 0, 0,0.09)';
			} else {
				if (pw != pwCheck) {
					frm.pw.style.background = 'red';
					frm.pw_conf.style.background = 'red';
				} else {
					frm.pw.style.background = 'rgb(232, 240, 254)';
					frm.pw_conf.style.background = 'rgb(232, 240, 254)';
				}
			}
		}
		//주소 찾기 API 사용	  
		function fn_setAddr() {
			var width = 500;
			var height = 600;
			daum.postcode.load(function () {
				new daum.Postcode({
					oncomplete: function (data) {
						$("#lc").val(data.address);
						$("#addr").val(data.buildingName);
					}
				}).open({
					left: (window.screen.width / 2) - (width / 2),
					top: (window.screen.height / 2) - (height / 2)
				});
			});

		}
		//아이디 중복 체크  
		function id_overlap_check() {

			$('#id_check_sucess').hide();
			$('.id_overlap_button').show();
			$('.sid_input').attr("check_result", "fail");

			if ($('.sid_input').val() == '') {
				alert('ID(사업자번호)를 입력해주세요.')
				return;
			}

			id_overlap_input = document.querySelector('input[name="sid"]');

			$.ajax({
				url: "./sellerIdCheck.do",
				data: {
					'sid': id_overlap_input.value
				},
				datatype: 'json',
				success: function (data) {
					console.log(data[0]);
					if (data[0] == "1") {
						alert("이미 존재하는 아이디 입니다.");
						document.getElementById('sid').value = "";
						id_overlap_input.focus();
						return;
					} else {
						alert("사용가능한 아이디 입니다.");
						$('.sid_input').attr("check_result", "success");
						$('#id_check_sucess').show();
						$('.id_overlap_button').hide();
						return;
					}
				}
			});
		}


	</script>

</head>

<body>

	<div class="super_container">

		<!-- Header -->
		<%@include file="/userviews/header.jsp"%>

		<!-- Slider -->

		<div class="main_slider">
			<div align="center">
				<form id="frm" name="frm" action="./boardWriteOK.do" method="post" onsubmit="return formCheck()">
					<br>
					<br>
					<div>
						<h3>판매자 등록</h3>
					</div>
					<br>
					<table>
						<tr height="30">
							<th>*ID(사업자번호)</th>
							<td><input style="width: 660px;" type="text" class="sid_input" id="sid" name="sid">
								<button type="button" onclick="id_overlap_check()">중복확인</button>
								<img id="id_check_sucess" style="display: none;"></td>
						</tr>
						<tr height="30">
							<th>*비밀번호</th>
							<td><input style="width: 730px;" type="password" id="pw" name="pw"></td>
						</tr>
						<tr height="30">
							<th>*비밀번호확인</th>
							<td><input style="width: 730px;" type="password" id="pw_conf" name="pw_conf"></td>
						</tr>
						<tr height="30">
							<th>*상호명</th>
							<td><input style="width: 730px;" type="text" id="sname" name="sname"></td>
						</tr>
						<tr height="30">
							<th>*가게위치</th>
							<td><input style="width: 690px;" type="text" id="lc" name="lc">
								<button id="button" name="button" onclick="fn_setAddr();">검색</button></td>
						</tr>
						<tr height="30">
							<th>*사업주</th>
							<td><input style="width: 730px;" type="text" id="name" name="name"></td>
						</tr>
						<tr height="30">
							<th>*전화번호</th>
							<td><input style="width: 730px;" type="text" id="no" name="no"></td>
						</tr>
						<tr height="30">
							<th>*영업시작시간</th>
							<td><input style="width: 730px;" type="Time" id="open" name="open"></td>
						</tr>
						<tr height="30">
							<th>*영업마감시간</th>
							<td><input style="width: 730px;" type="Time" id="close" name="close"></td>
						</tr>
						<tr height="30">
							<th>sns주소</th>
							<td><input style="width: 730px;" type="text" id="sns" name="sns"></td>
						</tr>
						<tr height="30">
							<th>*가게소개글</th>
							<td colspan="3"><textarea style="width: 730px; resize: none" id="intrcn" name="intrcn"
									cols="60" rows="15"></textarea></td>
						</tr>
						<input type="hidden" id="x" name="x" value="">
						<input type="hidden" id="y" name="y" value="">
					</table>
					<div class="mt-3">
						<div class="input_wrap">
							<input class="btn btn-primary ml-1" type="button" value="사진등록" name="selectFile"
								onclick="fileUploadAction();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="file" id="input_imgs" multiple />
							<button id="SelerBtn" name="SelerBtn" class="btn btn-primary ml-1" type="button">저 장</button>
							&nbsp;&nbsp;

						</div>
					</div>

					<div>
						<div class="imgs_wrap" style="width: 500px;">
							<img id="img" />
						</div>
					</div>

				</form>
				<!-- <script type="text/javascript">
					document.getElementById('date').value = new Date().toISOString().substring(0, 10);
				</script> -->
			</div>

		</div>

		<!-- Modal -->

		<%@include file="/userviews/modal.jsp"%>

		<!-- Footer -->
		<%@include file="/userviews/footer.jsp"%>
	</div>




</body>

</html>