<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="col-md-12">
				<div class="card" >
					<div class="card-header">
						<h6 class="card-title">
							n번 Q&A
						</h6>
						<hr>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
								    <label for="writer">작성자</label>
								    <input type="text" class="form-control-plaintext text-center" id="writer" value="테스트" readonly>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								    <label for="title">제목</label>
								    <input type="text" class="form-control-plaintext text-center" id="title" value="테스트" readonly>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
								    <label for="day">작성일</label>
								    <input type="text" class="form-control-plaintext text-center" id="day" value="2020/02/07" readonly>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<textarea class="form-control-plaintext pl-2" rows="10" style="resize:none"readonly>테스트용 입니다.</textarea>
							</div>
						</div>
					</div>
					<div class="card-footer">
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<form id="frm" name="frm" method="post" action="">
				<div class="card">
					<div class="card-header">
						<h6 class="card-title">답변 작성</h6>
						<hr>						
					</div>
					<div class="card-body">
						<div class="row" >
							<div class="col-md-12"> <!-- row 길이 왜 안늘어나는지? -->
								<div class="form-group">
      								<label for="comment" class="sr-only">답변 작성</label>
      								<textarea class="form-control" rows="5" id="comment" name="text" placeholder="답변을 작성해 주세요."></textarea>
    							</div>
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