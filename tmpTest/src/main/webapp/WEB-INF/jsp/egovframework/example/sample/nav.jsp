<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	String ID= (String)session.getAttribute("ID");
	String NN= (String)session.getAttribute("NN");
	String admin= (String)session.getAttribute("admin");
	
	if(ID != null && admin.equals("관리자")){
%>
<div class="gnb">
	<ul>
		<li><a href="#">상품</a>
			<ul class="sub_memu">
				<li><a href="goodsAllCheck.jsp">상품 조회</a></li>
				<li><a href="gdAdd.jsp">상품 등록</a></li>
				<li><a href="gdSale.jsp">상품 매출 및 수정</a></li>
			</ul>
		</li>
		<li><a href="nbLookup.jsp">커뮤니티</a>
			<ul class="sub_menu">
				<li><a href="#">커뮤니티 조회 및 수정</a></li>
				<li><a href="#">커뮤니티 등록</a></li>
				<li><a href="#">게시판 글쓰기</a></li>
			</ul>
		</li>
		<li><a href="user.jsp">회원매출</a></li>
		<li><a href="welcome.jsp">홈으로</a></li>
		<li><strong><%=NN%> <%=admin%>님</strong></li>
		<li><a href="logout.jsp">로그아웃</a></li>
	</ul>
</div>
<%
	}else if(ID != null && admin.equals("회원")){
%>
<div class="gnb">
	<ul>
		<li><a href="#">커뮤니티</a></li>
		<li><a href="#">장바구니</a></li>
		<li><a href="goodsAllCheck.jsp">상품 조회</a></li>
		<li><a href="welcome.jsp">홈으로</a></li>
		<li><a href="myPage.jsp">마이페이지(내 정보)</a></li>
		<li><%=NN%> <%=admin%>님 </li>
		<li><a href="logout.jsp">로그아웃</a></li>
		
	</ul>
</div>
<%
	}else{
%>
<div class="gnb">
	<ul>
		<li><a  href="login.jsp">로그인</a></li>
	</ul>
</div>
<%
	}
%>