<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/egovframework/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="#" style="width: 100%; height:100%" alt="상품 이미지" >
			</div>
			<%
				String gdNum =request.getParameter("gdNum");
				ResultSet rs =null;
				String query = "select a.gdNum ,a.gdName, a.gdDes, a.gdBrand ,b.cgName, a.gdPrice, a.gdGender from goodsInfo_tbl a, goodsCg_tbl b where a.gdNum = '"+gdNum+"'and a.gdCg = b.cgCode;";
				rs = dbconnection.exec_sql(query);
				if(rs.next()){
			%>
			<table>
				<tr>
					<th>상품코드</th>
					<td><span class="badge badge-danger"><%=gdNum%></span></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><%=rs.getString(2) %></td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td><%=rs.getString(3) %></td>
				</tr>
				<tr>
					<th>브랜드</th>
					<td><%=rs.getString(4) %></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><%=rs.getString(5) %></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><%=rs.getString(6) %></td>
				</tr>
				<tr>
					<th>수량</th>
					<td>
					<%
						ResultSet rs2= null;
						
						String query2 = "select gdCs, gdSs, sum(gdAmount) from amount_tbl where gdNum = '"+gdNum+"' group by gdCs, gdSs";
						rs2= dbconnection.exec_sql(query2);						
						String a= "0";
						String gdSs[];
						String gdCs = null;
						while(rs2.next()){
							System.out.println(rs2.getString(1));

							System.out.println(rs2.getString(3));
							if(rs2.getString(1).equals("null")){
					%>
					<p><%=rs2.getString(2) %><span>남은 수량 : <%=rs2.getString(3) %></span></p>
					<%
						a= "1";
						
						}else{	
					%>
					<p><%=rs2.getString(1)%><span>남은 수량 : <%=rs2.getString(3) %></span></p>
					<%
					
						a= "2";
						gdCs=rs2.getString(1);
						}
						} if(a== "0"){
					%>
					<p><span class="badge badge-danger">SOLD OUT</span></p>
					<%		
						}
					%>
					</td>
				</tr>
				<tr>
					<th>옷 구별</th>
					<td><%=rs.getString(7) %></td>
				</tr>

			<%
				}
				String Admin= (String)session.getAttribute("admin");
				if(Admin.equals("관리자")){
			%>
				<tr>
					<td colspan="2">
						<button type="button" class="s" >수량 등록하기</button>
						<button type="button" class="d" >상품 삭제하기</button>
					</td>
				</tr>
				<%
				}else{
				%>
				<tr>
					<td>
						<select name="abc">
							<%	
								
							%>
							<option value=""></option>
						</select>
					</td>				
				</tr>
					<tr>
						<td colspan="2">
							<button>바로구매</button>
							<button onclick="location.href='addCartAction.jsp?gdNum='+<%=gdNum%>">장바구니 담기</button>
							<button>찜하기</button>
						</td>
					</tr>
				<%
				}
				%>
			</table>
			</div>
		</div>
		<script>
			var gdNum = <%=gdNum%>;
			$('.s').on('click',function(){
				location.href="gdAmountAdd.jsp?gdNum="+gdNum;
			});
			$('.d').on('click',function(){
				location.href="gdDelete.jsp?gdNum="+gdNum;
			});
		</script>
</body>
</html>