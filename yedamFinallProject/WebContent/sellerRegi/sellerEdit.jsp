<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>

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

input {
	border: none;
	border-style: solid;
	border-width: 1px;
	border-radius: 5px;
	border: 1px solid #cccccc;
	padding: 5px;
}

textarea {
	border: none;
	border-style: solid;
	border-width: 1px;
	border-radius: 5px;
	border: 1px solid #cccccc;
	padding: 5px;
}

#button {
	border: none;
	border-radius: 10px;
	height: 35px;
	width: 60px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
	background-color: #00bbff;
	color: white;
}

#button:hover {
	background-color: #58d1fc;
	height: 35px;
	transition: 0.5s;
}

#tbl {
	cell-spacing: 5px;
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
	      console.log("file size : "+sel_files.length);
	      var data = new FormData();
	
	      for(var i=0, len=sel_files.length; i<len; i++) {
	          var name = "image_"+i;
	          data.append(name, sel_files[i]);
	      }
	      data.append("image_count", sel_files.length);
	      data.append("seller_id", document.getElementById("goods_id").value);
	      data.append("seller_name", document.getElementById("goods_name").value);
	      data.append("netprc", document.getElementById("netprc").value);
	      data.append("seller_info", document.getElementById("goods_info").value);
	      
	      if(sel_files.length < 1) {
	          alert("파일을 선택하세요.");
	          return;
	      }            
	
	      var xhr = new XMLHttpRequest();
	      xhr.open("POST","./regGoods.do");
	      xhr.onload = function(e) {
	          if(this.status == 200) {
	              console.log("Result : "+e.currentTarget.responseText);
	              var data = JSON.parse(e.currentTarget.responseText);
	              console.log("Result : "+ data.result);
	              if("ok" == data.result){
	            	  //등록성공 목록으로 이동
	            	  alert("판매자가 등록 되었습니다.");
	            	  location.href = "listGoods.do";
	              }else{
	            	  alert("저장 중 오류가 발생하였습니다.");
	              }
	          }
	      }
	
	      xhr.send(data);
	      console.log("finish");
	  }
	
	  function fn_setAddr(){
		  var width = 500;
		  var height = 600;
		  daum.postcode.load(function(){
		        new daum.Postcode({
		            oncomplete: function(data) {
		            	$("#lc").val(data.address);
		            	$("#addr").val(data.buildingName);
		            }
		        }).open({
		        	left: (window.screen.width / 2) - (width /2),
		        	top: (window.screen.height / 2) - (height /2)
		        	});
		        });
		        
	  }
	//비밀번호와 비밀번호확인 같은지 체크
	  function isPwSame() {
		var pw = frm.pw.value;
		var pwCheck = frm.pw_conf.value;
		
		frm.pw.value = "";
		frm.pw_conf.value="";

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
	  
</script>
<script type="text/javascript">
	function formCheck(){
		if(frm.sname.value == ""){
			alert("상호명을 입력해주세요.")
			frm.sname.focus();
			return false;
		}
		if(frm.pw.value == ""){
			alert("비밀 번호를 입력해주세요.")
			frm.pw.focus();
			return false;
		}
		if(frm.pw_conf.value == ""){
			alert("비밀번호를 확인해 주세요.")
			frm.pw_conf.focus();
			return false;
		}
		if(frm.lc.value == ""){
			alert("가게 위치를 입력해주세요.")
			frm.lc.focus();
			return false;
		}
		if(frm.no.value == ""){
			alert("전화번호를 입력해주세요.")
			frm.no.focus();
			return false;
		}
		if(frm.open.value == ""){
			alert("영업시작시간을 입력해주세요.")
			frm.open.focus();
			return false;
		}
		if(frm.close.value == ""){
			alert("영업마감시간을 입력해주세요.")
			frm.close.focus();
			return false;
		}
		if(frm.sns.value == ""){
			alert("sns주소를 입력해주세요.")
			frm.sns.focus();
			return false;
		}
		if(frm.intrcn.value == ""){
			alert("가게 소개글을 입력해주세요.")
			frm.intrcn.focus();
			return false;
		}
		alert("판매자 정보가 수정 되었습니다.")
		return true;
		
	}
	
	
</script>

</head>

<body>

	<div class="super_container">

		<!-- Slider -->
		<%@include file="/userviews/header.jsp"%>

		<div class="main_slider">
			<div align="center">
				<form id="frm" name="frm" action="./sellerEditCommand.do"
					method="post" onsubmit="return formCheck()">
					<br> <br>
					<div>
						<h3>판매자 정보 수정</h3>
					</div>
					<br>
					<div>
						<table id="tbl">
							<tr height="30">
								<th>*ID(사업자번호)</th>
								<td><input value="${dto.sid}" style="width: 730px;"
									type="text" class="sid_input" id="sid" name="sid" readonly>
								</td>
							</tr>
							<tr height="30">
								<th>*비밀번호</th>
								<td><input style="width: 730px;" type="password" id="pw"
									name="pw"></td>
							</tr>
							<tr height="30">
								<th>*비밀번호확인</th>
								<td><input style="width: 730px;" type="password"
									id="pw_conf" name="pw_conf"></td>
							</tr>
							<tr height="30">
								<th>*상호명</th>
								<td><input value="${dto.sname}" style="width: 730px;"
									type="text" id="sname" name="sname"></td>
							</tr>
							<tr height="30">
								<th>*가게위치</th>
								<td><input value="${dto.lc}" style="width: 660px;"
									type="text" id="lc" name="lc">
									<button id="btn2" type="button" onclick="fn_setAddr();">검색</button></td>
							</tr>
							<tr height="30">
								<th>*사업주</th>
								<td><input value="${dto.name}" style="width: 730px;"
									type="text" id="name" name="name" readonly></td>
							</tr>
							<tr height="30">
								<th>*전화번호</th>
								<td><input value="${dto.no}" style="width: 730px;"
									type="text" id="no" name="no"></td>
							</tr>
							<tr height="30">
								<th>*영업시작시간</th>
								<td><input value="${dto.open}" style="width: 730px;"
									type="Time" id="open" name="open"></td>
							</tr>
							<tr height="30">
								<th>*영업마감시간</th>
								<td><input value="${dto.close}" style="width: 730px;"
									type="Time" id="close" name="close"></td>
							</tr>
							<tr height="30">
								<th>sns주소</th>
								<td><input value="${dto.sns}" style="width: 730px;"
									type="text" id="sns" name="sns"></td>
							</tr>
							<tr height="30">
								<th>*가게소개글</th>
								<td colspan="3"><textarea
										style="width: 730px; resize: none" id="intrcn" name="intrcn"
										cols="60" rows="15">${dto.intrcn}</textarea></td>
							</tr>

						</table>
					</div>
					<div class="mt-3">
						<div class="input_wrap">
							<input class="btn btn-primary ml-1" type="button" value="사진변경"
								name="selectFile" onclick="fileUploadAction();" />&nbsp;&nbsp;
							<input type="file" id="input_imgs" multiple />
							<button class="btn btn-primary ml-1" type="submit">수 정</button>
							&nbsp;&nbsp;
						</div>
					</div>

					<div>
						<div class="imgs_wrap" style="width: 500px;">
							<img id="img" />
						</div>
					</div>

				</form>
				<script type="text/javascript">
			document.getElementById('date').value = new Date().toISOString().substring(0, 10);
		</script>
			</div>

		</div>

		<!-- Footer -->

		<%@include file="/userviews/footer.jsp"%>

	</div>


</body>

</html>