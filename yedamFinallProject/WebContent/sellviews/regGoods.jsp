<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	String imgPath = "sellviews";
	String jsPath = "sellviews";
	String cssPath = "sellviews";
%>
<html>
	<head>
	<title>상품등록</title>
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
	
	  var sel_files = [];
	
	  $(document).ready(function() {
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
	      filesArr.forEach(function(f) {
	          if(!f.type.match("image.*")) {
	              alert("이미지만 등록 가능합니다.");
	              return;
	          }
	
	          sel_files.push(f);
	
	          var reader = new FileReader();
	          reader.onload = function(e) {
	              var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='클릭 시 삭제'></a>";
	              $(".imgs_wrap").append(html);
	              index++;
	
	          }
	          reader.readAsDataURL(f);
	          
	      });
	  }
	
	  function deleteImageAction(index) {
	      console.log("index : "+index);
	      console.log("sel length : "+sel_files.length);
	
	      sel_files.splice(index, 1);
	
	      var img_id = "#img_id_"+index;
	      $(img_id).remove(); 
	  }
	
	
	  function submitAction() {
		  if(!confirm("상품을 등록 하시겠습니까?")){
		  	  return false;
		  }		  
	      console.log("file size : "+sel_files.length);
	      var data = new FormData();
	
	      for(var i=0, len=sel_files.length; i<len; i++) {
	          var name = "image_"+i;
	          data.append(name, sel_files[i]);
	      }
	      data.append("image_count", sel_files.length);
	      //data.append("goods_id", document.getElementById("goods_id").value);
	      data.append("goods_name", document.getElementById("goods_name").value);
	      data.append("netprc", document.getElementById("netprc").value);
	      data.append("goods_info", document.getElementById("goods_info").value);


			var goods_cl = document.getElementsByName("goods_cl");
			for (var i = 0; i < goods_cl.length; i++) {
				if (goods_cl[i].checked == true) {
					data.append("goods_cl", goods_cl[i].value);
					break;
				}
			}

			if (sel_files.length < 1) {
				alert("파일을 선택하세요.");
				return;
			}

			var xhr = new XMLHttpRequest();
			xhr.open("POST", "./regGoods.do");
			xhr.onload = function(e) {
				if (this.status == 200) {
					console.log("Result : " + e.currentTarget.responseText);
					var data = JSON.parse(e.currentTarget.responseText);
					console.log("Result : " + data.result);
					if ("ok" == data.result) {
						//등록성공 목록으로 이동
						alert("상품이 등록 되었습니다.");
						location.href = "listGoods.do";
					} else {
						alert("저장 중 오류가 발생하였습니다.");
					}
				}
			}

			xhr.send(data);
			console.log("finish");
		}
	</script>
</head>

<body>

<div class="super_container">

	<!-- Header -->
	<%@include file="../userviews/header.jsp" %>
	

	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>상품등록</a></li>
					</ul>
				</div>

			</div>
		</div>

		<!-- Map Container -->

		<div class="row">
			<div class="col">
<!-- 				<div class="form-inline form-group">
					<label for="goods_id" class="col-sm-2 control-label">상품ID</label><!--자동으로입력되게변경--//>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="goods_id" name="goods_name"/>
					</div>
				</div> -->
				<div class="form-inline form-group">
					<label for="goods_name" class="col-sm-2 control-label">상품명</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="goods_name" name="goods_name"/>
					</div>
					<label for="netprc" class="col-sm-2 control-label">상품가격</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="netprc" name="netprc"/>
					</div>
				</div>				
				<div class="form-inline form-group">
					<label for="goods_info" class="col-sm-2 control-label">상품설명</label>
					<div class="col-sm-10">
						<textarea name="goods_info" id="goods_info" class="form-control" rows="5" cols="90" style="max-width:100%"></textarea>
					</div>
				</div>
				
 				<div class="form-inline form-group">
 					<label for="goods_info" class="col-sm-2 control-label">상품구분</label>
					<div class="col-sm-10">
						<div class="row pr-3">
						<label><input id="goods_cl" class="form-control" type="radio" name="goods_cl" value="식빵류">식빵류</label>
						<label><input id="goods_cl" class="form-control ml-3" type="radio" name="goods_cl" value="과자빵류">과자빵류</label>
						<label><input id="goods_cl" class="form-control ml-3" type="radio" name="goods_cl" value="조리빵류">조리빵류</label>
						</div>
					</div>
				</div>
				
 				<div class="mt-3">
					<div class="input_wrap">
						<input class="btn btn-primary ml-1" type="button" value="파일선택" name="selectFile" onclick="fileUploadAction();"/> 
						<input type="file" id="input_imgs" multiple />
					</div>
				</div>
				
				<div>
					<div class="imgs_wrap">
						<img id="img" />
					</div>
				</div>
				
				<div class="text-right">
					<input class="btn btn-danger ml-1 text-center" type="button" value="이전" name="prev" onclick="history.back();"/> 
					<input class="btn btn-primary ml-1 text-center" type="button" value="상품등록" name="uploadFile" onclick="submitAction();"/> 
				</div>
			</div>
		</div>

	<!-- footer -->
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