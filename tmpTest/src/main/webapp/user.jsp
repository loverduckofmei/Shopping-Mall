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
	<div class="wrap">
		<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
		<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
		<div class="content">
			<h2><strong>회원 매출</strong></h2>
			<table>
				<tr>
					<th>아이디</th>
					<th>비번</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>전번</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>이메일</th>
					<th>등급</th>
					<th>본인인증 여부</th>
					<th>관리자 여부</th>
				</tr>
				<%
					ResultSet rs = null;
					String query = "select * from userInfo_tbl";
					rs = dbconnection.exec_sql(query);
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
					<td><%=rs.getString(11)%></td>
					<td><%=rs.getString(12)%></td>
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