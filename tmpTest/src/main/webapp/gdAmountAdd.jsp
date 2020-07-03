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
	<%
		String gdNum = request.getParameter("gdNum");
		System.out.println(gdNum);
		ResultSet rs = null;
		String ss="none";
		String cs="none";
		String query = "select a.gdName,b.cgName,b.cgCode,b.cgCodeRef from goodsInfo_tbl a, goodsCg_tbl b where b.cgCode= a.gdCg and a.gdNum = "+gdNum;
		rs = dbconnection.exec_sql(query);
		if(rs.next()){
			String ccc= rs.getString(4);
			switch(ccc){
				case "100":
					cs="block";
					ccc="상의";
					break;
				case "200":
					cs="block";
					ccc="하의";
					break;
				case "300":
					cs="none";
					ss="block";
					ccc="신발";
					break;
				case "400":
					ss = "none";
					cs = "none";
					ccc="가방";
					break;
				case "500":
					ss = "none";
					cs = "none";
					ccc="모자";
					break;
				case "600":
					ss = "none";
					cs = "none";
					ccc="액세서리";
					break;
			}
	%>
	<h2>상품수량 등록 테이블</h2>
	<form action="gdAmountAddAction.jsp" method="post">
		<table>
			<tr>
				<th>상품번호</th>
				<td><%=gdNum %></td>
				<input type="hidden" name="gdNum" value="<%=gdNum %>" />
			</tr>
			<tr>
				<th>상품명</th>
				<td><%=rs.getString(1) %></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<label>1차 분류</label>
					<select name="gdCode" id="ss">
					<option value="<%=rs.getString(4)%>"><%=ccc %></option>
					</select>
					<label>2차 분류</label>
					<select id="selectBox" name="gdCg">
						<option value="<%=rs.getString(3)%>"><%=rs.getString(2) %></option>
					</select>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<th>수량</th>
				<td><input type="text" name="gdAmount" /></td>
			</tr>
			<%
				if(cs.equals("block")){
					String gdss= "null";
			%>
			<tr>
				<th>의류 사이즈</th>
				<td>
					<div class="cs size">
						<select name="gdCs">
							<option value="null" selected>===선택===</option>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="XL">XL</option>
						</select>
					</div>
				</td>
			</tr>
			<%
				}else{
					String gdcs= "null";
			%>
			<tr>
				<th>신발 사이즈</th>
				<td>
					<div class="ss size">
						<select name="gdSs">
							<option value="null" selected>===선택===</option>
							<option value="220">220</option>
							<option value="225">225</option>
							<option value="230">230</option>
							<option value="235">235</option>
							<option value="240">240</option>
							<option value="245">245</option>
							<option value="250">250</option>
							<option value="255">255</option>
							<option value="260">260</option>
							<option value="265">265</option>
							<option value="270">270</option>
							<option value="275">275</option>
							<option value="280">280</option>
							<option value="285">285</option>
							<option value="290">290</option>	
							<option value="295">295</option>
							<option value="300">300</option>
						</select>
					</div>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="2">
					<input type="submit"  value="등록"/>
				</td>
			</tr>			
		</table>
		
	</form>
</body>
</html>