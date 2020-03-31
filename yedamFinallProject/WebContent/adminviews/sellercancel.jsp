<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 취소 신청</title>
<script>
	window.addEventListener("load", function(){
			
		 day.addEventListener("click",function(){
			dateInput(0,0);			
			if(startDate.disabled == true && endDate.disabled == true){
				startDate.disabled = false;
				endDate.disabled = false;
			}
		});
		t_day.addEventListener("click",function(){
			dateInput(3,0);
			if(startDate.disabled == true && endDate.disabled == true){
				startDate.disabled = false;
				endDate.disabled = false;
			}
		});
		s_day.addEventListener("click",function(){			
			dateInput(7,0);
			if(startDate.disabled == true && endDate.disabled == true){
				startDate.disabled = false;
				endDate.disabled = false;
			}
		});
		o_mon.addEventListener("click",function(){			
			dateInput(30,0);
			if(startDate.disabled == true && endDate.disabled == true){
				startDate.disabled = false;
				endDate.disabled = false;
			}
		});
		t_mon.addEventListener("click",function(){
			dateInput(90,0);
			if(startDate.disabled == true && endDate.disabled == true){
				startDate.disabled = false;
				endDate.disabled = false;
			}
		});
		s_mon.addEventListener("click",function(){
			dateInput(180,0);
			if(startDate.disabled == true && endDate.disabled == true){
				startDate.disabled = false;
				endDate.disabled = false;
			}
		});
		o_year.addEventListener("click",function(){
			dateInput(365,0);
			if(startDate.disabled == true && endDate.disabled == true){
				startDate.disabled = false;
				endDate.disabled = false;
			}
		});
		d_all.addEventListener("click",function(){
			dateInput(365*2,0);
			startDate.setAttribute("disabled",true);
			endDate.setAttribute("disabled",true);
		});
	});
	 //날짜 계산
	 function dateInput(n,m){
		  startDate.value = "";
		  endDate.value = "";
		  
		  var date = new Date();
		  var start = new Date(Date.parse(date) - n * 1000 * 60 * 60 * 24);
		  var today = new Date(Date.parse(date) - m * 1000 * 60 * 60 * 24);
		  
		  var yyyy = start.getFullYear();
		  var mm = start.getMonth()+1;
		  var dd = start.getDate();
		  
		  if(mm<10){
		   mm = "0" + mm; //10 보다 작으면 숫자앞에 0을 붙임
		  }if(dd<10){
		   dd = "0" + dd;
		  }
		  
		  var t_yyyy = today.getFullYear();
		  var t_mm = today.getMonth()+1;
		  var t_dd = today.getDate();
		  
		  if(t_mm<10){
		   t_mm = "0" + t_mm;
		  }if(t_dd<10){
		   t_dd = "0" + t_dd;
		  }
		  
		  startDate.value = yyyy + "-" + mm + "-" + dd;
		  endDate.value = t_yyyy + "-" + t_mm + "-" + t_dd;
		  
		 }
	 // submit 유효성 검사
	 function formCheck(){
		 var d1 = new Date(startDate.value);
		 var d2 = new Date(endDate.value);
	        if(frm.startDate.value > frm.endDate.value) {	             
	            alert("시작날짜와 종료날짜를 확인해 주세요.");
	            frm.startDate.focus();
	            return false;	            	        	        	
	        }
	        if(frm.rTime.value > frm.eTime.value) {
	        	alert("등록시간과 판매종료시간을 확인해 주세요.");
	        	frm.rTime.focus();
	        	return false;
	        }
	 }
	
	 
	 
