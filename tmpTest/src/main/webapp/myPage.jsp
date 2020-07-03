<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<body>
	<div class="content">
		<h2><strong>마이 페이지</strong></h2>
		
		<div>
			<%
				ResultSet rs = null;
				String aaa = (String)session.getAttribute("ID");
				String query = "select * from userInfo_tbl where userID = '"+aaa+"'";
				rs = dbconnection.exec_sql(query);
				if(rs.next()){
			%>
			<p><%=rs.getString(1) %></p>
			<p><%=rs.getString(2) %></p>
			<p><%=rs.getString(3) %></p>
			<p><%=rs.getString(4) %></p>
			<p><%=rs.getString(5) %></p>
			<p><%=rs.getString(6) %></p>
			<p><%=rs.getString(7) %></p>
			<p><%=rs.getString(8) %></p>
			<p><%=rs.getString(9) %></p>
			<p><%=rs.getString(10) %></p>
			<p><%=rs.getString(11) %></p>
			<p><%=rs.getString(12) %></p>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>