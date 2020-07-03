<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/bootstrap.min.css" />
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="#" style="width: 100%; height:100%" alt="상품 이미지" >
			</div>
			<%
				String gdNum =request.getParameter("gdNum");
				ResultSet rs =null;
				String query = "select * from goodsInfo_tbl where gdNum="+gdNum;
				rs = dbconnection.exec_sql(query);
				if(rs.next()){
				
			%>
				<div class="col-md-7">
					<h3><%=rs.getString(2) %></h3> <br>
					<p><%=rs.getString(6)%></p>
					<p><b>브랜드 </b> : <%=rs.getString(10)%>
					<p><b>상품 코드 : </b><span class="badge badge-danger"><%=gdNum %></span>
					<p><b>카테고리</b> : <%=rs.getString(3) %>
					<p><b>가격</b> : <%=rs.getString(4) %>
					<p><b>수량</b> : <%=rs.getString(5) %>
					<p><b>사이즈 </b> : <%=rs.getString(9) %>
					<%=rs.getString(8) %>옷</p>
					<p><strong></strong>
					
				</div>
			<%
				}
			%>
			</div>
		</div>
</body>
</html>