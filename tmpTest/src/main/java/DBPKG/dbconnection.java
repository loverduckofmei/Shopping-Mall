package DBPKG;

import java.sql.*;

public class dbconnection {	
	public static Connection getConnection() throws Exception{
	
	Class.forName("org.postgresql.Driver");
	String url="jdbc:postgresql://localhost:5433/testDB";
	String user = "postgres";
	String passwd = "1234";
	Connection con = null;
	con = DriverManager.getConnection(url,user,passwd);
	return con;
	}
	public static ResultSet exec_sql(String args) {
		ResultSet rs = null;
		Statement st = null;
		Connection conn = null;
		
		try {
			String query = args;
			conn = dbconnection.getConnection();
			st = conn.createStatement();
			
			rs = st.executeQuery(query);
		}catch(Exception e) {
			System.out.println("Error!! : "+e.toString());
		}
		return rs;
	}
}