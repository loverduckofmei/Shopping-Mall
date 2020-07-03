<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/style.css" />
<link rel="stylesheet" href="./css/egovframework/sample.css" />
<link rel="stylesheet" href="./css/egovframework/bootstrap.min.css" />
</head>
<body>
	<div class="wrap">
		<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
		<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
		<div class="content">
			<h2><strong>상품매출</strong></h2>
			<table>
				<tr>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품브랜드</th>
					<th>카테고리</th>
					<th>가격</th>
					<th>남은수량</th>
					    
				</tr>
				<%
					ResultSet rs = null;
					String query = "select gi.gdNum, gi.gdName, gi.gdBrand, gc.cgname, gi.gdPrice, ga.gdAmount, sum(gi.gdPrice * ga.gdAmount) gdSale  from goodsInfo_tbl gi, goodsCg_tbl gc, amount_tbl ga where gi.gdCg = gc.cgCode and gi.gdNum = ga.gdNum group by gi.gdNum, gi.gdName, gi.gdBrand, gc.cgname, gi.gdPrice, ga.gdAmount order by gdSale desc";
					rs = dbconnection.exec_sql(query);
					while (rs.next()) {
				%>
				<tr>
					<td><span class="badge badge-danger"><a style=" color: snow; text-decoration: none;" href="gdLookup.jsp?gdNum=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></span></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<%@include file="./WEB-INF/jsp/egovframework/example/sample/footer.jsp"%>
	</div>
</body>
</html>