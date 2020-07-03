<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	String gdNum =request.getParameter("gdNum");
	String gdAmount = request.getParameter("gdAmount");
	String gdSs = request.getParameter("gdSs");
	String gdCs = request.getParameter("gdCs");
	
	
	String query = "insert into amount_tbl(gdNum,gdAmount,gdCs,gdSs) values('"+gdNum+"','"+gdAmount+"','"+gdCs+"',"+gdSs+" )";
	dbconnection.exec_sql(query);
	
	

%>	
<script>
	console.log("gd Ss = <%=gdSs%>");
	console.log("gdCs = <%=gdCs%>");
	console.log("query = <%=query%>")
	 // location.href="goodsAllCheck.jsp";
</script>
