<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    ProdVO VO = (ProdVO)request.getAttribute("voValue");
    if(vo != null){
    %>
    	
   {
   	"sw" : "ok",
   	"id" : "<%=vo.getPro %>"
   
   }   