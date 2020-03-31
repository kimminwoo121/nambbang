<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월별 매출 분석</title>
<script>
$(function(){	
	 drawChart();	
	});
	function drawChart(d1,d2){
		var chart = tui.chart;	
		// bar chart api 함수
		 if(d1 == null && d2 == null){
			  var date = new Date();
			  var start = new Date(Date.parse(date) - 365 * 1000 * 60 * 60 * 24);
			  var today = new Date(Date.parse(date) - 0 * 1000 * 60 * 60 * 24);	
			  
			  var start_yyyy = start.getFullYear();
				var start_mm = start.getMonth()+1;
				var start_dd = start.getDate();
					  
					  if(start_mm<10){
						  start_mm = "0" + start_mm; //10 보다 작으면 숫자앞에 0을 붙임
					  }if(d1_dd<10){
						  start_dd = "0" + start_dd;
					  }
					  
				var today_yyyy = today.getFullYear();
				var today_mm = today.getMonth()+1;
				var today_dd = today.getDate();
					  
					  if(today_mm<10){
						  today_mm = "0" + today_mm; 
					  }if(today_dd<10){
						  today_dd = "0" + today_dd;
					  }
					  
				d1 = start_yyyy + "-" + start_mm + "-" + start_dd;
				d2 = today_yyyy + "-" + today_mm + "-" + today_dd;
				
		}
		
		var date1 = new Date(d1);
		var date2 = new Date(d2);
		 
		var d1_yyyy = date1.getFullYear();
		var d1_mm = date1.getMonth()+1;
		var d1_dd = date1.getDate();
			  
			  if(d1_mm<10){
			   d1_mm = "0" + d1_mm; //10 보다 작으면 숫자앞에 0을 붙임
			  }if(d1_dd<10){
			   d2_dd = "0" + d1_dd;
			  }
			  
		var d2_yyyy = date2.getFullYear();
		var d2_mm = date2.getMonth()+1;
		var d2_dd = date2.getDate();
			  
			  if(d2_mm<10){
			   d2_mm = "0" + d2_mm; 
			  }if(d2_dd<10){
			   d2_dd = "0" + d2_dd;
			  }
			  
		d1 = d1_yyyy + "-" + d1_mm + "-" + d1_dd;
		d2 = d2_yyyy + "-" + d2_mm + "-" + d2_dd;
		

		console.log("d1= " + d1);
		console.log("d2= " + d2);
		
		var container = document.getElementById('chart-area');
		$.ajax("AdminAjaxSelngAnalysisMonthOk.ad",{dataType:"json", data:{startDate:d1, endDate:d2}})
		.done(function(cData){		
			var month = [];
			var profit = [];
			var refnd = [];
			var order_qy = [];
			for (i=0; i<cData.length; i++){
				//month.push(cData[i].month);
				month.push(cData[i].month.substr(0,2)+"년 "+cData[i].month.substr(4,1)+"월 ");
				profit.push(cData[i].profit/1000);
				refnd.push(cData[i].refnd/1000);
				order_qy.push(cData[i].order_qy);			
			}
			
			
	    	var data = {
	    		
	    	    categories: month,
	    	    	// 적용할 데이터
	    	    series: {
	    	        column: [
	    	            {
	    	                name: '매출(*1000원)',
	    	                data: profit
	    	            },
	    	           /*  {
	    	                name: '판매량',
	    	                data: order_qy
	    	            }, */
	    	            {
	    	                name: '환불',
	    	                data: refnd
	    	            },		    	            		    	           
	    	        ],
	    	         line: [
	    	            {
	    	                name: '판매량(개)',
	    	                data: order_qy
	    	            }
	    	        ]
	    	    }
	    	};
			
	    	var options = {
		    	    chart: {
		    	        width: 1600,
		    	        height: 500,
		    	        title: '월별 매출'
		    	    },
		    	    yAxis: [{
		    	       title: '매출(*1000원)',
		    	       chartType: 'column',
		    	       labelMargin: 15
		    	    }, {
		    	       title: '판매량(개)',
		    	       chartType: 'line',
		    	       labelMargin: 15
		    	    }],
		    	    xAxis: {
		    	        title: '날짜'
		    	    },
		    	    series: {
		    	        line: {
		    	            showDot: true
		    	        }
		    	    },
		    	    tooltip: {
		    	        grouped: true,
		    	        suffix: '*1000원/개'
		    	    }
		    	};
		    	var theme = {
		    	    series: {
		    	        column: {
		    	            colors: [
		    	                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399'
		    	            ]
		    	        },
		    	        line: {
		    	            colors: ['#333']
		    	        }
		    	    }
		    	};
		    	// For apply theme
		    	// tui.chart.registerTheme('myTheme', theme);
		    	// options.theme = 'myTheme';
		    	if($('#chart-area').children() != null){
		    		$('#chart-area').children().hide();	
		    	}
		    	var chart = tui.chart.comboChart(container, data, options);	   
		    	var tbody = $("<tbody>").attr("align","center");
		    	
		    	for(var i = 0; i <cData.length; i++){
		    		var tr1 = $("<tr>");
		    		var num = $("<td>").text(i+1);	    		
		    		var td1 = $("<td>").text(cData[i].month.substr(0,2)+"년 "+cData[i].month.substr(4,1)+"월 ");
		    		var td2 = $("<td>").text(cData[i].order_qy +" 개");
		    		var td3 = $("<td>").text(cData[i].refnd + " 원");
		    		var td4 = $("<td>").text(cData[i].profit + " 원");	    		
		    		tbody.append(tr1,num,td1,td2,td3,td4);
		    	}
		    	if($('#tbl tbody') != null){
		    		$('#tbl tbody').hide();
		    	}
		    	$("#tbl").append(tbody);
		});
		    
	};

