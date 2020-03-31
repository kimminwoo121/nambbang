<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS and Notice Management</title>

</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="row">				
				<div class="col-md-2">
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
		    			<li class="breadcrumb-item"><a href="adminMain.jsp">관리자 홈</a></li>
		    			<li class="breadcrumb-item active" aria-current="page">게시물 관리</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
			<form id="frm" name="frm" method="post" action="">
				<div class="card-header">
					<h6 class="card-title">
							게시판 관리
					</h6>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-1 pt-3">기간</div>
						<div class="col-md-3 pt-1">
							<button type="button" class="btn btn-primary btn-sm">오늘</button>											
							<button type="button" class="btn btn-primary btn-sm">3일</button>
							<button type="button" class="btn btn-primary btn-sm">7일</button>
							<button type="button" class="btn btn-primary btn-sm">1개월</button>																				
							<button type="button" class="btn btn-primary btn-sm">전체</button>
						</div>
						<div class="col-md-2 pt-1">
															
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="startDate" placeholder="시작일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="startDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>						
						</div>
						<span class="pt-3">~</span>
						<div class="col-md-2 pt-1">
															
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="endDate" placeholder="종료일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="endDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>
						</div>
						<div class="col-md-2"></div>
					</div>
					<div class="row">
						<div class="col-md-1 pt-2">게시판 선택</div>
						<div class="col-md-2">
							<select class="custom-select">
								<option selected>게시판 선택</option>
								<option>리뷰</option>
								<option>공지사항</option>
							</select>
						</div>						
					</div>
					<div class="row mt-2 mb-2">
						<div class="col-md-1 pt-3">답변 상태</div>
						<div class="col-md-1">
							<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="all">
								  <label class="custom-control-label" for="all">있음</label>
							</div>
						</div>
						<div class="col-md-1 ">
							<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="all">
								  <label class="custom-control-label" for="all">없음</label>
							</div>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-1 pt-3">댓글 여부</div>
						<div class="col-md-1">
							<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="all">
								  <label class="custom-control-label" for="all">있음</label>
							</div>
						</div>
						<div class="col-md-1">
							<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="all">
								  <label class="custom-control-label" for="all">없음</label>
							</div>
						</div>						
					</div>
					<div class="row mt-3">
						<div class="col-md-1 pt-2">게시글 찾기</div>
						<div class="col-md-2">
							<select class="custom-select">
								<option selected>제목</option>
								<option>내용</option>
								<option>댓글</option>
							</select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control" style="padding-top:10px">
						</div>
					</div>
					
				</div>
				<div class="card-footer">
					<hr>
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-primary">검색</button>
							<button type="reset" class="btn btn-primary">초기화</button>
						</div>
					</div>
				</div>
				</form>
			</div>	
		</div>
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="row">
						<div class="col-md-4">
							<h6 class="card-title">
								[오늘 등록된 새글 N건]&nbsp;
								[검색 결과 N건]								
							</h6>								
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-2">
							<select class="custom-select ">
									<option selected>기본 정렬</option>
									<option>등록일순</option>																	
							</select>
						</div>
						<div class="col-md-2">
							<select class="custom-select ">
									<option selected>10개씩보기</option>
									<option>20개씩보기</option>
									<option>30개씩보기</option>															
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<!-- <button type="submit" class="btn btn-primary btn-sm">답변달기</button> -->
							<a href="AdminBbsReplyInsert.ad" class="btn btn-primary btn-sm">답변달기</a>&nbsp;&nbsp;
							<button type="button" class="btn btn-danger btn-sm">삭제</button>&nbsp;&nbsp;							
							<a  href="AdminNoticeInsert.ad" class="btn btn-primary btn-sm">공지등록</a>
						</div>											
						<div class="col-md-8"></div>
						<div class="col-md-1">
							<button type="submit" class="btn btn-primary btn-sm">엑셀다운로드</button>
						</div>
					</div>
					<hr>
				</div>
				<div class="card-body">
					<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed">
		                    <thead class="text-primary text-center">
		                      <th>		                      	
								  <div class="custom-control custom-checkbox">
									  <input type="checkbox" class="custom-control-input" id="resultChkAll">
									  <label class="custom-control-label" for="resultChkAll"></label>
								  </div>							
		                      </th>
		                      <th>
		                        	글번호
		                      </th>
		                      <th>
		                        	글분류
		                      </th>
		                      <th colspan="3">
		                        	제목
		                      </th>
		                      <th>
		                        	작성자
		                      </th>
		                      <th>
		                      		작성일
		                      </th>
		                      <th>
		                      		답변상태
		                      </th>
		                      <th>
		                      		조회수
		                      </th>		                      
		                    </thead>
		                    <tbody>
		                     <tr>
		                     </tr>		              
		                    </tbody>
		                  </table>
                		</div>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>	
	</div>
	<script>	
	 $( "#startDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    	,startDate: '-10d'
	    	,uiLibrary: 'bootstrap4'
	    	/* ,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png"
	        ,buttonImageOnly: true  */
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });
	    
	    $( "#endDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    	,startDate: '-10d'
	    	,uiLibrary: 'bootstrap4'
	    	,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png" 
	        ,buttonImageOnly: true 
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });			    	    	  
	</script>
</body>
</html>