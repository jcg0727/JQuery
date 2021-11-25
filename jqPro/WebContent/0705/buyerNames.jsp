<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.BuildedSqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//sqlMapClient 객체 얻기
SqlMapClient smc = BuildedSqlMapClient.getSqlMapClient();
//sql 구문 실행
List<BuyerVO> list = smc.queryForList("buyer.buyerNames");

//응답데이터 생성 - jsonObjectArray생성
%>
[
<% 
for(int i=0; i<list.size(); i++){
	BuyerVO vo = list.get(i);
	if(i>0) out.print(",");
%>	
	{
		"id" : "<%=vo.getBuyer_id() %>",
		"name" : "<%=vo.getBuyer_name() %>"
	}
<% 
}
%>
]