<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet type="text/css" href="css/board.css">
<script>
function transName(n){
	frm.action="boardNameSearch.do";
	frm.name.value=n;
	frm.submit();
}

 function transData(n){
	 frm.action="boardView.do";
	 frm.id.value=n;
	 frm.submit();
 }
</script>
</head>
<body>
입력 완료되었습니다. 
	<%-- <div align="center">
		<div>
			<h1>게시판 목록</h1>
		</div>
		<div>
		<!-- <form id="frm" name="frm" action="boardView.do" method="post"> -->
		<form id="frm" name="frm" action="" method="post">
				<input type="hidden" id="id" name="id">
				<input type="hidden" id="name" name="name">
			<table cellpadding="5px">
				<tr align="center" height="30" >
					<th width="50">순번</th>
					<th width="70">작성자</th>
					<th width="300">제목</th>
					<th width="100">작성일</th>
					<th width="50">조회수</th>
				</tr>
				<c:forEach var="dto" items="${list }">
					<tr class="tr" align="center">
						<td class="td" width="50">${dto.id }</td>
						<td class="td" width="70" onclick="transName('${dto.name }')">${dto.name }</td>
						<td class="td" width="200" onclick="transData(${dto.id})">${dto.title }</td>
						<td class="td" width="100">${dto.wDate }</td>
						<td class="td" width="50">${dto.hit }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		</div>
		<div>
			<br />
			<button type="button" onclick="location.href='boardWrite.do'">글쓰기</button>&nbsp;&nbsp; 
			<button type="button" onclick="location.href='index.do'">홈으로</button>
		</div>
	</div> --%>
</body>
</html>