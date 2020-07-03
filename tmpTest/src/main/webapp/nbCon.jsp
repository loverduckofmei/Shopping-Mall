<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
		String nbNum = request.getParameter("nbNum");
		ResultSet rs = null;
		String query2 = "update noticeBoard_tbl set nbRead = nbRead+ 1 where nbNum ="+nbNum;
		rs = dbconnection.exec_sql(query2);
		
		String query = "select * from noticeBoard_tbl where nbNum ="+nbNum;
		rs = dbconnection.exec_sql(query);
		while(rs.next()){
	%>
	<div><%=rs.getString(1) %></div>
	<div><%=rs.getString(2) %></div>
	<div><%=rs.getString(3) %></div>
	<div><%=rs.getString(4) %></div>
	<div><%=rs.getString(5) %></div>
	<div><%=rs.getString(6) %></div>
	<div>조회수 : <%=rs.getString(7) %></div>
	<div>좋아요 수 : <%=rs.getString(8) %></div>
	<div><%=rs.getString(9) %></div>
	<%
		}
	%>
	<button class="like">좋아요 누르기</button>
	<button class="back">뒤로가기</button>
	<script>
		$('.back').on('click',function(){
			location.href = "nbLookup.jsp";
		})
	</script>
</body>
</html>