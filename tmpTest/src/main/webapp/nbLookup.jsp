<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
	<table>
		<tr>
			<th>게시물 번호</th>
			<th>커뮤니티</th>
			<th>작성자</th>
			<th>게시물 제목</th>
			<th>작성일자</th>
			<th>좋아요 수</th>
			<th>조회 수</th>
		</tr>
		<%
			ResultSet rs = null;
			String query = "select nbNum, nbCm, userID, nbTitle, nbJD, nblike, nbread from noticeBoard_tbl order by nbNum desc";
			rs = dbconnection.exec_sql(query);
			while(rs.next()){
		%>
		<tr class="<%=rs.getString(1)%>">
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<script>
			$('.<%=rs.getString(1)%>').on('click',function(){
				console.log("click: <%=rs.getString(1)%>");
				location.href = "nbCon.jsp?nbNum="+<%=rs.getString(1)%>;
			})		
		</script>
		<%
			}
		%>
	</table>

</body>
</html>