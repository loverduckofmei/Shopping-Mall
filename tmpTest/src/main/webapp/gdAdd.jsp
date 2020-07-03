<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
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
<script src="./js/common.js"></script>
</head>
<body>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
	<div class="content">
		<h2><strong>상품등록</strong></h2>
		<form action="gdAddAction.jsp" method="post">
			<table>
				<tr>
					<%
						ResultSet rs2 = null;
						String query2 = "select max(gdNum) from goodsInfo_tbl";
						rs2 = dbconnection.exec_sql(query2);
						if(rs2.next()){
							Integer gdNum = Integer.parseInt(rs2.getString(1))+1;
					%>
					<th>상품번호(자동채번)</th>
					<td><input type="text" name="gdNum" value="<%=gdNum %>"/></td>
					<%
						}
					%>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="gdName" /></td>
				</tr>
				<tr>
					<th>브랜드이름</th>
					<td><input type="text" name="gdBrand" /></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<label>1차 분류</label>
						<select name="gdCode" id="ss">
						<option value="0">전체</option>
						<%
							ResultSet rs =null;
							String query ="select cgCode,cgName from goodsCg_tbl where cgCode like '%00%'";
							rs = dbconnection.exec_sql(query);
							while(rs.next()){
						%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(2) %></option>
						<%
							}	
						%>
						</select>
						<label>2차 분류</label>
						<select id="selectBox" name="gdCg">
							<option value="0">전체</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="gdPrice" />원</td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td><input type="text" name="gdDes" /></td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td><input type="file" name="gdImg" /></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label for="man"><input type="radio" id="man" name="gdGender" value="man"/>남성용</label>
						<label for="woman"><input type="radio" id="woman" name="gdGender" value="woman"/>여성용</label>
						<label for="unisex"><input type="radio" id="unisex" name="gdGender" value="unisex"/>공용</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="submit" type="submit">등록</button>
						<button class="submit" type="button" onclick="location.href = 'lookupStdInfo.jsp' ">조회</button>
					</td>				
				</tr>
			</table>						
		</form>
	</div>

</body>
</html>