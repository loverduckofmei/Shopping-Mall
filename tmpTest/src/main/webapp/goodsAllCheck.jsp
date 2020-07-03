<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/style.css" />
<style>
        *{margin: 0; padding: 0; box-sizing: border-box;}
        ul,li{list-style: none;}
        a{text-decoration: none; color: black;}
        .goods_wrap{width: 1000px; height: 1000px; margin: 0 auto; border: solid 1px black; display: flex; flex-wrap: wrap;}
        .goods_wrap > .goods_box{border: solid 1px blue; width: calc(100%/5); height: calc(100%/4);}
        .goods_box > .goods_img{position: relative; width: 100%; height: 70%; background: #a29bef;}
        .goods_des >ul>li span {float: right;}
        .goods_img>a{position: absolute; width: 100%; height: 100%; background: lightseagreen;}
        .goods_img>a>img{position: relative; width: 100%; height: 100%; background-size: cover;}
</style>
</head>
<body>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/header.jsp"%>
	<%@include file="./WEB-INF/jsp/egovframework/example/sample/nav.jsp"%>
	<ul class="goods_wrap">
	<%
		ResultSet rs = null;
		String query= "select a.gdNum,a.gdImg, a.gdBrand, a.gdName, b.cgName, a.gdPrice from goodsInfo_tbl a , goodsCg_tbl b where a.gdCg = b.cgCode order by a.gdCg";
		rs = dbconnection.exec_sql(query);
		while(rs.next()){
	%>           
        <li class="goods_box">
            <div class="goods_img">
                <a class="img" href="gdLookup.jsp?gdNum=<%=rs.getString(1) %>"><img src="" alt="상품 이미지"></a>
            </div>
            <div class="goods_des">
                <ul>
                    <li><%=rs.getString(3) %> <span class="right"><%=rs.getString(6) %>원</span></li>
                    <li><%=rs.getString(4) %></li>
                    <li><%=rs.getString(5) %></li>       
                </ul>
            </div>
        </li>
        <%
			}
        %>
    </ul>
	<!-- select a.gdImg, a.gdName, a.gdBrand, b.cgName, a.gdPrice from goodsInfo_tbl a , goodsCg_tbl b where a.gdCg = b.cgCode order by a.gdCg; -->
</body>
</html>