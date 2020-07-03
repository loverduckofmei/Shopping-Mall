<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	String userName = request.getParameter("userName");
	String userNickname = request.getParameter("userNickname");
	String userGender = request.getParameter("userGender");
	String userPhone = request.getParameter("userPhone");
	String userAddr = request.getParameter("userAddr");
	String userEmail = request.getParameter("userEmail");
	String userAdmin = request.getParameter("userAdmin");
	
	String query = "insert into userInfo_tbl(userID,userPW,userName,userNickname,userGender,userPhone,userAddr,userEmail,userAdmin) values('"+userID+"','"+userPW+"','"+userName+"','"+userNickname+"','"+userGender+"','"+userPhone+"','"+userAddr+"','"+userEmail+"','"+userAdmin+"')";
	dbconnection.exec_sql(query);
%>
<script>
	location.href= "login.jsp";
</script>