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
<table border="1">
	<tr>
		<td>아이디</td>
		<td>지유</td>
		<td>엔앰</td>
	</tr>

<%
while(rs.next()){
	String id = rs.getString("lprod_id");
	String gu = rs.getString("lprod_gu");
	String nm = rs.getString("lprod_nm");
%>
	<tr>
		<td><%=id %></td>
		<td><%=gu %></td>
		<td><%=nm %></td>
	</tr>
<%	
}//while end
%>
</table>

 