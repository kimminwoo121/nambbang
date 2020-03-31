<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 관리</title>
<script>
// submit 유효성 검사
function formCheck(){
	 var d1 = new Date(startDate.value);
	 var d2 = new Date(endDate.value);
       if(frm.startDate.value > frm.endDate.value) {	             
           alert("시작날짜와 종료날짜를 확인해 주세요.");
           frm.startDate.focus();
           return false;	            	        	        	
       }
      
}
</script>
</head>
<body>
	<form id="frm" name="frm" class="form-horizontal" method="post" action="AdminSellerManageOk.ad" onsubmit="return formCheck()">
		<input type="hidden" name="page" value="1">
	<div class="row">
		<div class="col-md-12">
			<div class="row" style="padding: 0 30px">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12">
						<div class="row">				
							<div class="col-md-4">
								<nav aria-label="breadcrumb" role="navigation">
								  <ol class="breadcrumb">
					    			<li class="breadcrumb-item"><a href="AdminMain.ad">관리자 홈</a></li>
					    			<li class="breadcrumb-item active" aria-current="page">판매자 정보관리</li>		    			
					  			 </ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 ">				
				
			</div>					
			<div class="col-md-3">
						<div class="card card-stats">
			              <div class="card-body ">
			                <div class="row">
			                  <div class="col-5 col-md-4">
			                    <div class="icon-big text-center icon-warning">
			                      <i class="fas fa-receipt text-danger"></i>
			                    </div>
			                  </div>
			                  <div class="col-7 col-md-8">
			                    <div class="numbers">
			                      <p class="card-category">취소신청</p>
			                      <p class="card-title">총 ${cancelCnt }건 <br>
			                        <p>
			                    </div>
			                  </div>
			                </div>
			              </div>
			              <div class="card-footer ">
			                <hr>
			                <div class="stats">
			                  <i class="fa fa-clock-o"></i> In the last hour
			                </div>
			              </div>
			            </div>	
		    </div>	
			</div>
		<div class="col-md-12">
			
			<div class="col-md-12">
				
				<div class="card" id="card1-cell" >
					<div class="card-header">						
						
						<h6 class="card-title">판매자 관리</h6>
						<hr>
						<ul class="nav nav-tabs">
						  <li class="nav-item">
						    <a class="nav-link active" href="#">판매자 관리</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="AdminSellerCancel.ad">판매자 취소관리</a>
						  </li>						  
						</ul>											
					</div>
					<div class="card-body">
						
						<div class="row">
							<div class="col-md-1 pt-3">검색어</div>
							<div class="col-md-2 pt-2">
								<select class="custom-select" id="ctg1" name="ctg1">
									<option value="seler_id">판매자ID</option>									
									<option value="sle_id">판매번호</option>
									<option value="goods_id">상품번호</option>
									<option value="goods_name">상품명</option>
									<option value="cmpnm">상호명</option>									
								</select>
							</div>
							
							<div class="col-md-4 ml-2" style="padding-top:10px">
								<input type="text" class="form-control " id="s_word1" name="s_word1">
							</div> 
							
							
						</div> <!-- 첫줄끝 -->
						<div class="row ">							
							<div class="col-md-1" style="padding-top:10px">판매자 상태</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="sAll" name="stat_chk1" value="sAll">
								  <label class="custom-control-label" for="sAll">전체</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="SNO" name="stat_chk1" value="SNO">
								  <label class="custom-control-label" for="SNO">일반</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="SDR" name="stat_chk1" value="SDR">
								  <label class="custom-control-label" for="SDR">휴면</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="SSE" name="stat_chk1" value="SSE">
								  <label class="custom-control-label" for="SSE">탈퇴</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="SDS" name="stat_chk1" value="SDS">
								  <label class="custom-control-label" for="SDS">징계</label>
								</div>
							</div>
							
							<!-- <div class="col-md-1">
								<button type="button" class="btn btn-primary btn-sm">상품 검색</button>
							</div> -->
						</div>	<!-- 둘째라인 끝 -->
						<div class="row mt-3">
							<div class="col-md-1 pt-2">가입일</div>
							<div class="col-md-2 ">							
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="startDate" name="startDate" placeholder="시작일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="startDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>								
							</div>
							<span class="pt-2">~</span>		
							<div class="col-md-2">
								<!-- <input type="text" class="form-con	trol" id="startDate" style="width:150px"> -->								
								<div class="input-group date" >																 
								    <input type="text" class="form-control" id="endDate" name="endDate" placeholder="종료일">
								    <div class="input-group-append" >
								    	<div class="input-group-text">
								    		<label for="endDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>
								 	</div>
							    </div>
							</div>
							
							<div class="col-md-2 ">
																
								
							</div>
							<div class="col-md-3"></div>
						</div>
						<div class="row">
							<div class="col-md-1 pt-2">판매자등급</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="gAll" name="stat_chk2" value="gAll">
								  <label class="custom-control-label" for="gAll">전체</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="B" name="stat_chk2" value="B">
								  <label class="custom-control-label" for="B">브론즈</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="S" name="stat_chk2" value="S">
								  <label class="custom-control-label" for="S">실버</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="G" name="stat_chk2" value="G">
								  <label class="custom-control-label" for="G">골드</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="P" name="stat_chk2" value="P">
								  <label class="custom-control-label" for="P">플래티넘</label>
								</div>
							</div>
							<div class="col-md-1">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="D" name="stat_chk2" value="D">
								  <label class="custom-control-label" for="D">다이아</label>
								</div>
							</div>
							
						</div>						
					</div>						 
					<div class="card-footer">						
					<hr>
						<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-primary">검색</button>&nbsp;
								<button type="reset" class="btn btn-primary">초기화</button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-12">
				<!-- <form id="frm2" name="frm2" method="post" action=""> -->
					<div class="card" id="card1-cell">
						<div class="card-header">
							<div class="row">
								<div class="col-1">
									<h6 class="h6"><c:if test="${pDto.totalCnt != null }">[총  ${pDto.totalCnt }건]</c:if></h6>								
								</div>
								<div class="col-7">								
								</div>
								<div class="col-2 ">
									<select class="custom-select" id="sort" name="sort">
										<option value="s.srbde desc" selected>최신순</option>
										<option value="s.srbde">가입일순</option>																				
										<option value="s.seler_id">판매자ID순</option>
										<option value="s.seler_grad desc">판매등급순</option>										
									</select>								
								</div>
								<div class="col-2 ">
									<select class="custom-select" id="pageCnt" name="pageCnt">
										<option value="10" selected>10개씩보기</option>
										<option value="20">20개씩보기</option>
										<option value="30">30개씩보기</option>															
									</select>									
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 text-center">
									<select class="custom-select mt-1">
										<option selected>상태 변경</option>
										<option>일반</option>
										<option>징계</option>
										<option>휴면</option>															
										<option>탈퇴</option>
									</select>
								</div>
								<div class="col-md-2">
									<select class="custom-select mt-1">
										<option selected>등급 변경</option>
										<option>브론즈</option>
										<option>실버</option>
										<option>골드</option>															
										<option>플래티넘</option>
										<option>다이아</option>
									</select>
								</div>
								<div class="col-md-1">
									<button type="button" class="btn btn-danger btn-sm">적용</button>
								</div>
								<div class="col-md-6"></div>
								<div class="col-md-1 ">
									<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>
								</div>
							</div>
							<hr>
						</div>
						
						<div class="card-body">			
								
							<div class="table-responsive" style="overflow:hidden;">
			                  <table class="table table-hover table-condensed">
			                    <thead class="text-primary text-center">
			                    <tr>
				                      <th class="text-center">		                      	
										  <div class="custom-control custom-checkbox">
											  <input type="checkbox" class="custom-control-input" id="resultChkAll">
											  <label class="custom-control-label" for="resultChkAll"></label>
										  </div>							
				                      </th>
				                      <th>판매자 ID</th>
									  <th>상호명</th>
									  <th>가입일</th>
									  <th>연락처</th>
									  <th>주소</th>		
									  <th>판매자등급</th>							 
									  <th>판매자상태</th>									  									
			                      </tr>
			                    </thead>
			                    <tbody>
			                     <c:forEach var="map" items="${list }">
								<tr class="text-center">
									<td>
										<div class="custom-control custom-checkbox text-center">
											  <input type="checkbox" class="custom-control-input" id="" name="result_chk">
											  <label class="custom-control-label" for=""></label>
								  		</div>	
									</td>
									<td>${map.get("seler_id") }</td>
									<td>${map.get("cmpnm") }</td>
									<td>${map.get("srbde") }</td>
									<td>${map.get("seller_telno") }</td>
									<td>${map.get("mtlty_lc") }</td>									
									<c:if test="${map.get('seler_grad').equals('B') }"><td>브론즈</td></c:if>
									<c:if test="${map.get('seler_grad').equals('S') }"><td>실버</td></c:if>
									<c:if test="${map.get('seler_grad').equals('G') }"><td>골드</td></c:if>
									<c:if test="${map.get('seler_grad').equals('P') }"><td>플래티넘</td></c:if>
									<c:if test="${map.get('seler_grad').equals('D') }"><td>다이아</td></c:if>
									<c:if test="${map.get('seler_sttus').equals('SNO') }"><td>일반</td></c:if>
									<c:if test="${map.get('seler_sttus').equals('SDR') }"><td>휴면</td></c:if>
									<c:if test="${map.get('seler_sttus').equals('SDS') }"><td>징계</td></c:if>
									<c:if test="${map.get('seler_sttus').equals('SSE') }"><td>탈퇴</td></c:if>
																		
								</tr>								
					 	      </c:forEach>		              
			                    </tbody>
			                  </table>
	                		</div>
	                		<div class="row">
                			
	                			<div class="col-md-12 text-center">
	                				<c:forEach begin="1" end="${pDto.lastPage }" var="i">
											<a href="#" onclick="goPage(${i})">${i }</a>
									</c:forEach>
	                			</div>
                			</div>
						</div>
					</div>
				<!-- </form> -->
			</div>
		</div>
		</div>
	</div>
	</form>			
	<script>	
	 $( "#startDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	   /*  	,startDate: '-10d' */
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
	    /* 	,startDate: '-10d' */
	    	,uiLibrary: 'bootstrap4'
	    	,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png" 
	        ,buttonImageOnly: true 
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });
	    	   
	    function goPage(p){
			frm.page.value = p;
			frm.submit();
		};
		if(${sDto != null}){		
	    	$("select[name='ctg1']").val(['${sDto.sCtg1}']);
	    	$("select[name='ctg2']").val(['${sDto.sCtg2}']);	    	
	    	$("[name='s_word1']").val(['${sDto.sName1}']);	    	
	    	$("[name='s_word2']").val(['${sDto.sName2}']);	    	
	    	$("[name='startDate']").val(['${sDto.sDate}']);
	    	$("[name='endDate']").val(['${sDto.eDate}']);	    					    		 	 	 
	    	$("[name='stat_chk1']").val(['${sDto.sStat1}']);
	    	$("[name='stat_chk2']").val(['${sDto.sStat2}']);	
	    	$("[name='sort']").val(['${sDto.sort}']);
	    	$("[name='pageCnt']").val(['${pDto.pageUnit}']);
	    	};
	</script>
</body>
</html>