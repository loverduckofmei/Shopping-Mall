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
	<div class="content">
	<h2><strong>회원가입</strong></h2>
	<form name="userLogin" action="userJoinAction.jsp" method="post" onsubmit="return check()">
		<table>
			<tr>
				<th>아이디 </th>
				<td><input type="text" name="userID" placeholder="ID를 입력해주세요." /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="userPW" placeholder="영문+숫자+특수문자(8~16)" /></td>
			</tr>
			<tr>
				<th>비밀번호 확인 </th>
				<td><input type="password" name="PWCheck" placeholder="비밀번호를 확인해주세요." /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="userName"  placeholder="이름을 입력해주세요." /></td>
			</tr>
			<tr>
				<th>닉네임  </th>
				<td><input type="text" name="userNickname"  placeholder="사용할 닉네임을 입력해주세요." /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label for="man"><input type="radio" id="man" name="userGender" value="남자"/>남자</label>
					<label for="woman"><input type="radio" id="woman" name="userGender" value="여자"/>여자</label>
				</td>
			</tr>		
			<tr>
				<th>전화번호</th>
				<td><input type="tel" name="userPhone" placeholder="하이폰(-)을 빼고 입력해주세요." /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="userAddr" placeholder="00시 00구 00동"/></td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td><input type="email" name="userEmail" placeholder="example@gmail.com"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="submit" type= "submit">제출</button>
					<input type="hidden" name="userAdmin" value="회원" />
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
<script>
	function check() {
		var login= document.userLogin;
		
		var userID = login.userID.value;
		var userPW = login.userPW.value;
		var PWCheck = login.PWCheck.value;
		var userName = login.userName.value;
		var userNickname = login.userNickname.value;
		var userGender = login.userGender.value;
		var userPhone = login.userPhone.value;
		var userAddr = login.userAddr.value;
		var userEmail = login.userEmail.value;
		
		var userAdmin = login.userAdmin;
		
		/*Pattern = Pat*/
		var adminPt = /^[h]{1}[A-Za-z0-9]{3,19}$/;
		var idPt = /^[A-Za-z0-9]{3,19}$/;
		var pwPt =/^(?=.*[a-zA-Z])(?=.*[!@#$%^*.+=-])(?=.*[0-9]).{8,16}$/;
		var emailPt =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var addrPt = /[\S]+(도|시)\s[\S]+(구|군)\s[\S]+(면|동).*/i;
		
		var phonePt = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		
		console.log(userAdmin);
		
		if(idPt.test(userID) == false || userID == null){
			alert("아이디 확인 바람");
			return false;
		}else if(pwPt.test(userPW)== false){
			alert("비밀번호 확인바람");
			return false;
		}else if(userPW != PWCheck){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else if(phonePt.test(userPhone) == false){
			alert("전화번호를 작성해주세요.");
			return false;
		}else if(addrPt.test(userAddr) == false){
			alert("주소 확인 바람 ex)00시 00동 00구");
			return false;
		}else if(emailPt.test(userEmail) == false){
			alert("이메일 확인 바람");
			return false;
		}else if(adminPt.test(userID) == true){
			$(userAdmin).val("관리자");			
			alert("관리자 아이디 생성 ");
		}else{
			alert("정상 입력 완료");
		}
	}
</script>
</html>