<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
 	<select name="gdSize">
		<%
			
			ResultSet rs = null;
			String query = "select a.gdcg,c.gdCs , c.gdSs, c.gdamount from goodsInfo_tbl a,amount_tbl c where a.gdNum = c.gdNum and a.gdNum = 10014";
			rs = dbconnection.exec_sql(query);
			String a= "0";
			while(rs.next()){
				Integer cg = Integer.parseInt(rs.getString(1))/100;
				if(cg ==1 ||  cg ==2){
		%>
			<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
			<%
				}else if(cg == 3){
			%>
			<option value="<%=rs.getString(3)%>"><%=rs.getString(3)%></option>
			<%
				}}
			%>
	</select> 
	<select name="ass" id="">
	<%
		ResultSet r = null;
		String q ; 
		if(a.equals("1")){
			q = "select gdAmount from amount_tbl where gdNum = 10014 ";
			rs = dbconnection.exec_sql(q);
		}else if (a.equals("2")){
			
		}
		
		if(rs.next()){
			int b= Integer.parseInt(rs.getString(1));
			System.out.println(a);
		for(int i = 1; i<=b; i++){
	%>
	
	<option value="<%=i%>"><%=i %></option>
  	<%
  		}}
  	%>
	</select>

</body>
</html>