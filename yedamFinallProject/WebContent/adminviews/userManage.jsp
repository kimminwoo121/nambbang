<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
	<form id="frm" name="frm" class="form-horizontal" method="post" action="AdminUserManageOk.ad" onsubmit="return formCheck()">
	<input type="hidden" name="page" value="1">
	<div class="row">
		<div class="col-md-12">
			<div class="row">				
				<div class="col-md-2 ml-3">
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
		    			<li class="breadcrumb-item"><a href="adminMain.jsp">관리자 홈</a></li>
		    			<li class="breadcrumb-item active" aria-current="page">사용자 관리</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-md-12">			
			<div class="col-md-12">
				
				<div class="card">
					<div class="card-header">						
						<h6 class="card-title">
							사용자 관리
						</h6>
						<hr>
					</div>
					<div class="card-body"> <!-- 첫번째 카드 바디 시작 -->
						<div class="row">
							<div class=" col-md-1 pt-3 row-st ">검색어</div> <!-- 첫줄끝 -->
							<div class="col-md-2 row-st" style="padding-top:10px">
								<input type="text" class="form-control " value="사용자ID" readonly>
							</div> 
							<div class="col-md-6 row-st" style="padding-top:10px">
								<input type="text" class="form-control " id="s_word1" name="s_sword1">
							</div> 
							
							<div class="col-md-1 pt-1 row-st">
								<div class="form-group">
								<button type="button" class="btn btn-primary btn-sm">+</button>
								<button type="button" class="btn btn-primary btn-sm">-</button>
								</div>
							</div>
							
						</div> <!-- 첫줄끝 -->
						<div class="row ">							
							<div class="col-md-1 row-st" style="padding-top:10px">사용자 상태</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="stat_all" name="stat_chk" value="all">
								  <label class="custom-control-label" for="stat_all">전체</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="normal" name="stat_chk" value="UNO">
								  <label class="custom-control-label" for="normal">일반</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="sleep" name="stat_chk" value="UDR">
								  <label class="custom-control-label" for="sleep">휴면</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="punish" name="stat_chk" value="UDS">
								  <label class="custom-control-label" for="punish">징계</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="signout" name="stat_chk" value="USE">
								  <label class="custom-control-label" for="signout">탈퇴</label>
								</div>
							</div>
							<!-- <div class="col-md-1 pt-2 row-st">주문상품</div>
							<div class="col-md-2 row-st" style="padding-top:5px">
								<input type="text" class="form-control" id="s_word2" name="s_word2">
							</div> 
							<div class="col-md-1 row-st" >
								<button type="button" class="btn btn-primary btn-sm">상품 검색</button>
							</div> -->
						</div>	<!-- 둘째라인 끝 -->
						<div class="row mt-3">
							<div class="col-md-1 pt-2 row-st">가입일 / 생일</div>
							<div class="col-md-2 row-st">							
								<select class="custom-select" id="ctg1" name="ctg1">
									<option selected>전체</option>
									<option value="srbde">가입일</option>
									<option value="user_brthdy">생일</option>
								</select>						
							</div>
							<div class="col-md-2 row-st">
								<!-- <input type="text" class="form-con	trol" id="startDate" style="width:150px"> -->								
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
							<div class="col-md-2 row-st">
								<!-- <input type="text" class="form-control" id="endDate" style="width:150px"> -->
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
							<!-- <div class="col-md-3"></div>
							<div class="col-md-1 pt-2 row-st"></div>
							<div class="col-md-2 row-st">
								
							</div>
							<div class="col-md-3"></div> -->
						</div>
						
						<div class="row ">
							<div class="col-md-1 pt-3 row-st">나이대</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="ageAll" name="chk_age">
								  <label class="custom-control-label" for="ageAll">전체</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="age10" name="chk_age" value="between 10 and 20">
								  <label class="custom-control-label" for="age10">10대</label>
								</div>

							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="age20" name="chk_age" value="between 20 and 30">
								  <label class="custom-control-label" for="age20">20대</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="age30" name="chk_age" value="between 30 and 40">
								  <label class="custom-control-label" for="age30">30대</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="age40" name="chk_age" value="between 40 and 50">
								  <label class="custom-control-label" for="age40">40대</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="age50" name="chk_age" value="between 50 and 60">
								  <label class="custom-control-label" for=age50>50대</label>
								</div>
							</div>
							<div class="col-md-1 row-st">
								<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="over50" name="chk_age" value="61">
								  <label class="custom-control-label" for="over50">60대 이상</label>
								</div>
							</div>
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
									<option value="u.srbde desc" selected>최신 가입일순</option>
									<option value="u.srbde desc">가입일순</option>
									<option value="s.setle_amount desc">구매금액순</option>
									<option value="age">나이순</option>
									
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
								<select class="custom-select" id="stat_change" name="stat_change">
									<option selected>상태 변경</option>
									<option value="UNO">일반</option>
									<option value="UDS">징계</option>
									<option value="UDR">휴면</option>															
									<option value="USE">탈퇴</option>
								</select>
							</div>
							
							<div class="col-md-2 row-st">
								<button type="button" class="btn btn-danger btn-sm">적용</button>
							</div>
							<div class="col-md-7 row-st"></div>
							<div class="col-md-1 row-st">
								<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>
							</div>
						</div>
					</div>
					
					<div class="card-body">
					<hr>
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed">
		                    <thead class="text-primary">
		                    <tr align="center">
		                      <th>		                      	
								  <div class="custom-control custom-checkbox">
									  <input type="checkbox" class="custom-control-input" id="resultChkAll">
									  <label class="custom-control-label" for="resultChkAll"></label>
								  </div>							
		                      </th>		                      
			                      <th>ID</th>
								  <th>이름</th>
								  <th>생일</th>
								  <th>나이</th>
								  <th>가입일</th>
								  <th>상태</th>
								  <th>구매금액</th>								  
								  <th>주문수</th>								  
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
									<td>${map.get("user_id") }</td>
									<td>${map.get("user_name") }</td>
									<td>${map.get("user_brthdy") }</td>
									<td>${map.get("age") }</td>
									<td>${map.get("srbde") }</td>									
									<c:if test="${map.get('user_sttus').equals('UNO') }"><td>일반</td></c:if>
									<c:if test="${map.get('user_sttus').equals('UDR') }"><td>휴면</td></c:if>
									<c:if test="${map.get('user_sttus').equals('UDS') }"><td>징계</td></c:if>
									<c:if test="${map.get('user_sttus').equals('USE') }"><td>탈퇴</td></c:if>
									<td>${map.get("order_amount") }</td>
									<td>${map.get("order_cnt") }</td>									
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
		//검색 조건 고정
	    if(${uDto != null}){		
	    	$("select[name='ctg1']").val(['${uDto.uCtg1}']);
	    	$("[name='s_word1']").val(['${uDto.uName1}']);	    	
	    	$("[name='startDate']").val(['${uDto.sDate}']);
	    	$("[name='endDate']").val(['${uDto.eDate}']);	    					    		 	 	 
	    	$("[name='stat_chk']").val(['${uDto.uStat1}']);
	    	$("[name='chk_age']").val(['${uDto.uStat2}']);
	    	$("[name='sort']").val(['${uDto.sort}']);
	    	$("[name='pageCnt']").val(['${pDto.pageUnit}']);
	    	};
	</script>
</body>
</html>