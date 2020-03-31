<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자별  분석통계</title>
<script>
$(function(){
	drawDonutChart1();
	drawDonutChart2();
});
function drawDonutChart1(d1,d2){
	var chart = tui.chart;	
	var container1 = document.getElementById('chart-area1');
	
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
	
	$.ajax("AdminAjaxSellerAnalysQyOk.ad",{dataType:"json", data:{startDate:d1, endDate:d2}})
	.done(function(cData){		
		
	console.log(cData);		
	var data1 = {
	    categories: ['판매자'],
	    //데이터
	    series: [
	    	 {
		            name: cData[0].cmpnm,
		            data: cData[0].percent
		        },
		        {
		            name: cData[1].cmpnm,
		            data: cData[1].percent
		        },
		        {
		            name: cData[2].cmpnm,
		            data: cData[2].percent
		        },
		        {
		            name: cData[3].cmpnm,
		            data: cData[3].percent
		        },
		        {
		            name: cData[4].cmpnm,
		            data: cData[4].percent
		        },
		        {
		            name: cData[5].cmpnm,
		            data: cData[5].percent
		        },
		        {
		            name: cData[6].cmpnm,
		            data: cData[6].percent
		        },
		        {
		            name: cData[7].cmpnm,
		            data: cData[7].percent
		        },
		        {
		            name: cData[8].cmpnm,
		            data: cData[8].percent
		        },
		        {
		            name: cData[9].cmpnm,
		            data: cData[9].percent
		        }
	    ]
	};
	
	var options1 = {
	    chart: {
	        width: 770,
	        height: 500,
	        title: '상위 TOP10 판매자 (판매수량)',
	        format: function(value, chartType, areaType, valuetype, legendName) {
	            if (areaType === 'makingSeriesLabel') { // formatting at series area
	                value = value + '%';
	            }

	            return value;
	        }
	    },
	    series: {
	        radiusRange: ['40%', '100%'],
	        showLabel: true
	    },
	    tooltip: {
	        suffix: '%'
	    },
	    legend: {
	        align: 'bottom'
	    }
	};
	
	var theme = {
	    series: {
	        series: {
	            colors: [
	                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
	                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
	            ]
	        },
	        label: {
	            color: '#fff',
	            fontFamily: 'sans-serif'
	        }
	    }
	};

	// For apply theme
	tui.chart.registerTheme('myTheme', theme);
	options1.theme = 'myTheme';	
	if($('#chart-area1').children() != null){
		$('#chart-area1').children().hide();	
	}
	tui.chart.pieChart(container1, data1, options1);
	
	$("#tbl1_p").text("[기간: "+ d1 + " ~ " + d2 + " ]");
	$("#chart1_p").text("[기간: "+ d1 + " ~ " + d2 + " ]");
	var tbody = $("<tbody>").attr("align","center");
	
	for(var i = 0; i <cData.length; i++){
		var tr1 = $("<tr>");
		var num = $("<td>").text(i+1);	    		
		var td1 = $("<td>").text(cData[i].cmpnm);
		var td2 = $("<td>").text(cData[i].order_qy +" 개");
		var td3 = $("<td>").text(cData[i].percent + " %");			    		
		tbody.append(tr1,num,td1,td2,td3);
	}
	if($('#tbl1 tbody') != null){
		$('#tbl1 tbody').hide();
	}
	$("#tbl1").append(tbody);
	
	});
}
function drawDonutChart2(d1,d2){
	var chart = tui.chart;
	var container2 = document.getElementById('chart-area2');
	
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
	$.ajax("AdminAjaxSellerAnalysAmountOk.ad",{dataType:"json", data:{startDate:d1, endDate:d2}})
	.done(function(cData){		
	console.log(cData);	
	var data2 = {
		    categories: ['판매자'],
		    series: [
		    	{
		            name: cData[0].cmpnm,
		            data: cData[0].percent
		        },
		        {
		            name: cData[1].cmpnm,
		            data: cData[1].percent
		        },
		        {
		            name: cData[2].cmpnm,
		            data: cData[2].percent
		        },
		        {
		            name: cData[3].cmpnm,
		            data: cData[3].percent
		        },
		        {
		            name: cData[4].cmpnm,
		            data: cData[4].percent
		        },
		        {
		            name: cData[5].cmpnm,
		            data: cData[5].percent
		        },
		        {
		            name: cData[6].cmpnm,
		            data: cData[6].percent
		        },
		        {
		            name: cData[7].cmpnm,
		            data: cData[7].percent
		        },
		        {
		            name: cData[8].cmpnm,
		            data: cData[8].percent
		        },
		        {
		            name: cData[9].cmpnm,
		            data: cData[9].percent
		        }
		    ]
		};
	var options2 = {
		    chart: {
		        width: 770,
		        height: 500,
		        title: '상위 TOP10 판매자 (판매합계)',
		        format: function(value, chartType, areaType, valuetype, legendName) {
		            if (areaType === 'makingSeriesLabel') { // formatting at series area
		                value = value + '%';
		            }

		            return value;
		        }
		    },
		    series: {
		        radiusRange: ['40%', '100%'],
		        showLabel: true
		    },
		    tooltip: {
		        suffix: '%'
		    },
		    legend: {
		        align: 'bottom'
		    }
		};
	var theme = {
		    series: {
		        series: {
		            colors: [
		                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
		                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
		            ]
		        },
		        label: {
		            color: '#fff',
		            fontFamily: 'sans-serif'
		        }
		    }
		};

		// For apply theme
	tui.chart.registerTheme('myTheme', theme);	
	options2.theme = 'myTheme';	
	if($('#chart-area2').children() != null){
		$('#chart-area2').children().hide();	
	}
	tui.chart.pieChart(container2, data2, options2);
	$("#tbl2_p").text("[기간: "+ d1 + " ~ " + d2 + " ]");
	$("#chart2_p").text("[기간: "+ d1 + " ~ " + d2 + " ]");
	var tbody = $("<tbody>").attr("align","center");
	
	for(var i = 0; i <cData.length; i++){
		var tr1 = $("<tr>");
		var num = $("<td>").text(i+1);	    		
		var td1 = $("<td>").text(cData[i].cmpnm);
		var td2 = $("<td>").text(cData[i].amount_sum +" 원");
		var td3 = $("<td>").text(cData[i].percent + " %");			    		
		tbody.append(tr1,num,td1,td2,td3);
	}
	if($('#tbl2 tbody') != null){
		$('#tbl2 tbody').hide();
	}
	$("#tbl2").append(tbody);
		
	});
}
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
//submit 유효성 검사
function formCheck(){
	 var d1 = new Date(startDate.value);
	 var d2 = new Date(endDate.value);
    if(frm.startDate.value > frm.endDate.value) {	             
        alert("시작날짜와 종료날짜를 확인해 주세요.");
        frm.startDate.focus();
        return false;	            	        	        	
    }
   drawDonutChart1(d1,d2);
   drawDonutChart2(d1,d2);
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
		    			<li class="breadcrumb-item active" aria-current="page">판매자별 분석 통계</li>		    			
		  			 </ol>
					</nav>
				</div>
			</div>
		</div>		
		<div class="col-md-12">
			<div class="card">
				<form id="frm" name="frm" method="post" action="">
				<div class="card-header">
					<h6 class="h6">상품 분석 통계</h6>
					<hr>
					<div class="col-md-12">
						  <ul class="nav nav-tabs" role="tablist">
							  <li class="nav-item">
							      <a class="nav-link" href="AdminGoodsAnalysis.ad">상품별</a>
							  </li>
							  <li class="nav-item">
						      	  <a class="nav-link active" href="">판매자별</a>
						      </li>								    
						  </ul>
					</div>
				</div>
				<div class="card-body">										
					<div class="row">
							<div class="col-md-1 text-center pt-3 row-st">검색기간</div>
							<div class="col-md-4 pt-1 row-st">
											<button type="button" class="btn btn-primary btn-sm" id="day" name="day">오늘</button>											
											<button type="button" class="btn btn-primary btn-sm" id="t_day" name="t_day">3일</button>
											<button type="button" class="btn btn-primary btn-sm" id="s_day" name="s_day">7일</button>
											<button type="button" class="btn btn-primary btn-sm" id="o_mon" name="o_mon">1개월</button>
											<button type="button" class="btn btn-primary btn-sm" id="t_mon" name="t_mon">3개월</button>
											<button type="button" class="btn btn-primary btn-sm" id="s_mon" name="s_mon">6개월</button>
											<button type="button" class="btn btn-primary btn-sm" id="o_year" name="o_year">1년</button>																					
											<button type="button" class="btn btn-primary btn-sm" id="d_all" name="d_all">전체</button>
							</div>
							<!-- datepicker -->
							<div class="col-md-2 pt-1 row-st"> 																					
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="startDate" name="startDate" placeholder="시작일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="startDate" class="fa fa-calendar" style="cursor:pointer;">
								    			
								    		</label>
								    	</div>								    	
								 	</div>								 	
							    </div>																
							</div>
							<span class="pt-3">
							 ~
							</span>
							<!-- datepicker -->							
							<div class="col-md-2 pt-1 row-st"> 								
								<div class="input-group date" >								  
								    <input type="text" class="form-control" id="endDate" name="endDate" placeholder="종료일">
								    <div class="input-group-append">								    	
								    	<div class="input-group-text">
								    		<label for="endDate" class="fa fa-calendar" style="cursor:pointer;">								    			
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
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<div class="row">							
							<div class="col-md-3 row-st">
								<h6>판매자별 판매량 통계</h6>
							</div>
							<div class="col-md-5 row-st"></div>
							<div class="col-md-4 text-right">
								<p id="chart1_p"></p>
							</div>
					</div>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
					<!-- Donut chart1 api -->
						<div id="col-md-12">
							<div id="chart-area1"></div>
						</div>
					</div>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<div class="row">							
							<div class="col-md-3 row-st">
								<h6>판매자별 판매액 통계</h6>
							</div>
							<div class="col-md-5 row-st"></div>
							<div class="col-md-4 text-right">
								<p id="chart2_p"></p>
							</div>
					</div>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
					<!-- Donut chart2 api -->
						<div id="col-md-12 ">
							<div id="chart-area2"></div>
						</div>
					</div>
				</div>
				<div class="card-footer">
				</div>
			</div>
		</div>
		<div class="col-md-6">			
			<div class="card">
				<div class="card-header">
					<div class="row">							
					</div>
						<div class="row">							
							<div class="col-md-3 row-st">
								<h6>판매자별 판매량 순위</h6>
							</div>
							<div class="col-md-5 row-st"></div>
							<div class="col-md-4 text-right">
								<p id="tbl1_p"></p>
							</div>
						</div>
						<div class="row">							
							<div class="col-md-5 row-st"></div>
							<div class="col-md-5 row-st"></div>
							<div class="col-md-2 row-st">
								<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>								
							</div>							
						</div>
						<hr>
				</div>
				
				<div class="card-body">
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed" id="tbl1" name="tbl1">
		                    <thead class="text-primary text-center">
		                    <tr>		                      
		                      <th>순위</th>		                      				                     		                      		                        			                    
		                      <th>상호명</th>
		                      <th>판매량</th>		                        	
		                      <th>점유율</th>							  
		                    </tr>  	
		                    </thead>
		                    
		                  </table>
                		</div>
				</div>
				
				<div class="card-footer">
				</div>
			</div>
		</div>
		<div class="col-md-6">			
			<div class="card">
				<div class="card-header">
					<div class="row">							
					</div>
						
						<div class="row">							
							<div class="col-md-3 row-st">
								<h6>판매자별 판매액 순위</h6>
							</div>
							<div class="col-md-5 row-st"></div>
							<div class="col-md-4 text-right">
								<p id="tbl2_p"></p>
							</div>
						</div>
						<div class="row">							
							<div class="col-md-5 row-st"></div>
							<div class="col-md-5 row-st"></div>
							<div class="col-md-2 row-st">
								<button type="button" class="btn btn-success btn-sm">엑셀다운로드</button>								
							</div>							
						</div>
						<hr>
				</div>
				
				<div class="card-body">
						<div class="table-responsive" style="overflow:hidden;">
		                  <table class="table table-hover table-condensed" id="tbl2" name="tbl2">
		                    <thead class="text-primary text-center">
		                    <tr>		                      
		                      <th>순위</th>		                      				                     		                      		                        			                    
		                      <th>상호명</th>
		                      <th>판매액</th>		                        	
		                      <th>점유율</th>							  
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
	    	/* ,startDate: $("#startDate").val() + '+1d' */
	    	,uiLibrary: 'bootstrap4'
	    	/* ,showOn: "both"  
	        ,buttonImage: "../assets/icon/calendar.png" 
	        ,buttonImageOnly: true  */
	        ,language:"ko"
	        ,todayHighlight : true
	        ,autoclose: true
	    });			    	    	  
	</script>
</body>
</html>