<%@page import="co.nambbang.app.goods.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String imgPath = "sellviews";
	String jsPath = "sellviews";
	String cssPath = "sellviews";
%>
<html>
	<head>
	<title>상품상세</title>
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
	  var del_no = [];
	  var pgId = "${goodsDetail.photoGroupId}";
	  $(document).ready(function() {
		  //사진불러오기
	      onLoadImgData();
		  
		  $("#input_imgs").on("change", handleImgFileSelect);
	  }); 
	  
	  //로딩시 이미지 불러오기
	  function onLoadImgData(){
		  console.log("이미지로딩!!");
	      var index = 0;
<%
			List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("photoList");
			if(list != null && list.size() > 0){
				for(GoodsDTO dto : list){
%>
          var html = "<a href=\"javascript:void(0);\" onclick=\"deleteOldImageAction("+index+", '<%=dto.getPhotoNo()%>', '<%=dto.getPhotoGroupId()%>')\" id=\"img_id_"+index+"\"><img src=\"data:x-image/jpg;base64, <%=dto.getPhotoFileBlob()%>\" data-file='<%=dto.getPhotoName()%>' class='selProductFile' title='클릭 시 삭제'></a>";
          $(".imgs_wrap").append(html);
          sel_files.push("");
          index++;
<%
				}
			}
%>          
	  }
	
	  function fileUploadAction() {
	      console.log("fileUploadAction");
	      $("#input_imgs").trigger('click');
	  }	  
	
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
	
	  function deleteOldImageAction(index, photoNo, photoGoupId) {
	      console.log("index : "+index);
	      console.log("sel length : "+sel_files.length);
	
	      sel_files.splice(index, 1);
	
	      var img_id = "#img_id_"+index;
	      $(img_id).remove();
	      
	      del_no.push(photoNo);
	      pgId = photoGoupId;
	  }
	
	
	  function submitAction() {
		  if(!confirm("상품을 수정 하시겠습니까?")){
		  	  return false;
		  }			  
	      console.log("file size : "+sel_files.length);
	      console.log("del size : "+del_no.length);
	      var data = new FormData();
		  var j=0;
	      for(var i=0, len=sel_files.length; i<len; i++) {
	    	  if(sel_files[i] == ""){
	    		  
	    	  }else{
		          var name = "image_"+(j++);
		          data.append(name, sel_files[i]);
	    	  }
	      }
	      
	      for(var i=0, len=del_no.length; i<len; i++) {
	    	  console.log("del[] : "+del_no[i]);
	      }
	      data.append("image_count", sel_files.length);
	      data.append("goods_id", document.getElementById("goods_id").value);
	      data.append("goods_name", document.getElementById("goods_name").value);
	      data.append("netprc", document.getElementById("netprc").value);
	      data.append("goods_info", document.getElementById("goods_info").value);
	      data.append("del_no", del_no);
	      data.append("photo_group_id", pgId);


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
			xhr.open("POST", "./modifyGoods.do");
			xhr.onload = function(e) {
				if (this.status == 200) {
					console.log("Result : " + e.currentTarget.responseText);
					var data = JSON.parse(e.currentTarget.responseText);
					console.log("Result : " + data.result);
					if ("ok" == data.result) {
						//등록성공 목록으로 이동
						alert("상품이 수정 되었습니다.");
						location.href = "listGoods.do";
					} else {
						alert("저장 중 오류가 발생하였습니다.");
					}
				}
			}

			xhr.send(data);
			console.log("finish");
		}

		function deleteAction() {
		   if(!confirm("상품을 삭제 하시겠습니까?")){
		  	   return false;
		   }				
			var data = new FormData();
			data.append("goods_id", document.getElementById("goods_id").value);
			data.append("photo_group_id", pgId);

			var xhr = new XMLHttpRequest();
			xhr.open("POST", "./deleteGoods.do");
			xhr.onload = function(e) {
				if (this.status == 200) {
					console.log("Result : " + e.currentTarget.responseText);
					var data = JSON.parse(e.currentTarget.responseText);
					console.log("Result : " + data.result);
					if ("ok" == data.result) {
						//등록성공 목록으로 이동
						alert("상품이 삭제 되었습니다.");
						location.href = "listGoods.do";
					} else {
						alert("저장 중 오류가 발생하였습니다.");
					}
				}
			}

			xhr.send(data);
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
				<div class="form-inline form-group">
					<label for="goods_id" class="col-sm-2 control-label">상품ID</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="goods_id" name="goods_name" value="${goodsDetail.goodsId }" readonly="readonly"/>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="goods_name" class="col-sm-2 control-label">상품명</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="goods_name" name="goods_name" value="${goodsDetail.goodsName }"/>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="netprc" class="col-sm-2 control-label">상품가격</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="netprc" name="netprc" value="${goodsDetail.netprc }"/>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="goods_info" class="col-sm-2 control-label">상품설명</label>
					<div class="col-sm-10">
						<textarea name="goods_info" id="goods_info" class="form-control col-sm-7" rows="5">${goodsDetail.goodsInfo }</textarea>
					</div>
				</div>				
 				<div class="form-inline form-group">
 					<label for="goods_info" class="col-sm-2 control-label">상품구분 ${goodsDetail.goodsCl}</label>
					<div class="col-sm-10">
						<div class="row">
						<label><input id="goods_cl" class="form-control" type="radio" name="goods_cl" value="식빵류" ${goodsDetail.goodsCl eq '식빵류' ? 'checked="checked"' : '' }>식빵류</label>
						<label><input id="goods_cl" class="form-control ml-3" type="radio" name="goods_cl" value="과자빵류" ${goodsDetail.goodsCl eq '과자빵류' ? 'checked="checked"' : '' }>과자빵류</label>
						<label><input id="goods_cl" class="form-control ml-3" type="radio" name="goods_cl" value="조리빵류" ${goodsDetail.goodsCl eq '조리빵류' ? 'checked="checked"' : '' }>조리빵류</label>
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
					<input class="btn btn-warning ml-1 text-center" type="button" value="상품삭제"  name="prev" onclick="deleteAction();"/>
					<input class="btn btn-danger ml-1 text-center" type="button" value="이전" name="prev" onclick="history.back();"/> 
					<input class="btn btn-primary ml-1 text-center" type="button" value="상품수정" name="uploadFile" onclick="submitAction();"/> 
				</div>
				
			</div>
		</div>

		</div>

	<!-- Footer -->
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