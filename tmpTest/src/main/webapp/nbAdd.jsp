<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/bootstrap.min.css" />
<link rel="stylesheet" href="./css/egovframework/style.css" />
</head>
<body>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" style="font-size: 30px">OO게시판 글쓰기</h1>
		</div>
	</div>
	<div class="container">
	<%
		ResultSet rs = null;
		String query = "select max(nbNum) from noticeBoard_tbl";
		rs = dbconnection.exec_sql(query);
		if(rs.next()){
			int nbNum = Integer.parseInt(rs.getString(1))+1;
		
	%>
		<form action="nbAddAction.jsp" class="form-horizontal" method="post" >
			<div class="form-group row">
				<label class="col-sm-2">게시물 번호</label>
				<div class="col-sm-3">
					<input type="text" name="nbNum" class="form-control" readonly="readonly" value="<%=nbNum%>">
				</div>
			</div>
			<%
			}
			String wt = (String)session.getAttribute("ID");
			%>
			<div class="form-group row">
				<label class="col-sm-2">작성자</label>
				<div class="col-sm-3">
					<input type="text" name="userID" readonly="readonly" value="<%=wt %>" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">게시물 제목</label>
				<div class="col-sm-3">
					<input type="text" name="nbTitle" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">커뮤니티</label>
				<div class="col-sm-3">
					<select name="nbCm">
						<option value="OO게시판">OO게시판</option>
						<option value="△△게시판">△△게시판</option>
						<option value="세일 정보">세일 정보</option>
						<option value="룩북">룩북</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-5">
					<textarea name="nbCon" cols="60" rows="10"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">첨부 파일</label>
				<div class="col-sm-5">
					<input type="file" name="nbImg" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="글쓰기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>