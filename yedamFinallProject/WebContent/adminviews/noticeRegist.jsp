<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script>
window.addEventListener("load",function(){
	//오늘 날짜 구하는 JS
	var d = new Date();
	document.getElementById("day").value = d.getFullYear() + "/" +( d.getMonth() + 1) + "/" +d.getDate();	
});
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="col-md-12">
				<form id="frm" name="frm" method="post" action="">
					<div class="card" >
						<div class="card-header">
							<h6 class="card-title">
								공지사항 등록
							</h6>
							<hr>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
									    <label for="writer">작성자</label>
									    <input type="text" class="form-control-plaintext text-center" id="writer" value="운영자">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									    <label for="title">제목</label>
									    <input type="text" class="form-control" id="title">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
									    <label for="day">작성일</label>
									    <input type="text" class="form-control-plaintext text-center" id="day" value="" readonly>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<textarea class="form-control pl-2" rows="50" style="resize:none" placeholder="내용을 작성해 주세요."></textarea>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="row">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-sm">등록</button>
									<a href="AdminBbsNoticeManage.ad" class="btn btn-primary btn-sm">취소</a> <!-- 단순 페이지간 링크 -->
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>					
		</div>		
		<div class="col-md-3"></div>
	</div>
</body>
</html>