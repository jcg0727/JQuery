<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "JCG92", "java");


Statement stmt=conn.createStatement();

String sql = "select * from lprod";

ResultSet rs = stmt.executeQuery(sql);
%>
[
<%
int i = 0;
while(rs.next()){
	String id = rs.getString("lprod_id");
	String gu = rs.getString("lprod_gu");
	String nm = rs.getString("lprod_nm");
	
	if(i>0) out.print(",");
%> 
	{
		"mid" : "<%=id %>",
		"mgu" : "<%=gu %>",
		"mnm" : "<%=nm %>"
	}
<%
i++;
}
%>
]
 