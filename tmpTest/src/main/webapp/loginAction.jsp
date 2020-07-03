<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	request.setCharacterEncoding("UTF-8");
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	ResultSet rs =null;
	String query = "select userPW,userAdmin,userNickName from userInfo_tbl where userID= '"+ID+"' ";
	rs = dbconnection.exec_sql(query);
	if(rs.next()){
	System.out.println("query = "+rs.getString(1));
	System.out.println("PW = "+PW);
		if(PW.equals(rs.getString(1))){
			out.println("<script>alert('로그인 성공.'); </script>");
			session.setAttribute("ID", ID);
			session.setAttribute("admin", rs.getString(2));
			session.setAttribute("NN", rs.getString(3));
			response.sendRedirect("welcome.jsp");
		}else if(PW != rs.getString(1)){
			out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
		}
	}else{
		out.println("<script>alert('존재하지 않는 아이디입니다.'); history.back();</script>");
	}
	
%>