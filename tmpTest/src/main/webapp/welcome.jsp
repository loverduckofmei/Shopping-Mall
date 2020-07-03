<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/style.css" />

</head>
<body>
<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
<%
	String ad = (String)session.getAttribute("admin");
	String Nn = (String)session.getAttribute("NN");
	System.out.println(ad);
	System.out.println(NN);
	if(Nn != null){
%>
<h2><%=Nn%> <%=ad%>님 환영합니다.</h2>
<%
	}
%>
</body>
</html>