</script>
</head>
<body>
<form id="frm" name="frm" method="post" action="AdminSellerCancelOk.ad" onsubmit="return formCheck()">
	<input type="hidden" name="page" value="1">
	<div class="row ">
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
					    			<li class="breadcrumb-item active" aria-current="page">판매자 취소관리</li>		    			
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
		</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-12">

				<div class="card" >
					<div class="card-header">
						<h6 class="card-title">판매자 취소 관리</h6>
						<hr>
						<ul class="nav nav-tabs">
						  <li class="nav-item">
						    <a class="nav-link" href="AdminSellerManage.ad">판매자 관리</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link active" href="#">판매자 취소관리 </a>
						  </li>						  
						</ul>									
					</div>
					<div class="card-body"> <!-- 첫번째 카드 바디 시작 -->
						<div class="row ">
							<div class="col-md-1 pt-3 row-st">검색어</div> <!-- 첫줄끝 -->
							<div class="col-md-2 pt-2 row-st">
								<select class="custom-select" id="ctg1" name="ctg1">									
									<option value="seler_id" selected>판매자ID</option>																		
									<option value="goods_id">상품번호</option>									
									<option value="goods_name">상품명</option>
									<option value="sle_id">판매번호</option>
								</select>
							</div> 
							<div class="col-md-6 ml-2 row-st" style="padding-top:10px">
								<input type="text" class="form-control" id="s_word1" name="s_word1">
							</div> 
							
							<div class="col-md-1 pt-1 row-st">
								<div class="form-group">
								<button type="button" class="btn btn-primary btn-sm">+</button>
								<button type="button" class="btn btn-primary btn-sm">-</button>
								</div>
							</div>
							
						</div> <!-- 첫줄끝 -->
						<div class="row">
							<div class="col-md-1 row-st"><p class="mt-2 pt-1">검색기간</p></div>
							<div class="col-md-4 row-st">
								<button type="button" class="btn btn-primary btn-sm" id="day" name="day">오늘</button>											
								<button type="button" class="btn btn-primary btn-sm" id="t_day" name="t_day">3일</button>
								<button type="button" class="btn btn-primary btn-sm" id="s_day" name="s_day">7일</button>
								<button type="button" class="btn btn-primary btn-sm" id="o_mon" name="o_mon">1개월</button>
								<button type="button" class="btn btn-primary btn-sm" id="t_mon" name="t_mon">3개월</button>
								<button type="button" class="btn btn-primary btn-sm" id="s_mon" name="s_mon">6개월</button>
								<button type="button" class="btn btn-primary btn-sm" id="o_year" name="o_year">1년</button>																					
								<button type="button" class="btn btn-primary btn-sm" id="d_all" name="d_all">전체</button>
							</div>
							<div class="col-md-2 pt-1 row-st">
																
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
							<span class="pt-3">~</span>
							<div class="col-md-2 pt-1 row-st">
								
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="endDate" name="endDate" placeholder="종료일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="endDate" class="fa fa-calendar" style="cursor:pointer;">
								    			<!-- <i class="fa fa-calendar"></i> -->
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>
							</div>
						</div>	<!-- 둘째라인 끝 -->
						<div class="row ">
							<div class="col-md-1 pt-3 row-st">상품</div> 
							<div class="col-md-2 pt-2 row-st">
								<select class="custom-select" id="ctg2" name="ctg2">
									<option value="goods_name" selected >상품명</option>
									<option value="goods_id">상품번호</option>									
									<option value="sle_id">판매번호</option>
								</select>
							</div> 
							<div class="col-md-6 ml-2 row-st" style="padding-top:10px;">
								<input type="text" class="form-control" id="s_word2" name="s_word2">
							</div> 
							
							<div class="col-md-1 pt-1 row-st">
								<div class="form-group">
								<button type="button" class="btn btn-primary btn-sm">+</button>
								<button type="button" class="btn btn-primary btn-sm">-</button>
								</div>
							</div>
						</div><!-- 셋째라인 끝 -->
						<div class="row">
							<div class="col-md-1 pt-3 row-st">취소상태</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="All" name="stat_chk1" value="All">
								  <label class="custom-control-label" for="All">전체</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="R" name="stat_chk1" value="R">
								  <label class="custom-control-label" for="R">취소신청</label>
								</div>

							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="C" name="stat_chk1" value="C">
								  <label class="custom-control-label" for="C">취소완료</label>
								</div>
							</div>
							<div class="col-md-1 row-st"></div>
							<div class="col-md-1 row-st"></div>
							
							
						</div>
						<div class="row ">
							
						</div><!-- 넷째라인 끝 -->
					</div>						 
					<div class="card-footer">						
					<hr>
						<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-primary">검색</button>&nbsp;
								<button type="reset" class="btn btn-primary">취소</button>
						</div>
					</div>
				</div>
			
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<div class="col-1 row-st">
								<h6 class="h6"><c:if test="${pDto.totalCnt != null }">[총  ${pDto.totalCnt }건]</c:if></h6>								
							</div>
							<div class="col-7">								
							</div>
							<div class="col-2 row-st">
								<select class="custom-select" id="sort" name="sort">
									<option value="gs.rgsde desc" selected>최신순</option>																	
									<option value="gr.goods_name">상품명 순</option>
									<option value="gr.goods_id">상품ID순</option>
									<option value="gc.cancl_de desc">취소일순</option>
								</select>								
							</div>
							<div class="col-2 row-st">
								<select class="custom-select" id="pageCnt" name="pageCnt">
									<option value="10" selected>10개씩보기</option>
									<option value="20">20개씩보기</option>
									<option value="30">30개씩보기</option>															
								</select>									
							</div>
						</div>
						<div class="row">
							<div class="col-md-2 row-st text-center">
								<select class="custom-select mt-1">
									<option value="#">취소 승인 여부</option>
									<option value="C">취소 승인</option>
								</select>
							</div>
							<div class="col-md-1 row-st text-left">
									<button type="button" class="btn btn-danger btn-sm">적용</button>
							</div>
							<div class="col-md-2 row-st">
								
							</div>
							<div class="col-md-6 row-st"></div>
							<div class="col-md-1 row-st pr-1">
								<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>
							</div>
						</div>
						<hr>
					</div>
					
					<div class="card-body">
					
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed text-center">
		                    <thead class="text-primary">
		                    	<tr>
			                      <th>		                      	
									  <div class="custom-control custom-checkbox">
										  <input type="checkbox" class="custom-control-input" id="resultChkAll">
										  <label class="custom-control-label" for="resultChkAll"></label>
									  </div>							
			                      </th>		
			                      <th>취소처리상태</th>			                    
			                      <th>판매자ID</th>
			                      <th>판매번호</th>
			                      <th>상품명</th>
			                      <th>상호명</th>
			                      <th>판매가격(개당)</th>
			                      <th>등록일시</th>
			                      <th>취소사유</th>
			                      <th>취소일시</th>			                      	                      
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
									<c:if test="${map.get('goos_sle_result').equals('C') }"><td>취소완료</td></c:if>																											
									<c:if test="${map.get('goos_sle_result').equals('R') }"><td style="color: #ed5565">취소신청</td></c:if>
									<td>${map.get("seler_id") }</td>
									<td>${map.get("sle_id") }</td>																		
									<td>${map.get("goods_name") }</td>	
									<td>${map.get("cmpnm") }</td>
									<td>${map.get("sle_pc") }</td>
									<td>${map.get("rgsde") }</td>
									<td>${map.get("cancl_resn") }</td>
									<c:if test="${empty map.get('cancl_de') }"><td style="color:#ed5565">취소 승인 요청중</td></c:if>
									<c:if test="${!empty map.get('cancl_de') }"><td>${map.get("cancl_de") }</td></c:if>
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
			</div>
		</div>
	</form>		
	<script>	
	 $( "#startDate" ).datepicker({
	    	dateFormat: 'yyyy-mm-dd'
	    	/* ,startDate: '-10d' */
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
	    	/* ,startDate: '-10d' */
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
		if(${scDto != null}){		
	    	$("select[name='ctg1']").val(['${scDto.sCtg1}']);
	    	$("select[name='ctg2']").val(['${scDto.sCtg2}']);	    	
	    	$("[name='s_word1']").val(['${scDto.sName1}']);	    	
	    	$("[name='s_word2']").val(['${scDto.sName2}']);	    	
	    	$("[name='startDate']").val(['${scDto.sDate}']);
	    	$("[name='endDate']").val(['${scDto.eDate}']);	    					    		 	 	 
	    	$("[name='stat_chk1']").val(['${scDto.sStat1}']);	    		
	    	$("[name='sort']").val(['${scDto.sort}']);
	    	$("[name='pageCnt']").val(['${pDto.pageUnit}']);
	    	};
	</script>
	
</body>
</html>