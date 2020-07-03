<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	String gdNum =request.getParameter("gdNum");
	String query = "delete from goodsInfo_tbl where gdNum="+gdNum;
	dbconnection.exec_sql(query);
	
	

%>	
<script>
	console.log("query = <%=query%>");
	location.href="gdSale.jsp";
</script>