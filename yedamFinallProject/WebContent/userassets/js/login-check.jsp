<%@page import="co.nambbang.app.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("userid");
	String pw = request.getParameter("password");
	UsersDao dao = new UsersDao();
	int check = dao.isLoginCheck(id,pw);
	
	if(check==1){
	%>
		 <script>
		 	alert("로그인 실패. 다시입력하세요")
		 
		 </script>
		 
	<%
	
		 }else{
		%>
			 <script>
			 	alert("로그인 성공. ")
			 
			 </script>	 
			 <%
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>