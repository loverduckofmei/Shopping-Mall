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
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
	<form name="userLogin" method="post" action="loginAction.jsp">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="ID" placeholder="ID를 입력하세요." /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="PW" placeholder="비밀번호를 입력하세요." /><button type="button" class="pw">보기</button></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" />
					<input type="button" onclick="location.href='userJoin.jsp'" value="회원가입" />
				</td>
			</tr>
		</table>
		
	</form>
</body>
<script>
$('.pw').on('click',function(){
	console.log("asdasd");
	$('.pw').toggleClass('active');
	if($('.pw').hasClass('active')){
    	$('.pw').prev('input').attr("type","text");
	}else{
    	$('.pw').prev('input').attr("type","password");
	}
});
</script>
</html>