window.addEventListener("load", function(){
	
	one_month.addEventListener("click",function(){
		dateInput(30,0);			
		if(startDate.disabled == true && endDate.disabled == true){
			startDate.disabled = false;
			endDate.disabled = false;
		}
	});
	three_month.addEventListener("click",function(){
		dateInput(90,0);
		if(startDate.disabled == true && endDate.disabled == true){
			startDate.disabled = false;
			endDate.disabled = false;
		}
	});
	six_month.addEventListener("click",function(){			
		dateInput(180,0);
		if(startDate.disabled == true && endDate.disabled == true){
			startDate.disabled = false;
			endDate.disabled = false;
		}
	});
	twelve_month.addEventListener("click",function(){			
		dateInput(365,0);
		if(startDate.disabled == true && endDate.disabled == true){
			startDate.disabled = false;
			endDate.disabled = false;
		}
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
//submit 유효성 검사
function formCheck(){
	 var d1 = new Date(startDate.value);
	 var d2 = new Date(endDate.value);
    if(frm.startDate.value > frm.endDate.value) {	             
        alert("시작날짜와 종료날짜를 확인해 주세요.");
        frm.startDate.focus();
        return false;	            	        	        	
    }
   drawChart(d1,d2);
}
</script>
</head>
<body>
	<div class="row">		
		<div class="col-md-12">
			<div class="row">				
				<div class="col-md-2">
					<nav aria-label="breadcrumb" role="navigation">
					  <ol class="breadcrumb">
		    			<li class="breadcrumb-item"><a href="adminMain.jsp">관리자 홈</a></li>
		    			<li class="breadcrumb-item active" aria-current="page">월별 매출 관리</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
				<form id="frm" name="frm" method="post" action="">
				<div class="card-header">
					<h6 class="h6">매출 관리</h6>
					<hr>
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link" href="AdminSelngAnalysisDay.ad">일별매출</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="AdminSelngAnalysisWeek.ad">주별매출</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" href="#">월별매출</a>
					  </li>				  
					</ul>				
											
				</div>
				<div class="card-body">
					<div class="row ">
							<div class="col-md-1 pt-3 text-center row-st">검색기간</div>
							<div class="col-md-3 pt-1 row-st">
								<button type="button" class="btn btn-primary btn-sm" id="one_month" name="one_month">1개월</button>											
								<button type="button" class="btn btn-primary btn-sm" id="three_month" name="three_month">3개월</button>
								<button type="button" class="btn btn-primary btn-sm" id="six_month" name="six_month">6개월</button>
								<button type="button" class="btn btn-primary btn-sm" id="twelve_month" name="twelve_month">12개월</button>																			
							</div>
							<!-- datepicker -->
							<div class="col-md-2 pt-1 row-st"> 						
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
							<span class="pt-3">
							 ~
							</span>
							<!-- datepicker -->
							<!-- <div class="col-md-1 row-st">~</div> -->
							<div class="col-md-2 pt-1 row-st"> 
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
					</div>
												 
				</div>
				<div class="card-footer">
					<hr>
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-primary btn-sm" onclick="formCheck()">검색</button>											
							<button type="reset" class="btn btn-primary btn-sm">초기화</button>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h6 class="h6">매출 통계</h6>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
					<!-- bar chart api -->
						<div id="col-md-12">
							<div id="chart-area"></div>
						</div>
					</div>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="row">
							<div class="col-1 row-st text-center">
								<h6 class="h6" id="cnt" name="cnt"></h6>								
							</div>
							<div class="col-7">								
							</div>
							<div class="col-2 row-st">
																
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
							<div class="col-md-1 row-st text-center">
								
							</div>
							<div class="col-md-1 row-st text-center">
								
							</div>
							<div class="col-md-2 row-st">
								
							</div>
							<div class="col-md-7 row-st"></div>
							<div class="col-md-1 row-st">
								<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>
							</div>
						</div>
						<hr>
				</div>
				<div class="card-body">
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed" id="tbl" name="tbl">
		                    <thead class="text-primary text-center">
		                     <tr>	
		                      <th>번호</th>	                     
		                      <th>일자</th>
		                      <th>판매수량</th>
		                      <th>환불액</th>
		                      <th>매출액</th>
		                    </tr>
		                    </thead>
		                   
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
	  //검색 조건 고정
/* 	    if(${adDto != null}){			    	
	    	$("[name='startDate']").val(['${adDto.sDate}']);
	    	$("[name='endDate']").val(['${adDto.eDate}']);	    					    		 	 		    	 	    	
	    	$("[name='pageCnt']").val(['${pDto.pageUnit}']);
	    	};  	    	  */   		   
	</script>
</body>
</html>