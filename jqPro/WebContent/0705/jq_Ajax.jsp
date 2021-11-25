<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="kr.or.ddit.ibatis.config.BuildedSqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

//요청데이터 가져오기 -ID,PW
String userId = request.getParameter("id");	
String userPw = request.getParameter("pw");	

//sqlMapClient 객체 얻기
SqlMapClient smc = BuildedSqlMapClient.getSqlMapClient();

//sql실행(namespace.id)
Map<String, String> map = new HashMap<String,String>();

map.put("mid", userId);
map.put("mpw", userPw);

MemberVO vo = (MemberVO)smc.queryForObject("mem.Login",map);

//결과를 vo 객체러 볻아서 응답데이터 생성
if(vo != null){
	//jsonObject생성
%>
	{
		"sw" : "ok",
		"name" : "<%=vo.getMem_name() %>"
	}


<%	
}else{//if end
%>
	{
		"sw" : "no"
	}

<%
}
%>