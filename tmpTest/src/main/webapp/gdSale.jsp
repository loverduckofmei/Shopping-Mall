<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<div class="wrap">
		<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
		<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
		<div class="content">
			<h2><strong>상품매출</strong></h2>
			<table>
				<tr>
					<td colspan="7">
						<button class="btn">ajax 연결 시도</button>
						<input type="button" value="상품 매출 순"/>
						<input type="button" value="브랜드 매출 순" />
						<input type="button" value="카테고리 매출 순"/>
					</td>
				</tr>
				<tr>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품브랜드</th>
					<th>카테고리</th>
					<th>가격</th>
					<th>수량</th>
					<th>총매출액</th>
				</tr>
				<%
					ResultSet rs = null;
					String query = "select gi.gdNum ,gi.gdName, gi.gdBrand ,gc.cgName, gi.gdPrice, sum(ga.gdAmount),sum(gi.gdPrice * ga.gdAmount) gdSale from goodsInfo_tbl gi, goodsCg_tbl gc, amount_tbl ga where gi.gdNum = ga.gdNum and gi.gdCg = gc.cgcode group by gi.gdName, gi.gdDes, gi.gdBrand , gi.gdNum ,gc.cgName, gi.gdPrice, gi.gdGender order by gdSale desc";
					String query2= "select gi.gdBrand ,sum(gi.gdPrice * ga.gdAmount) gdSale from goodsInfo_tbl gi, goodsCg_tbl gc, amount_tbl ga where gi.gdNum = ga.gdNum and gi.gdCg = gc.cgcode group by gi.gdBrand order by gdSale desc";
					String query3= "select gi.gdNum ,gi.gdName, gi.gdBrand ,gc.cgName, gi.gdPrice, sum(ga.gdAmount),sum(gi.gdPrice * ga.gdAmount) gdSale from goodsInfo_tbl gi, goodsCg_tbl gc, amount_tbl ga where gi.gdNum = ga.gdNum and gi.gdCg = gc.cgcode group by gi.gdName, gi.gdDes, gi.gdBrand , gi.gdNum ,gc.cgName, gi.gdPrice, gi.gdGender order by gi.gdCg,gdSale desc";
					rs = dbconnection.exec_sql(query);
					while (rs.next()) {
				%>
				<tr>
					<td><span class="badge badge-danger"><a style=" color: black; text-decoration: none;" href="gdLookup.jsp?gdNum=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></span></td>
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
	<script>
		$('.btn').on('click',function(){
			$.ajax({
				type : "post",
				url : "gdAll.jsp",
				datatype : "text",
				success : function(data){
					console.log(data);
				},
				error: function(){
					console.log("통신실패");
				}
			})
		})
	</script>
</body>
</html>