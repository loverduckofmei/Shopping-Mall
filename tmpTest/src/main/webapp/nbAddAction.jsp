<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	request.setCharacterEncoding("UTF-8");
	String nbNum = request.getParameter("nbNum");
	String nbTitle = request.getParameter("nbTitle");
	String ID = request.getParameter("userID");
	String nbCm = request.getParameter("nbCm");
	String nbCon = request.getParameter("nbCon");
	String nbImg = request.getParameter("nbImg");
	String nullCheck ;
	String query ;
	if(nbImg.equals("")){
		nullCheck = "널값?";
		query = "insert into noticeBoard_tbl values('"+nbNum+"','"+nbTitle+"','"+ID+"','"+nbCm+"','"+nbCon+"')";
	}else{
		nullCheck =" 입력완료!";
		query = "insert into noticeBoard_tbl values('"+nbNum+"','"+nbTitle+"','"+ID+"','"+nbCm+"','"+nbCon+"','"+nbImg+"')";
	}
	dbconnection.exec_sql(query);
	
%>
<script>
	console.log(ID = "<%=ID%>");
	console.log(nbNum = "<%=nbNum%>");
	console.log(nbTitle = "<%=nbTitle%>");
	console.log(nbCm = "<%=nbCm%>");
	console.log(nbCon = "<%=nbCon%>");
	console.log(nbImg = "<%=nbImg%>");
	console.log(nullCheck = "<%=nullCheck%>");
	console.log(query = "<%=query%>");
	location.href = "nbLookup.jsp";
	
</script>
