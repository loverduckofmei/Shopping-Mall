<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String gdNum = request.getParameter("gdNum"); // int
	String gdName = request.getParameter("gdName");
	String gdBrand = request.getParameter("gdBrand");
	String gdCg = request.getParameter("gdCg"); //int
	String gdPrice = request.getParameter("gdPrice"); //int
	String gdDes = request.getParameter("gdDes");
	String gdImg = request.getParameter("gdImg");
	String gdGender = request.getParameter("gdGender");
	String query="insert into goodsInfo_tbl values("+gdNum+",'"+gdName+"','"+gdBrand+"','"+gdCg+"',"+gdPrice+",'"+gdDes+"','"+gdImg+"','"+gdGender+"')";	
	dbconnection.exec_sql(query);
	

%>
<script>
 	location.href= "gdAmountAdd.jsp?gdNum=<%=gdNum%>";	
</script>