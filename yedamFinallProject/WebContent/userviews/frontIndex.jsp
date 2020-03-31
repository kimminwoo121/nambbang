<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/yedamFinallProject/userjs/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	getLocation();
	
});

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}

function showPosition(position) {
	 
	var x = position.coords.latitude;
	document.getElementById('x').value = x;
	
	if(x == null && x.equals("")){
		document.getElementById('x').value = 128.601805491072;
	} 
	
	var y = position.coords.longitude;
	document.getElementById('y').value = y;
	
	if(y == null && y.equals("")){
		document.getElementById('y').value = 35.8713802646197;
	} 
	
  console.log("Latitude: " + position.coords.latitude);
  console.log("Longitude: " + position.coords.longitude);
  frm.submit(); 
}
</script>
</head>
<body>
	<%-- <jsp:forward page="/index.do"></jsp:forward> --%>
	<form id="frm" name="frm" action="index.do" method="post">
		<div>
			<input type="hidden" id="x" name="x" value="">
			<input type="hidden" id="y" name="y" value="">
		</div>
	</form>
</body>
</html>